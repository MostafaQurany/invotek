import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/core/utils/snackbar_helper.dart';
import 'package:invotek/features/invoices/constants/invoices_permissions.dart';
import 'package:invotek/features/invoices/data/models/requests/create_invoice_request.dart';
import 'package:invotek/features/invoices/domain/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/customer_selection_step.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/invoice_basic_info_step.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/invoice_summary_step.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/items_selection_step.dart';
import 'package:invotek/features/settings/cubit/tax_integration_cubit.dart';
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
  final List<bool> _completedTabs = [false, false, false, false];

  late InvoiceFormController _formController;
  late InvoicesCubit _cubit;
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
    _cubit = getIt<InvoicesCubit>();

    // تحميل حالة tax integration عند فتح الشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final taxState = context.read<TaxIntegrationCubit>().state;
      if (taxState is! TaxIntegrationLoaded &&
          taxState is! TaxIntegrationLoading) {
        context.read<TaxIntegrationCubit>().loadStatus();
      }
    });
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
    final hasCreatePermission = PermissionChecker.hasPermission(
      context,
      InvoicesPermissions.create,
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

    return BlocListener<TaxIntegrationCubit, TaxIntegrationState>(
      listenWhen: (previous, current) {
        // الاستماع عند تغيير الحالة من ActionInProgress إلى Loaded
        return previous is TaxIntegrationActionInProgress &&
            current is TaxIntegrationLoaded;
      },
      listener: (context, state) {
        // إعادة تحميل الحالة عند اكتمال العملية
        if (state is TaxIntegrationLoaded) {
          // الحالة تم تحديثها بالفعل، لا حاجة لإعادة التحميل
        }
      },
      child: BlocBuilder<TaxIntegrationCubit, TaxIntegrationState>(
        buildWhen: (previous, current) =>
            previous is TaxIntegrationLoaded && current is TaxIntegrationLoaded
            ? previous.status.taxInvoiceType != current.status.taxInvoiceType ||
                  previous.status.taxIntegrationActive !=
                      current.status.taxIntegrationActive
            : previous != current,
        builder: (context, taxState) {
          // التحقق من التكامل الضريبي
          final taxInvoiceType = taxState is TaxIntegrationLoaded
              ? taxState.status.taxInvoiceType
              : null;

          if (taxState is TaxIntegrationLoaded) {
            if (!taxState.status.taxIntegrationActive) {
              return _buildTaxIntegrationRequiredWidget(s);
            }
          }

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
                  loading:
                      (
                        invoices,
                        selectedInvoice,
                        currentPage,
                        totalPages,
                        message,
                      ) {
                        setState(() {
                          _loading = true;
                        });
                      },
                  createSuccess:
                      (
                        invoices,
                        created,
                        selectedInvoice,
                        currentPage,
                        totalPages,
                      ) {
                        setState(() {
                          _loading = false;
                        });
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
                      (
                        invoices,
                        selectedInvoice,
                        currentPage,
                        totalPages,
                        error,
                      ) {
                        setState(() {
                          _loading = false;
                        });
                        SnackBarHelper.showFailureSnackBar(context, error);
                      },
                  orElse: () {},
                );
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      // Tab Bar
                      Container(color: AppColors.white, child: _buildTabs(s)),

                      // Form Content
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            InvoiceBasicInfoStep(
                              formController: _formController,
                            ),
                            CustomerSelectionStep(
                              formController: _formController,
                            ),
                            ItemsSelectionStep(
                              formController: _formController,
                              taxInvoiceType: taxInvoiceType,
                            ),
                            InvoiceSummaryStep(formController: _formController),
                          ],
                        ),
                      ),

                      // Bottom Action Buttons (rebuild on form changes)
                      AnimatedBuilder(
                        animation: _formController,
                        builder: (context, _) {
                          return Container(
                            padding: EdgeInsets.only(
                              left: 16.w,
                              right: 16.w,
                              top: 16.w,
                              bottom:
                                  16.w + MediaQuery.of(context).padding.bottom,
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
                            child: _currentTabIndex == 3
                                ? _buildFinalStepButtons(s)
                                : _buildNavigationButtons(s),
                          );
                        },
                      ),
                    ],
                  ),
                  if (_loading)
                    Positioned(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: AppColors.grey.withValues(alpha: 0.5),
                        child: SizedBox(
                          width: 120.w,
                          height: 120.h,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTaxIntegrationRequiredWidget(S s) {
    return Scaffold(
      backgroundColor: AppColors.whiteGray,
      appBar: AppBar(
        title: Text(s.createNewInvoiceStepper),
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

  void _goToNextTab() {
    if (_currentTabIndex < 3) {
      if (_validateCurrentTab()) {
        setState(() {
          _completedTabs[_currentTabIndex] = true;
        });
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

  Widget _buildNavigationButtons(S s) {
    return ListenableBuilder(
      listenable: _formController,
      builder: (context, _) {
        final isValid = _isCurrentTabValid();
        return Row(
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
                  side: BorderSide(color: AppColors.grey.withOpacity(0.3)),
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
            // Next Button
            Expanded(
              flex: 2,
              child: FilledButton(
                onPressed: isValid ? () => _goToNextTab() : null,
                style: FilledButton.styleFrom(
                  backgroundColor: isValid
                      ? AppColors.primary
                      : AppColors.grey.withOpacity(0.3),
                  foregroundColor: isValid
                      ? AppColors.white
                      : AppColors.greyDark,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  s.next,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFinalStepButtons(S s) {
    return Row(
      children: [
        // Save Only Button
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              _formController.onActionChanged('save_only');
              _handleSubmit();
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              side: BorderSide(color: AppColors.primary, width: 2),
            ),
            child: Text(
              s.save,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        // Save and Send Button
        Expanded(
          child: FilledButton(
            onPressed: () {
              _formController.onActionChanged('save_and_send');
              _handleSubmit();
            },
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              s.send,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  void _createInvoice() {
    final taxInvoiceType = _getTaxInvoiceType();
    final paymentMethodCode = _getPaymentMethodCode(
      _formController.selectedPaymentMethod,
      taxInvoiceType,
    );

    // إذا كان العميل موجوداً: إرسال customer_id فقط
    // إذا كان عميل جديد: إرسال name, email, phone فقط
    final isExistingCustomer = _formController.selectedCustomerId != null;

    _cubit.createInvoice(
      customerId: isExistingCustomer
          ? _formController.selectedCustomerId?.toString()
          : null,
      customerName: isExistingCustomer
          ? null
          : (_formController.selectedCustomerName?.isNotEmpty == true
                ? _formController.selectedCustomerName
                : _formController.customerNameController.text.trim().isNotEmpty
                ? _formController.customerNameController.text.trim()
                : null),
      customerEmail: isExistingCustomer
          ? null
          : (_formController.selectedCustomerEmail?.isNotEmpty == true
                ? _formController.selectedCustomerEmail
                : _formController.customerEmailController.text.trim().isNotEmpty
                ? _formController.customerEmailController.text.trim()
                : null),
      customerPhone: isExistingCustomer
          ? null
          : (_formController.selectedCustomerPhone?.isNotEmpty == true
                ? _formController.selectedCustomerPhone
                : _formController.customerPhoneController.text.trim().isNotEmpty
                ? _formController.customerPhoneController.text.trim()
                : null),
      customerAddress: null, // لا يُرسل في أي من الحالتين
      subtotal: _formController.subtotalController.text,
      taxAmount: _formController.taxAmountController.text,
      discount: _formController.discountController.text,
      total: _formController.totalController.text,
      issueDate: _formController.issueDateController.text,
      description: _formController.descriptionController.text.isEmpty
          ? null
          : _formController.descriptionController.text,
      paymentMethodCode: paymentMethodCode,
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

  String? _getTaxInvoiceType() {
    final taxState = context.read<TaxIntegrationCubit>().state;
    if (taxState is TaxIntegrationLoaded) {
      return taxState.status.taxInvoiceType;
    }
    return null;
  }

  String _getPaymentMethodCode(String paymentMethod, String? taxInvoiceType) {
    if (taxInvoiceType == 'income') {
      if (paymentMethod == 'cash') {
        return '011';
      } else {
        // card, bank_transfer, check
        return '021';
      }
    } else if (taxInvoiceType == 'general') {
      if (paymentMethod == 'cash') {
        return '012';
      } else {
        // card, bank_transfer, check
        return '022';
      }
    }
    // Default: return original payment method if taxInvoiceType is null
    return paymentMethod;
  }

  bool _isCurrentTabValid() {
    switch (_currentTabIndex) {
      case 0: // Basic Info Tab
        return _formController.selectedPaymentMethod.isNotEmpty;
      case 1: // Customer Tab
        return _formController.isCustomerStepValid();
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

    if (_formController.selectedPaymentMethod.isEmpty) {
      _validationErrors['paymentMethod'] = s.paymentMethodRequired;
      isValid = false;
    }

    return isValid;
  }

  bool _validateCustomerTab() {
    final s = S.of(context);
    bool isValid = true;

    // Use the same validation logic as isCustomerStepValid()
    if (!_formController.isCustomerStepValid()) {
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

  Widget _buildTabs(S s) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_currentTabIndex + 1, (i) {
          final isCurrentTab = i == _currentTabIndex;
          final tabColor = isCurrentTab
              ? AppColors.primary
              : AppColors.greyDark;

          // تحديد النص
          String tabText;
          switch (i) {
            case 0:
              tabText = s.invoiceBasicInfo;
              break;
            case 1:
              tabText = s.selectCustomer;
              break;
            case 2:
              tabText = s.invoiceItems;
              break;
            case 3:
              tabText = s.reviewCalculations;
              break;
            default:
              tabText = '';
          }

          return GestureDetector(
            onTap: () {
              // السماح بالانتقال للتبويبات السابقة فقط
              if (i <= _currentTabIndex) {
                _tabController.animateTo(i);
              }
            },
            child: Container(
              width: (_currentTabIndex == 0) ? screenWidth : 250.w,
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isCurrentTab
                        ? AppColors.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                tabText,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: tabColor,
                  fontWeight: isCurrentTab ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
