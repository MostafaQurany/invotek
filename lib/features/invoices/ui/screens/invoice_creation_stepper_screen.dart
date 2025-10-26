import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/demo/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/data/models/requests/create_invoice_request.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/invoice_basic_info_step.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/customer_selection_step.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/items_selection_step.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/invoice_summary_step.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/utils/snackbar_helper.dart';
import 'package:invotek/generated/l10n.dart';

class InvoiceCreationStepperScreen extends StatefulWidget {
  const InvoiceCreationStepperScreen({super.key});

  @override
  State<InvoiceCreationStepperScreen> createState() =>
      _InvoiceCreationStepperScreenState();
}

class _InvoiceCreationStepperScreenState
    extends State<InvoiceCreationStepperScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;
  final Map<String, String> _validationErrors = {};

  late InvoiceFormController _formController;
  late InvoicesCubit _cubit;

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

    return Scaffold(
      backgroundColor: AppColors.whiteGray,
      appBar: AppBar(
        title: Text(s.createNewInvoiceStepper),
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
            createSuccess:
                (invoices, created, selectedInvoice, currentPage, totalPages) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(s.invoiceCreatedSuccessfully),
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
                    arguments: created.id.toString(),
                  );
                },
            failure:
                (invoices, selectedInvoice, currentPage, totalPages, error) {
                  SnackBarHelper.showFailureSnackBar(context, error);
                },
            orElse: () {},
          );
        },
        child: Column(
          children: [
            // Tab Bar
            Container(
              color: AppColors.white,
              child: IgnorePointer(
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
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  InvoiceBasicInfoStep(formController: _formController),
                  CustomerSelectionStep(formController: _formController),
                  ItemsSelectionStep(formController: _formController),
                  InvoiceSummaryStep(formController: _formController),
                ],
              ),
            ),

            // Bottom Action Buttons
            Container(
              padding: EdgeInsets.all(16.w),
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
                  // Next/Save Button
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
                        _currentTabIndex == 3 ? s.createInvoice : s.next,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
    if (_validateForm()) {
      _createInvoice();
    }
  }

  void _createInvoice() {
    _cubit.createInvoice(
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
      status: _formController.selectedStatus,
      description: _formController.descriptionController.text.isEmpty
          ? null
          : _formController.descriptionController.text,
      paymentMethodCode: _formController.selectedPaymentMethod,
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
            _formController.selectedPaymentMethod.isNotEmpty &&
            _formController.selectedStatus.isNotEmpty;
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

    if (_formController.selectedStatus.isEmpty) {
      _validationErrors['status'] = s.statusRequired;
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
}
