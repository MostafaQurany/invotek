import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/date_formatter.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/core/utils/snackbar_helper.dart';
import 'package:invotek/features/invoices/constants/invoices_permissions.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/data/models/requests/update_invoice_request.dart';
import 'package:invotek/features/invoices/domain/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/customer_selection_step.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/invoice_basic_info_step.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/invoice_summary_step.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/items_selection_step.dart';
import 'package:invotek/features/settings/cubit/tax_integration_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class EditInvoiceScreen extends StatefulWidget {
  final InvoiceEntity invoice;

  const EditInvoiceScreen({super.key, required this.invoice});

  @override
  State<EditInvoiceScreen> createState() => _EditInvoiceScreenState();
}

class _EditInvoiceScreenState extends State<EditInvoiceScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;
  final Map<String, String> _validationErrors = {};

  late InvoiceFormController _formController;
  late InvoicesCubit _cubit;

  // Invoice status check
  bool get _isInvoiceSent => widget.invoice.status?.toLowerCase() == 'sent';

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
    _cubit = getIt<InvoicesCubit>();

    // Load invoice data into form controller
    _loadInvoiceData();
  }

  void _loadInvoiceData() {
    final invoice = widget.invoice;

    // Get current locale for date formatting
    final localizationCubit = getIt<LocalizationCubit>();
    final currentLocale = localizationCubit.getCurrentLanguage();

    // Load basic info
    _formController.selectedAction =
        'save_only'; // Default, can be updated if needed
    _formController.selectedPaymentMethod = invoice.paymentMethodCode ?? 'cash';
    _formController.selectedDate =
        DateFormatter.parseApiDate(invoice.issueDate) ?? DateTime.now();
    _formController.issueDateController.text =
        DateFormatter.formatForTextField(
          invoice.issueDate,
          locale: currentLocale,
        ) ??
        DateFormatter.formatForTextField(
          DateFormatter.getCurrentDateApiFormat(),
          locale: currentLocale,
        ) ??
        DateFormatter.getCurrentDateApiFormat();
    _formController.descriptionController.text = invoice.description ?? '';

    // Load customer data
    // Priority: customer object > customer_id > customer name only
    if (invoice.customer != null) {
      // We have full customer object
      _formController.onCustomerSelected(
        invoice.customer!.id ?? invoice.customerId ?? 0,
        invoice.customer!.name ?? invoice.customerName ?? '',
        invoice.customer!.email ?? '',
        invoice.customer!.phone ?? '',
        invoice.customer!.address ?? '',
      );
    } else if (invoice.customerId != null) {
      // We have customer_id but no customer object
      // Set customer_id directly and use customerName for display
      _formController.selectedCustomerId = invoice.customerId;
      _formController.selectedCustomerName = invoice.customerName;
      _formController.customerNameController.text = invoice.customerName ?? '';
      _formController.customerEmailController.text = '';
      _formController.customerPhoneController.text = '';
      _formController.customerAddressController.text = '';
    } else if (invoice.customerName != null) {
      // No customer_id, just customer name (new customer scenario)
      _formController.onNewCustomerAdded(invoice.customerName!, '', '', '');
    }

    // Load financial data
    _formController.subtotalController.text = invoice.subtotal ?? '0.00';
    _formController.taxAmountController.text = invoice.taxAmount ?? '0.00';
    _formController.discountController.text = invoice.discount ?? '0.00';
    _formController.totalController.text = invoice.total ?? '0.00';

    // Load items
    if (invoice.items != null && invoice.items!.isNotEmpty) {
      for (var item in invoice.items!) {
        final itemData = _convertInvoiceItemToItemData(item);
        _formController.addItem(itemData);
      }
    }

    // Update controllers
    _formController.onActionChanged(_formController.selectedAction);
    _formController.onPaymentMethodChanged(
      _formController.selectedPaymentMethod,
    );
    _formController.onDateChanged(_formController.selectedDate);
  }

  InvoiceItemData _convertInvoiceItemToItemData(dynamic item) {
    return InvoiceItemData(
      productId: item.productId,
      name: item.name ?? '',
      quantity: item.quantity ?? '0',
      price: item.price ?? '0.00',
      discount: item.discount ?? '0.00',
      taxPercent: item.taxPercent ?? '0.00',
      taxAmount: item.taxAmount ?? '0.00',
      total: item.total ?? '0.00',
      productName: item.name,
      productDescription: item.description,
      productCategory: null, // Not available in InvoiceItemEntity
      availableQuantity:
          null, // We don't have this info from invoice, could fetch if needed
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final hasEditPermission = PermissionChecker.hasPermission(
      context,
      InvoicesPermissions.edit,
    );

    if (!hasEditPermission) {
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
                  SizedBox(height: 8.h),
                  Text(
                    s.invoicesNoPermissionToAct,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: colorScheme.onSurfaceVariant,
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

    return BlocBuilder<TaxIntegrationCubit, TaxIntegrationState>(
      builder: (context, taxState) {
        // التحقق من التكامل الضريبي
        if (taxState is TaxIntegrationLoaded) {
          if (!taxState.status.taxIntegrationActive) {
            return _buildTaxIntegrationRequiredWidget(s);
          }
        }

        return Scaffold(
          backgroundColor: AppColors.whiteGray,
          appBar: AppBar(
            title: Text(s.editInvoice),
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.textPrimary,
            elevation: 0,
            scrolledUnderElevation: 1,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.help_outline, color: AppColors.textPrimary),
                onPressed: () => _showHelpDialog(),
              ),
              SizedBox(width: 8.w),
            ],
          ),
          body: BlocListener<InvoicesCubit, InvoicesState>(
            bloc: _cubit,
            listener: (context, state) {
              state.maybeWhen(
                updateSuccess:
                    (
                      invoices,
                      updated,
                      selectedInvoice,
                      currentPage,
                      totalPages,
                    ) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(s.invoiceUpdatedSuccessfully),
                          backgroundColor: AppColors.primary,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      );
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.enhancedInvoiceDetailsRoute,
                        arguments: widget.invoice.id.toString(),
                      );
                    },
                failure:
                    (
                      invoices,
                      selectedInvoice,
                      currentPage,
                      totalPages,
                      error,
                    ) {
                      SnackBarHelper.showFailureSnackBar(context, error);
                    },
                orElse: () {},
              );
            },
            child: Column(
              children: [
                // Warning banner if invoice is sent
                if (_isInvoiceSent) _buildWarningBanner(),

                // Tab Bar
                Container(
                  color: AppColors.white,
                  child: IgnorePointer(
                    ignoring: _isInvoiceSent,
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: AppColors.primary,
                      labelColor: AppColors.primary,
                      unselectedLabelColor: AppColors.greyDark,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                      tabs: [
                        Tab(text: s.invoiceBasicInfo),
                        Tab(text: s.selectCustomer),
                        Tab(text: s.invoiceItems),
                        Tab(text: s.reviewCalculations),
                      ],
                    ),
                  ),
                ),

                // Form Content
                Expanded(
                  child: _isInvoiceSent
                      ? _buildReadOnlyView()
                      : TabBarView(
                          controller: _tabController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            InvoiceBasicInfoStep(
                              formController: _formController,
                            ),
                            CustomerSelectionStep(
                              formController: _formController,
                            ),
                            ItemsSelectionStep(formController: _formController),
                            InvoiceSummaryStep(formController: _formController),
                          ],
                        ),
                ),

                // Bottom Action Buttons (rebuild on form changes)
                if (!_isInvoiceSent)
                  AnimatedBuilder(
                    animation: _formController,
                    builder: (context, _) {
                      return Container(
                        padding: EdgeInsets.only(
                          left: 16.w,
                          right: 16.w,
                          top: 16.w,
                          bottom: 16.w + MediaQuery.of(context).padding.bottom,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
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
                            // Cancel/Previous Button
                            Expanded(
                              child: OutlinedButton(
                                onPressed: _currentTabIndex == 0
                                    ? () => Navigator.pop(context)
                                    : () => _goToPreviousTab(),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 16.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  side: BorderSide(
                                    color: AppColors.grey.withOpacity(0.3),
                                  ),
                                ),
                                child: Text(
                                  _currentTabIndex == 0 ? s.cancel : s.previous,
                                  style: TextStyle(
                                    color: AppColors.greyDark,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            // Save Button
                            Expanded(
                              flex: 2,
                              child: FilledButton(
                                onPressed: _currentTabIndex == 3
                                    ? _handleSubmit
                                    : () => _goToNextTab(),
                                style: FilledButton.styleFrom(
                                  backgroundColor: _isCurrentTabValid()
                                      ? AppColors.primary
                                      : AppColors.grey.withOpacity(0.3),
                                  foregroundColor: _isCurrentTabValid()
                                      ? AppColors.white
                                      : AppColors.greyDark,
                                  padding: EdgeInsets.symmetric(vertical: 16.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                                child: Text(
                                  _currentTabIndex == 3
                                      ? s.saveChanges
                                      : s.next,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildWarningBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.warning.withOpacity(0.1),
        border: Border(
          bottom: BorderSide(color: AppColors.warning.withOpacity(0.3)),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: AppColors.warning,
            size: 24.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).invoiceAlreadySent,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.warning,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  S.of(context).cannotEditSentInvoice,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReadOnlyView() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).cannotEditInvoice,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            S.of(context).invoiceAlreadySent,
            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  void _goToNextTab() {
    if (_currentTabIndex < 3) {
      if (_validateCurrentTab()) {
        _tabController.animateTo(_currentTabIndex + 1);
      }
    }
  }

  void _goToPreviousTab() {
    if (_currentTabIndex > 0) {
      _tabController.animateTo(_currentTabIndex - 1);
    }
  }

  void _handleSubmit() {
    if (_isInvoiceSent) {
      _showCannotEditDialog();
      return;
    }

    if (_validateForm()) {
      _updateInvoice();
    }
  }

  void _updateInvoice() {
    _cubit.updateInvoice(
      id: widget.invoice.id!.toString(),
      customerId: _formController.selectedCustomerId?.toString(),
      customerName: _formController.selectedCustomerName,
      customerEmail: _formController.selectedCustomerEmail,
      customerPhone: _formController.selectedCustomerPhone,
      customerAddress: _formController.selectedCustomerAddress,
      subtotal: _formController.subtotalController.text,
      taxAmount: _formController.taxAmountController.text,
      discount: _formController.discountController.text,
      total: _formController.totalController.text,
      issueDate: _formController.issueDateController.text,
      description: _formController.descriptionController.text.isEmpty
          ? null
          : _formController.descriptionController.text,
      paymentMethodCode: _formController.selectedPaymentMethod,
      action: _formController.selectedAction,
      items: _formController.items
          .map(
            (item) => UpdateInvoiceItemRequest(
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
    );
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
        isValid = _validateBasicInfoTab();
        if (!isValid) {
          errorMessage = s.fillRequiredFieldsBasicInfo;
        }
        break;
      case 1: // Customer Tab
        isValid = _validateCustomerTab();
        if (!isValid) {
          errorMessage = s.selectOrAddCustomer;
        }
        break;
      case 2: // Items Tab
        isValid = _validateItemsTab();
        if (!isValid) {
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

  bool _isCurrentTabValid() {
    switch (_currentTabIndex) {
      case 0: // Basic Info Tab
        return _formController.selectedAction.isNotEmpty &&
            _formController.selectedPaymentMethod.isNotEmpty;
      case 1: // Customer Tab
        return (_formController.selectedCustomerId != null) ||
            (_formController.selectedCustomerName != null &&
                _formController.selectedCustomerName!.isNotEmpty);
      case 2: // Items Tab
        return _formController.items.isNotEmpty;
      case 3: // Summary Tab
        return true;
      default:
        return false;
    }
  }

  bool _validateBasicInfoTab() {
    final s = S.of(context);
    bool isValid = true;

    if (_formController.selectedAction.isEmpty) {
      _validationErrors['action'] = s.actionRequired;
      isValid = false;
    }

    if (_formController.selectedPaymentMethod.isEmpty) {
      _validationErrors['paymentMethod'] = s.paymentMethodRequired;
      isValid = false;
    }

    return isValid;
  }

  bool _validateCustomerTab() {
    final s = S.of(context);
    bool isValid = true;

    if (_formController.selectedCustomerId == null &&
        (_formController.selectedCustomerName == null ||
            _formController.selectedCustomerName!.isEmpty)) {
      _validationErrors['customer'] = s.customerRequired;
      isValid = false;
    }

    return isValid;
  }

  bool _validateItemsTab() {
    final s = S.of(context);
    bool isValid = true;

    if (_formController.items.isEmpty) {
      _validationErrors['items'] = s.itemsRequired;
      isValid = false;
    }

    final qtyError = _formController.validateItemQuantities();
    if (qtyError != null) {
      _validationErrors['items'] = qtyError;
      isValid = false;
    }

    return isValid;
  }

  bool _validateForm() {
    setState(() {
      _validationErrors.clear();
    });

    bool isValid = true;

    if (!_validateBasicInfoTab()) {
      isValid = false;
    }

    if (!_validateCustomerTab()) {
      isValid = false;
    }

    if (!_validateItemsTab()) {
      isValid = false;
    }

    if (!isValid) {
      final firstError = _validationErrors.values.first;
      _showValidationError(firstError);
    }

    return isValid;
  }

  void _showValidationError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }

  void _showCannotEditDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).cannotEditInvoice),
        content: Text(S.of(context).invoiceAlreadySent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).ok),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog() {
    final s = S.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(s.help),
        content: Text(s.invoiceCreationHelp),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(s.ok),
          ),
        ],
      ),
    );
  }

  Widget _buildTaxIntegrationRequiredWidget(S s) {
    return Scaffold(
      backgroundColor: AppColors.whiteGray,
      appBar: AppBar(
        title: Text(s.editInvoice),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(32.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock_outline, size: 64.sp, color: AppColors.error),
                SizedBox(height: 24.h),
                Text(
                  s.taxIntegrationNotActive,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.h),
                Text(
                  s.taxIntegrationNotActiveMessage,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32.h),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRoutes.settingsRoute);
                  },
                  icon: Icon(Icons.settings, size: 20.sp),
                  label: Text(s.goToSettings),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 16.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
