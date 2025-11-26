import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/date_formatter.dart';
import 'package:invotek/core/utils/snackbar_helper.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/domain/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/customer_selection_step.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/invoice_basic_info_step.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/invoice_summary_step.dart';
import 'package:invotek/features/invoices/ui/widgets/stepper/items_selection_step.dart';
import 'package:invotek/features/invoices/ui/widgets/form/invoice_form_bottom_actions.dart';
import 'package:invotek/features/invoices/ui/widgets/form/invoice_form_dialogs.dart';
import 'package:invotek/features/invoices/ui/widgets/form/invoice_form_helpers.dart';
import 'package:invotek/features/invoices/ui/widgets/form/invoice_form_read_only_view.dart';
import 'package:invotek/features/invoices/ui/widgets/form/invoice_form_return_reason_section.dart';
import 'package:invotek/features/invoices/ui/widgets/form/invoice_form_section_header.dart';
import 'package:invotek/features/invoices/ui/widgets/form/invoice_form_service.dart';
import 'package:invotek/features/invoices/ui/widgets/form/invoice_form_tax_integration_widget.dart';
import 'package:invotek/features/invoices/ui/widgets/form/invoice_form_validator.dart';
import 'package:invotek/features/invoices/ui/widgets/form/invoice_form_warning_banner.dart';
import 'package:invotek/features/settings/cubit/tax_integration_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class InvoiceFormScreen extends StatefulWidget {
  final InvoiceEntity? invoice; // null = create, not null = edit
  final InvoiceEntity? originalInvoice; // for credit invoices

  const InvoiceFormScreen({super.key, this.invoice, this.originalInvoice});

  @override
  State<InvoiceFormScreen> createState() => _InvoiceFormScreenState();
}

class _InvoiceFormScreenState extends State<InvoiceFormScreen> {
  late InvoiceFormController _formController;
  late InvoicesCubit _cubit;
  late InvoiceFormService _formService;
  late InvoiceFormValidator _validator;
  late TextEditingController _returnReasonController;
  bool _loading = false;
  final _scrollController = ScrollController();

  // Check if this is edit mode
  bool get _isEditMode => widget.invoice != null;
  // Check if this is credit invoice mode
  bool get _isCreditInvoiceMode => widget.originalInvoice != null;
  // Check if invoice is sent (read-only)
  bool get _isInvoiceSent => widget.invoice?.status?.toLowerCase() == 'sent';

  @override
  void initState() {
    super.initState();
    _formController = InvoiceFormController();
    _returnReasonController = TextEditingController();
    _cubit = getIt<InvoicesCubit>();

    // Initialize service and validator after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      _formService = InvoiceFormService(
        context: context,
        formController: _formController,
        cubit: _cubit,
      );
      _validator = InvoiceFormValidator(_formController);

      if (_isEditMode) {
        _loadInvoiceData();
        // Force rebuild after loading data
        if (mounted) setState(() {});
      } else if (_isCreditInvoiceMode) {
        _loadOriginalInvoiceData();
        // Force rebuild after loading data
        if (mounted) setState(() {});
      }

      // Load tax integration status
      final taxState = context.read<TaxIntegrationCubit>().state;
      if (taxState is! TaxIntegrationLoaded &&
          taxState is! TaxIntegrationLoading) {
        context.read<TaxIntegrationCubit>().loadStatus();
      }
    });
  }

  @override
  void dispose() {
    _formController.dispose();
    _returnReasonController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _loadInvoiceData() {
    final invoice = widget.invoice!;
    final localizationCubit = getIt<LocalizationCubit>();
    final currentLocale = localizationCubit.getCurrentLanguage();

    // Load basic info
    _formController.selectedAction = 'save_only';
    _formController.selectedPaymentMethod =
        InvoiceFormHelpers.convertPaymentMethodCodeToFormValue(
          invoice.paymentMethodCode,
        );
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
    if (invoice.customer != null) {
      _formController.onCustomerSelected(
        invoice.customer!.id ?? invoice.customerId ?? 0,
        invoice.customer!.name ?? invoice.customerName ?? '',
        invoice.customer!.email ?? '',
        invoice.customer!.phone ?? '',
        invoice.customer!.address ?? '',
      );
      // Clear TextField when customer is selected
      _formController.customerNameController.clear();
    } else if (invoice.customerId != null) {
      _formController.selectedCustomerId = invoice.customerId;
      _formController.selectedCustomerName = invoice.customerName;
      _formController.customerNameController.text = invoice.customerName ?? '';
      _formController.notifyCustomerFieldsChanged();
    } else if (invoice.customerName != null) {
      _formController.selectedCustomerId = null;
      _formController.selectedCustomerName = invoice.customerName;
      _formController.customerNameController.text = invoice.customerName ?? '';
      _formController.notifyCustomerFieldsChanged();
    }

    // Load financial data
    _formController.subtotalController.text = invoice.subtotal ?? '0.00';
    _formController.taxAmountController.text = invoice.taxAmount ?? '0.00';
    _formController.discountController.text = invoice.discount ?? '0.00';
    _formController.totalController.text = invoice.total ?? '0.00';

    // Load items - clear first to avoid duplicates
    _formController.items.clear();
    if (invoice.items != null && invoice.items!.isNotEmpty) {
      for (var item in invoice.items!) {
        final itemData = _convertInvoiceItemToItemData(item);
        // Add item directly without merging (for edit mode)
        _formController.items.add(itemData);
      }
      // Recalculate totals after loading all items
      _formController.calculateTotals();
      _formController
          .notifyCustomerFieldsChanged(); // This will notify listeners
    }

    _formController.onActionChanged(_formController.selectedAction);
    _formController.onPaymentMethodChanged(
      _formController.selectedPaymentMethod,
    );
    _formController.onDateChanged(_formController.selectedDate);
  }

  void _loadOriginalInvoiceData() {
    final invoice = widget.originalInvoice!;
    final localizationCubit = getIt<LocalizationCubit>();
    final currentLocale = localizationCubit.getCurrentLanguage();

    // Load basic info from original invoice
    _formController.selectedAction = 'save_and_send';
    _formController.selectedPaymentMethod =
        InvoiceFormHelpers.convertPaymentMethodCodeToFormValue(
          invoice.paymentMethodCode,
        );
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
      productCategory: null,
      availableQuantity: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    // Check permissions (commented out for now)
    // final hasPermission = _isCreditInvoiceMode
    //     ? PermissionChecker.hasPermission(
    //         context,
    //         InvoicesPermissions.createCredit,
    //       )
    //     : _isEditMode
    //     ? PermissionChecker.hasPermission(context, InvoicesPermissions.edit)
    //     : PermissionChecker.hasPermission(context, InvoicesPermissions.create);

    // if (!hasPermission) {
    //   return const InvoiceFormPermissionWidget();
    // }

    return BlocListener<TaxIntegrationCubit, TaxIntegrationState>(
      listenWhen: (previous, current) {
        return previous is TaxIntegrationActionInProgress &&
            current is TaxIntegrationLoaded;
      },
      listener: (context, state) {},
      child: BlocBuilder<TaxIntegrationCubit, TaxIntegrationState>(
        buildWhen: (previous, current) =>
            previous is TaxIntegrationLoaded && current is TaxIntegrationLoaded
            ? previous.status.taxInvoiceType != current.status.taxInvoiceType ||
                  previous.status.taxIntegrationActive !=
                      current.status.taxIntegrationActive
            : previous != current,
        builder: (context, taxState) {
          final taxInvoiceType = taxState is TaxIntegrationLoaded
              ? taxState.status.taxInvoiceType
              : null;

          if (taxState is TaxIntegrationLoaded) {
            if (!taxState.status.taxIntegrationActive) {
              return InvoiceFormTaxIntegrationWidget(
                appBarTitle: InvoiceFormHelpers.getAppBarTitle(
                  isCreditInvoiceMode: _isCreditInvoiceMode,
                  isEditMode: _isEditMode,
                  createCreditInvoice: s.createCreditInvoice,
                  editInvoice: s.editInvoice,
                  createNewInvoice: s.createNewInvoiceStepper,
                ),
              );
            }
          }

          return BlocListener<InvoicesCubit, InvoicesState>(
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
                updateSuccess:
                    (
                      invoices,
                      updated,
                      selectedInvoice,
                      currentPage,
                      totalPages,
                    ) {
                      setState(() {
                        _loading = false;
                      });
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
                        arguments: widget.invoice?.id.toString(),
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
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: AppBar(
                title: Text(
                  InvoiceFormHelpers.getAppBarTitle(
                    isCreditInvoiceMode: _isCreditInvoiceMode,
                    isEditMode: _isEditMode,
                    createCreditInvoice: s.createCreditInvoice,
                    editInvoice: s.editInvoice,
                    createNewInvoice: s.createNewInvoiceStepper,
                  ),
                ),
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.textPrimary,
                elevation: 0,
                scrolledUnderElevation: 1,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColors.primary,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              body: Stack(
                children: [
                  Column(
                    children: [
                      // Warning banner if invoice is sent
                      if (_isInvoiceSent) const InvoiceFormWarningBanner(),

                      // Form Content - Single Scrollable Page
                      Expanded(
                        child: _isInvoiceSent
                            ? const InvoiceFormReadOnlyView()
                            : SingleChildScrollView(
                                controller: _scrollController,
                                padding: EdgeInsets.all(16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Return Reason Section (only for credit invoices)
                                    if (_isCreditInvoiceMode) ...[
                                      InvoiceFormReturnReasonSection(
                                        returnReasonController:
                                            _returnReasonController,
                                        onChanged: () => setState(() {}),
                                      ),
                                      SizedBox(height: 24.h),
                                    ],

                                    SizedBox(height: 12.h),
                                    InvoiceBasicInfoStep(
                                      formController: _formController,
                                      isReadOnly: _isCreditInvoiceMode,
                                    ),
                                    SizedBox(height: 24.h),

                                    // Customer Section
                                    CustomerSelectionStep(
                                      formController: _formController,
                                      isReadOnly: _isCreditInvoiceMode,
                                    ),
                                    SizedBox(height: 24.h),

                                    ItemsSelectionStep(
                                      formController: _formController,
                                      taxInvoiceType: taxInvoiceType,
                                      isCreditInvoiceMode: _isCreditInvoiceMode,
                                    ),
                                    SizedBox(height: 24.h),

                                    // Summary Section
                                    InvoiceFormSectionHeader(
                                      title: s.reviewCalculations,
                                    ),
                                    SizedBox(height: 12.h),
                                    InvoiceSummaryStep(
                                      formController: _formController,
                                      originalInvoice: widget.originalInvoice,
                                      returnReason: _isCreditInvoiceMode
                                          ? _returnReasonController.text
                                          : null,
                                    ),
                                    SizedBox(
                                      height: 100.h,
                                    ), // Space for bottom buttons
                                  ],
                                ),
                              ),
                      ),

                      // Bottom Action Buttons
                      if (!_isInvoiceSent)
                        InvoiceFormBottomActions(
                          isEditMode: _isEditMode,
                          isCreditInvoiceMode: _isCreditInvoiceMode,
                          isLoading: _loading,
                          formController: _formController,
                          onCancel: () => Navigator.pop(context),
                          onSubmit: _handleSubmit,
                        ),
                    ],
                  ),
                  if (_loading)
                    Positioned.fill(
                      child: Container(
                        color: AppColors.grey.withOpacity(0.5),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
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

  void _handleSubmit() {
    if (_isInvoiceSent) {
      InvoiceFormDialogs.showCannotEditDialog(context);
      return;
    }

    if (!mounted) return;

    final isValid = _validator.validateForm(
      context: context,
      isCreditInvoiceMode: _isCreditInvoiceMode,
      returnReasonController: _returnReasonController,
    );

    if (!isValid) {
      final firstError = _validator.getFirstError();
      if (firstError != null) {
        InvoiceFormDialogs.showValidationError(context, firstError);
      }
      return;
    }

    if (_isCreditInvoiceMode) {
      _formService.submitCreditInvoice(
        widget.originalInvoice!,
        _returnReasonController,
      );
    } else if (_isEditMode) {
      _formService.updateInvoice(widget.invoice!);
    } else {
      _formService.createInvoice();
    }
  }
}
