import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/date_formatter.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/invoices/constants/invoices_permissions.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/data/models/requests/create_invoice_request.dart';
import 'package:invotek/features/invoices/domain/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/customer_selection_step.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/invoice_basic_info_step.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/invoice_summary_step.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/items_selection_step.dart';
import 'package:invotek/features/settings/cubit/tax_integration_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class CreateCreditInvoiceScreen extends StatefulWidget {
  final InvoiceEntity originalInvoice;

  const CreateCreditInvoiceScreen({super.key, required this.originalInvoice});

  @override
  State<CreateCreditInvoiceScreen> createState() =>
      _CreateCreditInvoiceScreenState();
}

class _CreateCreditInvoiceScreenState extends State<CreateCreditInvoiceScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;
  final Map<String, String> _validationErrors = {};

  late InvoiceFormController _formController;
  late InvoicesCubit _cubit;
  late TextEditingController _returnReasonController;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });

    _formController = InvoiceFormController();
    _returnReasonController = TextEditingController();
    _cubit = getIt<InvoicesCubit>();

    // Load original invoice data into form controller
    _loadOriginalInvoiceData();

    // تحميل حالة tax integration عند فتح الشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final taxState = context.read<TaxIntegrationCubit>().state;
      if (taxState is! TaxIntegrationLoaded &&
          taxState is! TaxIntegrationLoading) {
        context.read<TaxIntegrationCubit>().loadStatus();
      }
    });
  }

  void _loadOriginalInvoiceData() {
    final invoice = widget.originalInvoice;

    // Get current locale for date formatting
    final localizationCubit = getIt<LocalizationCubit>();
    final currentLocale = localizationCubit.getCurrentLanguage();

    // Load basic info from original invoice
    _formController.selectedAction = 'save_and_send';
    _formController.selectedPaymentMethod = invoice.paymentMethodCode ?? 'cash';
    _formController.selectedDate = DateTime.now();
    _formController.issueDateController.text =
        DateFormatter.formatForTextField(
          DateFormatter.getCurrentDateApiFormat(),
          locale: currentLocale,
        ) ??
        DateFormatter.getCurrentDateApiFormat();
    _formController.descriptionController.text = invoice.description ?? '';

    // Load customer data
    if (invoice.customer != null) {
      _formController.onCustomerSelected(
        invoice.customer!.id ?? invoice.customerId ?? 0,
        invoice.customer!.name ?? invoice.customerName ?? '',
        invoice.customer!.email ?? '',
        invoice.customer!.phone ?? '',
        invoice.customer!.address ?? '',
      );
    } else if (invoice.customerId != null) {
      _formController.selectedCustomerId = invoice.customerId;
      _formController.selectedCustomerName = invoice.customerName;
    }

    // Load items from original invoice
    if (invoice.items != null && invoice.items!.isNotEmpty) {
      _formController.items = invoice.items!.map((item) {
        return InvoiceItemData(
          productId: item.productId,
          name: item.name ?? '',
          quantity: item.quantity ?? '1.00',
          price: item.price ?? '0.00',
          discount: item.discount ?? '0.00',
          taxPercent: item.taxPercent ?? '0.00',
          taxAmount: item.taxAmount ?? '0.00',
          total: item.total ?? '0.00',
        );
      }).toList();
      _formController.calculateTotals();
    }

    // Set return reason default
    _returnReasonController.text = 'Full return';
  }

  @override
  void dispose() {
    _tabController.dispose();
    _formController.dispose();
    _returnReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final hasCreatePermission = PermissionChecker.hasPermission(
      context,
      InvoicesPermissions.createCredit,
    );

    if (!hasCreatePermission) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(32.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.lock_outline,
                    size: 64.sp,
                    color: colorScheme.error,
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    s.invoicesNoPermissionToView,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return BlocListener<InvoicesCubit, InvoicesState>(
      listener: (context, state) {
        state.maybeWhen(
          createSuccess:
              (invoices, created, selectedInvoice, currentPage, totalPages) {
                if (_loading) {
                  _loading = false;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(s.invoiceCreatedSuccessfully),
                      backgroundColor: AppColors.success,
                    ),
                  );
                  Navigator.pop(context, true);
                }
              },
          failure:
              (invoices, selectedInvoice, currentPage, totalPages, failure) {
                if (_loading) {
                  _loading = false;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(failure.message),
                      backgroundColor: AppColors.error,
                    ),
                  );
                }
              },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(S.of(context).createCreditInvoice),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [
            // Stepper Tabs
            Container(
              color: colorScheme.surface,
              child: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: S.of(context).basicInfo),
                  Tab(text: S.of(context).customer),
                  Tab(text: S.of(context).items),
                  Tab(text: S.of(context).summary),
                ],
                labelColor: colorScheme.primary,
                unselectedLabelColor: colorScheme.onSurface.withOpacity(0.6),
                indicatorColor: colorScheme.primary,
              ),
            ),

            // Form Content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Basic Info Tab with Return Reason
                  _buildBasicInfoTab(),
                  // Customer Tab
                  CustomerSelectionStep(formController: _formController),
                  // Items Tab
                  ItemsSelectionStep(formController: _formController),
                  // Summary Tab
                  InvoiceSummaryStep(
                    formController: _formController,
                    originalInvoice: widget.originalInvoice,
                    returnReason: _returnReasonController.text,
                  ),
                ],
              ),
            ),

            // Bottom Actions
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildBasicInfoTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Return Reason Field
          TextField(
            controller: _returnReasonController,
            enabled: true,
            readOnly: false,
            decoration: InputDecoration(
              labelText: S.of(context).returnReason,
              hintText: S.of(context).enterReasonForReturn,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            maxLines: 3,
            onChanged: (value) {
              setState(() {});
            },
          ),
          SizedBox(height: 16.h),

          // Basic Info Step
          InvoiceBasicInfoStep(formController: _formController),
        ],
      ),
    );
  }

  Widget _buildBottomActions() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (_currentTabIndex > 0)
            Expanded(
              child: OutlinedButton(
                onPressed: _goToPreviousTab,
                child: Text(S.of(context).previous),
              ),
            ),
          if (_currentTabIndex > 0) SizedBox(width: 16.w),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: _currentTabIndex < 3
                  ? _goToNextTab
                  : _submitCreditInvoice,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
              ),
              child: _loading
                  ? SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text(
                      _currentTabIndex < 3
                          ? S.of(context).next
                          : S.of(context).createCreditInvoice,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void _goToNextTab() {
    if (_validateCurrentTab()) {
      if (_currentTabIndex < 3) {
        _tabController.animateTo(_currentTabIndex + 1);
        setState(() {
          _currentTabIndex = _tabController.index;
        });
      }
    }
  }

  void _goToPreviousTab() {
    if (_currentTabIndex > 0) {
      _tabController.animateTo(_currentTabIndex - 1);
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    }
  }

  bool _validateCurrentTab() {
    final s = S.of(context);
    setState(() {
      _validationErrors.clear();
    });

    bool isValid = true;
    String errorMessage = '';

    switch (_currentTabIndex) {
      case 0: // Basic Info Tab
        if (_returnReasonController.text.trim().isEmpty) {
          isValid = false;
          errorMessage = 'Return reason is required';
        }
        break;
      case 1: // Customer Tab
        if (_formController.selectedCustomerId == null &&
            _formController.selectedCustomerName == null) {
          isValid = false;
          errorMessage = s.selectOrAddCustomer;
        }
        break;
      case 2: // Items Tab
        if (_formController.items.isEmpty) {
          isValid = false;
          errorMessage = s.addAtLeastOneItem;
        }
        break;
      case 3: // Summary Tab
        isValid = true;
        break;
    }

    if (!isValid) {
      _showValidationError(errorMessage);
    }

    return isValid;
  }

  void _showValidationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppColors.error),
    );
  }

  void _submitCreditInvoice() {
    if (!_validateCurrentTab()) return;

    setState(() {
      _loading = true;
    });

    final invoiceId =
        widget.originalInvoice.id ?? widget.originalInvoice.invoiceId ?? 0;
    if (invoiceId == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid invoice ID'),
          backgroundColor: AppColors.error,
        ),
      );
      setState(() {
        _loading = false;
      });
      return;
    }

    _cubit.createCreditInvoice(
      invoiceId: invoiceId,
      issueDate: _formController.issueDateController.text,
      returnReason: _returnReasonController.text.trim(),
      description: _formController.descriptionController.text.isEmpty
          ? null
          : _formController.descriptionController.text,
      action: _formController.selectedAction,
      items: _formController.items
          .map(
            (item) => CreateInvoiceItemRequest(
              productId: item.productId?.toString(),
              name: item.name,
              quantity: item.quantity,
              price: item.price,
              discount: item.discount,
              taxPercent: item.taxPercent,
              taxAmount: item.taxAmount,
              total: item.total,
              productName: item.productName,
              productDescription: item.productDescription,
              productCategory: item.productCategory,
            ),
          )
          .toList(),
      subtotal: _formController.subtotalController.text,
      taxAmount: _formController.taxAmountController.text,
      discount: _formController.discountController.text,
      total: _formController.totalController.text,
    );
  }
}
