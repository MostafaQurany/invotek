import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/cubits/permissions_cubit.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/core/widgets/error_widget.dart' as custom;
import 'package:invotek/core/widgets/loading_widget.dart';
import 'package:invotek/features/invoices/constants/invoices_permissions.dart';
import 'package:invotek/features/invoices/data/models/invoice_customer_model.dart';
import 'package:invotek/features/invoices/data/models/invoice_item.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/invoices/domain/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_customer_entity.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_item_entity.dart';
import 'package:invotek/features/invoices/ui/screens/invoice_form_screen_with_provider.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_additional_info_card.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_customer_card.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_items_card.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_payment_card.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_summary_card.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/delete_invoice_dialog.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/mark_paid_dialog.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/qr_code_dialog.dart';
import 'package:invotek/features/invoices/ui/widgets/headers/invoice_details_header_widget.dart';
import 'package:invotek/features/printing/presentation/ui/dialogs/invoice_print_dialog.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/domain/cubit/products_cubit.dart';
import 'package:invotek/features/products/ui/screens/product_details_screen.dart';
import 'package:invotek/generated/l10n.dart';

/// Helper class for action buttons
class _ActionButtonItem {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onPressed;
  final bool enabled;

  _ActionButtonItem({
    required this.icon,
    required this.label,
    required this.color,
    this.onPressed,
    this.enabled = true,
  });
}

/// شاشة تفاصيل الفاتورة المحسنة مع دعم استدعاء API وإدارة الحالة
class EnhancedInvoiceDetailsScreen extends StatefulWidget {
  final String invoiceId;

  const EnhancedInvoiceDetailsScreen({super.key, required this.invoiceId});

  @override
  State<EnhancedInvoiceDetailsScreen> createState() =>
      _EnhancedInvoiceDetailsScreenState();
}

class _EnhancedInvoiceDetailsScreenState
    extends State<EnhancedInvoiceDetailsScreen> {
  // إنشاء ProductsCubit محلي
  late ProductsCubit _productsCubit;
  bool _isLoadingProduct = false;
  bool _isSendingInvoice = false;

  @override
  void initState() {
    super.initState();
    // إنشاء ProductsCubit محلي
    _productsCubit = ProductsCubit(getIt<ProductsRepository>());

    // استدعاء API لجلب تفاصيل الفاتورة
    context.read<InvoicesCubit>().getInvoiceById(widget.invoiceId);
  }

  @override
  void dispose() {
    _productsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final s = S.of(context);

    return BlocBuilder<PermissionsCubit, PermissionsState>(
      builder: (context, permissionsState) {
        // التحقق من صلاحية العرض
        final hasViewPermission = permissionsState.maybeWhen(
          loaded: (permissions) =>
              permissions.hasPermission(InvoicesPermissions.view),
          orElse: () => false,
        );

        // إذا لم تكن هناك صلاحية للعرض، نعرض رسالة عدم وجود صلاحية
        if (!hasViewPermission) {
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

        return Scaffold(
          body: BlocListener<InvoicesCubit, InvoicesState>(
            listener: (context, invoicesState) {
              invoicesState.maybeWhen(
                loaded: (invoices, selectedInvoice, currentPage, totalPages) {
                  // // عرض رسالة النجاح فقط عند إرسال الفاتورة
                  // if (_isSendingInvoice) {
                  //   setState(() {
                  //     _isSendingInvoice = false;
                  //   });
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text(S.of(context).invoiceSentSuccessfully),
                  //       backgroundColor: AppColors.success,
                  //     ),
                  //   );
                  // }
                },
                failure:
                    (
                      invoices,
                      selectedInvoice,
                      currentPage,
                      totalPages,
                      failure,
                    ) {
                      if (_isSendingInvoice) {
                        setState(() {
                          _isSendingInvoice = false;
                        });
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(failure.message),
                          backgroundColor: AppColors.error,
                        ),
                      );
                    },
                orElse: () {},
              );
            },
            child: BlocListener<ProductsCubit, ProductsState>(
              bloc: _productsCubit,
              listener: (context, productsState) {
                productsState.whenOrNull(
                  loaded: (products, selectedProduct, currentPage, totalPages) {
                    if (selectedProduct != null && _isLoadingProduct) {
                      // إغلاق مؤشر التحميل
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }

                      _isLoadingProduct = false;

                      // الانتقال إلى شاشة تفاصيل المنتج
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BlocProvider<ProductsCubit>.value(
                                value: _productsCubit,
                                child: ProductDetailsScreen(
                                  product: selectedProduct,
                                ),
                              ),
                        ),
                      );
                    }
                  },
                  failure:
                      (
                        products,
                        selectedProduct,
                        currentPage,
                        totalPages,
                        error,
                      ) {
                        if (_isLoadingProduct) {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }

                          _isLoadingProduct = false;

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                S
                                    .of(context)
                                    .errorOccurredWithMessage(error.message),
                              ),
                              backgroundColor: AppColors.error,
                            ),
                          );
                        }
                      },
                );
              },
              child: BlocBuilder<InvoicesCubit, InvoicesState>(
                builder: (context, state) {
                  return state.when(
                    initial:
                        (
                          invoices,
                          selectedInvoice,
                          currentPage,
                          totalPages,
                          error,
                        ) => _buildLoadingState(),
                    loading:
                        (
                          invoices,
                          selectedInvoice,
                          currentPage,
                          totalPages,
                          message,
                        ) {
                          if (message == 'loading_invoice') {
                            return _buildLoadingState();
                          }
                          return _buildContent(selectedInvoice);
                        },
                    loaded:
                        (invoices, selectedInvoice, currentPage, totalPages) {
                          return _buildContent(selectedInvoice);
                        },
                    createSuccess:
                        (
                          invoices,
                          created,
                          selectedInvoice,
                          currentPage,
                          totalPages,
                        ) {
                          return _buildContent(selectedInvoice);
                        },
                    updateSuccess:
                        (
                          invoices,
                          updated,
                          selectedInvoice,
                          currentPage,
                          totalPages,
                        ) {
                          return _buildContent(selectedInvoice);
                        },
                    deleteSuccess:
                        (
                          invoices,
                          deletedId,
                          selectedInvoice,
                          currentPage,
                          totalPages,
                        ) {
                          return _buildContent(selectedInvoice);
                        },
                    failure:
                        (
                          invoices,
                          selectedInvoice,
                          currentPage,
                          totalPages,
                          error,
                        ) {
                          return _buildErrorState(error.message);
                        },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoadingState() {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header مع مؤشر التحميل
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 50.h, 16.w, 20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.textPrimary,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).loadingInvoiceDetails,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          S.of(context).invoiceNumberLabel(widget.invoiceId),
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
            ),
            Expanded(
              child: Center(
                child: LoadingWidget(
                  message: S.of(context).loadingInvoiceDetails,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header مع رسالة الخطأ
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 50.h, 16.w, 20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColors.textPrimary,
                      size: 24.sp,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).errorLoadingInvoice,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.error,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          S.of(context).invoiceNumberLabel(widget.invoiceId),
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
            ),
            Expanded(
              child: Center(
                child: custom.ErrorWidget(
                  message: error,
                  onRetry: () {
                    context.read<InvoicesCubit>().getInvoiceById(
                      widget.invoiceId,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(InvoiceEntity? invoice) {
    if (invoice == null) {
      return _buildEmptyState();
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header
          SliverToBoxAdapter(
            child: BlocBuilder<PermissionsCubit, PermissionsState>(
              builder: (context, permissionsState) {
                final hasEditPermission = permissionsState.maybeWhen(
                  loaded: (permissions) =>
                      permissions.hasPermission(InvoicesPermissions.edit),
                  orElse: () => false,
                );

                return InvoiceDetailsHeaderWidget(
                  invoice: invoice,
                  onBack: () => Navigator.pop(context),
                  onEdit: hasEditPermission
                      ? () => _editInvoice(invoice)
                      : () {
                          PermissionChecker.showPermissionDeniedSnackBar(
                            context,
                            S.of(context).editInvoice,
                          );
                        },
                );
              },
            ),
          ),

          // Space
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),

          // Content Cards
          SliverToBoxAdapter(
            child: InvoiceSummaryCard(
              invoice: invoice,
              onStatusTap: () => _showStatusOptions(invoice),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 16.h)),

          SliverToBoxAdapter(
            child: InvoiceCustomerCard(
              customer:
                  _convertCustomerEntityToModel(invoice.customer) ??
                  InvoiceCustomerModel(
                    id: 0,
                    name:
                        invoice.customerName ??
                        S.of(context).invoicesCustomerName,
                    email: S.of(context).invoicesCustomerEmail,
                    phone: S.of(context).invoicesCustomerPhone,
                    companyId: 0,
                    taxNumber: "0",
                    address: S.of(context).invoicesCustomerAddress,
                    notes: S.of(context).invoicesCustomerNotes,
                    status: "0",
                    createdAt: "0",
                    updatedAt: "0",
                  ),
              onCustomerTap: () => _viewCustomerDetails(invoice),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 16.h)),

          SliverToBoxAdapter(
            child: InvoiceItemsCard(
              items: (invoice.items ?? [])
                  .map((e) => _convertItemEntityToModel(e))
                  .toList(),
              onItemTap: (item) {
                _viewItemDetails(item);
              },
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 16.h)),

          SliverToBoxAdapter(
            child: InvoicePaymentCard(
              invoice: invoice,
              onPaymentMethodTap: () => _changePaymentMethod(invoice),
              onMarkPaid: () => _markAsPaid(invoice),
            ),
          ),

          // Additional Information Card
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),

          SliverToBoxAdapter(
            child: InvoiceAdditionalInfoCard(
              invoice: invoice,
              onQRCodeTap: () => _viewQRCode(invoice),
              onTaxUIDTap: () => _viewTaxUID(invoice),
            ),
          ),

          // Bottom spacing
          SliverToBoxAdapter(child: SizedBox(height: 100.h)),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(invoice),
    );
  }

  Widget _buildEmptyState() {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.receipt_long_outlined,
                size: 64.sp,
                color: AppColors.textSecondary,
              ),
              SizedBox(height: 16.h),
              Text(
                S.of(context).noInvoiceData,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                S.of(context).invoiceNumberLabel(widget.invoiceId),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: () {
                  context.read<InvoicesCubit>().getInvoiceById(
                    widget.invoiceId,
                  );
                },
                child: Text(S.of(context).retry),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Action Methods
  void _editInvoice(InvoiceEntity invoice) {
    // التحقق من صلاحية التعديل قبل الانتقال
    final permissionsState = context.read<PermissionsCubit>().state;
    final hasEditPermission = permissionsState.maybeWhen(
      loaded: (permissions) =>
          permissions.hasPermission(InvoicesPermissions.edit),
      orElse: () => false,
    );

    if (!hasEditPermission) {
      PermissionChecker.showPermissionDeniedSnackBar(
        context,
        S.of(context).editInvoice,
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InvoiceFormScreenWithProvider(invoice: invoice),
      ),
    );
  }

  void _sendInvoice(InvoiceEntity invoice) {
    // التحقق من صلاحية الإرسال
    final permissionsState = context.read<PermissionsCubit>().state;
    final hasSendPermission = permissionsState.maybeWhen(
      loaded: (permissions) =>
          permissions.hasPermission(InvoicesPermissions.send),
      orElse: () => false,
    );

    if (!hasSendPermission) {
      PermissionChecker.showPermissionDeniedSnackBar(
        context,
        S.of(context).sendInvoice,
      );
      return;
    }

    if (invoice.id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).errorOccurredWithMessage('Invalid invoice ID'),
          ),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    // تعيين flag للإرسال
    setState(() {
      _isSendingInvoice = true;
    });

    // إرسال الفاتورة
    context.read<InvoicesCubit>().sendInvoice(invoiceId: invoice.id!);
  }

  void _onInvoiceReturn(InvoiceEntity invoice) {
    // التحقق من وجود فواتير إرجاع مرتبطة بالفاتورة
    final hasReturnedInvoices =
        invoice.returnedInvoices != null &&
        invoice.returnedInvoices!.isNotEmpty;

    if (hasReturnedInvoices) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).invoiceAlreadyHasCreditInvoice),
          backgroundColor: AppColors.warning,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            InvoiceFormScreenWithProvider(originalInvoice: invoice),
      ),
    );
  }

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return S.of(context).statusPaid;
      case 'pending':
        return S.of(context).statusPending;
      case 'overdue':
        return S.of(context).statusOverdue;
      case 'draft':
        return S.of(context).statusDraft;
      default:
        return status;
    }
  }

  void _showStatusOptions(InvoiceEntity invoice) {
    showModalBottomSheet(
      context: context,
      useSafeArea: false,
      isScrollControlled: true,
      builder: (context) => _buildStatusOptionsBottomSheet(invoice),
    );
  }

  Widget _buildStatusOptionsBottomSheet(InvoiceEntity invoice) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
        top: 16.w,
        right: 16.w,
        bottom: bottomPadding > 0 ? bottomPadding + 16.w : 16.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).changeStatus,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),
          ListTile(
            leading: const Icon(Icons.check_circle, color: AppColors.success),
            title: Text(S.of(context).statusPaid),
            onTap: () {
              Navigator.pop(context);
              _markAsPaid(invoice);
            },
          ),
          ListTile(
            leading: const Icon(Icons.schedule, color: AppColors.warning),
            title: Text(S.of(context).statusPending),
            onTap: () {
              Navigator.pop(context);
              _updateStatus(invoice, 'pending');
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit, color: AppColors.textSecondary),
            title: Text(S.of(context).statusDraft),
            onTap: () {
              Navigator.pop(context);
              _updateStatus(invoice, 'draft');
            },
          ),
        ],
      ),
    );
  }

  void _viewCustomerDetails(InvoiceEntity invoice) {
    // TODO: Navigate to customer details
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          S.of(context).viewCustomerDetails(invoice.customerName ?? ''),
        ),
      ),
    );
  }

  void _viewItemDetails(dynamic item) {
    if (item.productId != null) {
      _isLoadingProduct = true;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              padding: EdgeInsets.all(26.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16.h),
                  Text(S.of(context).loadingProductDetails(item.name ?? '')),
                ],
              ),
            ),
          ),
        ),
      );

      _productsCubit.getProductById(item.productId!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).invoicesNoProductIdAvailable),
          backgroundColor: AppColors.warning,
        ),
      );
    }
  }

  void _changePaymentMethod(InvoiceEntity invoice) {
    // TODO: Implement payment method change
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          S
              .of(context)
              .changePaymentMethodForInvoice(invoice.invoiceNumber ?? ''),
        ),
      ),
    );
  }

  void _markAsPaid(InvoiceEntity invoice) {
    // التحقق من صلاحية التعديل قبل فتح الحوار
    final permissionsState = context.read<PermissionsCubit>().state;
    final hasEditPermission = permissionsState.maybeWhen(
      loaded: (permissions) =>
          permissions.hasPermission(InvoicesPermissions.edit),
      orElse: () => false,
    );

    if (!hasEditPermission) {
      PermissionChecker.showPermissionDeniedSnackBar(
        context,
        S.of(context).markAsPaid,
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => MarkPaidDialog(
        invoice: invoice,
        onMarkPaid: () {
          // TODO: Implement mark as paid
          Navigator.pop(context);
          _updateStatus(invoice, 'paid');
        },
      ),
    );
  }

  void _deleteInvoice(InvoiceEntity invoice) {
    // التحقق من صلاحية الحذف قبل فتح الحوار
    final permissionsState = context.read<PermissionsCubit>().state;
    final hasDeletePermission = permissionsState.maybeWhen(
      loaded: (permissions) =>
          permissions.hasPermission(InvoicesPermissions.delete),
      orElse: () => false,
    );

    if (!hasDeletePermission) {
      PermissionChecker.showPermissionDeniedSnackBar(
        context,
        S.of(context).deleteInvoice,
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => DeleteInvoiceDialog(
        invoice: invoice,
        onDelete: () async {
          try {
            // إظهار مؤشر تحميل
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(child: CircularProgressIndicator()),
            );

            // حذف الفاتورة
            await context.read<InvoicesCubit>().deleteInvoice(invoice.id ?? 0);

            Navigator.pop(context); // إغلاق مؤشر التحميل
            Navigator.pop(context); // إغلاق حوار الحذف
            Navigator.pop(context); // العودة للقائمة

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S.of(context).invoiceDeletedSuccessfully),
                backgroundColor: AppColors.success,
              ),
            );
          } catch (e) {
            Navigator.pop(context); // إغلاق مؤشر التحميل
            Navigator.pop(context); // إغلاق حوار الحذف

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S.of(context).errorDeletingInvoice(e.toString())),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
      ),
    );
  }

  void _viewQRCode(InvoiceEntity invoice) {
    if (invoice.qrCode?.isNotEmpty ?? false) {
      showDialog(
        context: context,
        builder: (context) => QRCodeDialog(
          qrCode: invoice.qrCode!,
          invoiceNumber: invoice.invoiceNumber ?? '',
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).noQRCodeAvailable),
          backgroundColor: AppColors.warning,
        ),
      );
    }
  }

  void _viewTaxUID(InvoiceEntity invoice) {
    if (invoice.taxUid?.isNotEmpty ?? false) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(S.of(context).taxUID),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(S.of(context).taxUIDForInvoice(invoice.invoiceNumber ?? '')),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: SelectableText(
                  invoice.taxUid!,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: invoice.taxUid!));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(S.of(context).taxUIDCopied),
                    backgroundColor: AppColors.success,
                  ),
                );
              },
              child: Text(S.of(context).copy),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(S.of(context).close),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).noTaxUIDAvailable),
          backgroundColor: AppColors.warning,
        ),
      );
    }
  }

  void _updateStatus(InvoiceEntity invoice, String status) async {
    // التحقق من صلاحية التعديل قبل التحديث
    final permissionsState = context.read<PermissionsCubit>().state;
    final hasEditPermission = permissionsState.maybeWhen(
      loaded: (permissions) =>
          permissions.hasPermission(InvoicesPermissions.edit),
      orElse: () => false,
    );

    if (!hasEditPermission) {
      PermissionChecker.showPermissionDeniedSnackBar(
        context,
        S.of(context).changeStatus,
      );
      return;
    }

    try {
      // إظهار مؤشر تحميل
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()),
      );

      // تحديث حالة الفاتورة
      await context.read<InvoicesCubit>().updateInvoice(
        id: invoice.id.toString(),
      );

      Navigator.pop(context); // إغلاق مؤشر التحميل

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            S.of(context).invoiceStatusUpdated(_getStatusText(status)),
          ),
          backgroundColor: AppColors.success,
        ),
      );
    } catch (e) {
      Navigator.pop(context); // إغلاق مؤشر التحميل

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).errorUpdatingStatus(e.toString())),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  Widget _buildFloatingActionButton(InvoiceEntity invoice) {
    final s = S.of(context);

    // إذا كان document_type == "credit": إخفاء جميع الإجراءات
    if (invoice.documentType?.toLowerCase() == 'credit') {
      return const SizedBox.shrink();
    }

    // استخدام BlocBuilder للتحقق من الصلاحيات بشكل صحيح
    return BlocBuilder<PermissionsCubit, PermissionsState>(
      builder: (context, permissionsState) {
        final hasDeletePermission = permissionsState.maybeWhen(
          loaded: (permissions) =>
              permissions.hasPermission(InvoicesPermissions.delete),
          orElse: () => false,
        );
        final hasPrintPermission = permissionsState.maybeWhen(
          loaded: (permissions) =>
              permissions.hasPermission(InvoicesPermissions.print),
          orElse: () => false,
        );
        final hasSendPermission = permissionsState.maybeWhen(
          loaded: (permissions) =>
              permissions.hasPermission(InvoicesPermissions.send),
          orElse: () => false,
        );
        final hasEditPermission = permissionsState.maybeWhen(
          loaded: (permissions) =>
              permissions.hasPermission(InvoicesPermissions.edit),
          orElse: () => false,
        );

        // استخدام hashCode من state لضمان تفرد heroTag
        final uniqueId = hashCode;

        // تحديد حالة الفاتورة
        final isPending = invoice.status?.toLowerCase() == 'pending';
        final isSent = invoice.status?.toLowerCase() == 'sent';
        final hasReturnedInvoices =
            invoice.returnedInvoices != null &&
            invoice.returnedInvoices!.isNotEmpty;

        // بناء قائمة الأزرار المتاحة
        final actionButtons = <_ActionButtonItem>[];

        // إذا كان status == "pending": إضافة Edit, Delete, Send
        if (isPending) {
          if (hasSendPermission) {
            actionButtons.add(
              _ActionButtonItem(
                icon: Icons.send,
                label: s.sendInvoice,
                color: AppColors.success,
                onPressed: () => _sendInvoice(invoice),
                enabled: true,
              ),
            );
          }
          if (hasEditPermission) {
            actionButtons.add(
              _ActionButtonItem(
                icon: Icons.edit,
                label: s.editInvoice,
                color: AppColors.primary,
                onPressed: () => _editInvoice(invoice),
                enabled: true,
              ),
            );
          }
          if (hasDeletePermission) {
            actionButtons.add(
              _ActionButtonItem(
                icon: Icons.delete,
                label: s.deleteInvoice,
                color: AppColors.error,
                onPressed: () => _deleteInvoice(invoice),
                enabled: true,
              ),
            );
          }
        }
        // إذا كان status == "sent" وليس لديها returned invoices: إضافة Return
        else if (isSent && !hasReturnedInvoices) {
          actionButtons.add(
            _ActionButtonItem(
              icon: Icons.undo,
              label: s.returnInvoice,
              color: AppColors.warning,
              onPressed: () => _onInvoiceReturn(invoice),
              enabled: true,
            ),
          );
        }

        // Print Button (متاح دائماً)
        if (hasPrintPermission) {
          actionButtons.add(
            _ActionButtonItem(
              icon: Icons.print,
              label: s.printInvoice,
              color: AppColors.warning,
              onPressed: () => _showPrintOptions(invoice),
              enabled: true,
            ),
          );
        }

        // إذا كان عدد الأزرار أكثر من 2، عرض قائمة
        if (actionButtons.length > 2) {
          return FloatingActionButton(
            heroTag: "more_${invoice.id}_$uniqueId",
            onPressed: () => _showActionMenu(context, actionButtons),
            backgroundColor: AppColors.surface,
            child: const Icon(Icons.more_vert, color: AppColors.white),
          );
        }

        // إذا كان عدد الأزرار 2 أو أقل، عرض الأزرار بشكل عمودي
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: actionButtons.map((item) {
            final index = actionButtons.indexOf(item);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Tooltip(
                  message: item.label,
                  child: FloatingActionButton(
                    heroTag: "${item.icon.codePoint}_${invoice.id}_$uniqueId",
                    onPressed: item.enabled ? item.onPressed : null,
                    backgroundColor: item.enabled
                        ? item.color
                        : AppColors.grey.withOpacity(0.5),
                    child: Icon(
                      item.enabled ? item.icon : Icons.lock_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
                if (index < actionButtons.length - 1) SizedBox(height: 8.h),
              ],
            );
          }).toList(),
        );
      },
    );
  }

  void _showActionMenu(BuildContext context, List<_ActionButtonItem> buttons) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          left: 16.w,
          top: 16.w,
          right: 16.w,
          bottom: bottomPadding > 0 ? bottomPadding + 16.w : 16.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: buttons.map((item) {
            return ListTile(
              leading: Icon(item.icon, color: item.color),
              title: Text(item.label),
              onTap: item.enabled
                  ? () {
                      Navigator.pop(context);
                      item.onPressed?.call();
                    }
                  : null,
              enabled: item.enabled,
            );
          }).toList(),
        ),
      ),
    );
  }

  Future<void> _showPrintOptions(InvoiceEntity invoice) async {
    if (BluetoothPrintPlus.isBlueOn) {
      if (BluetoothPrintPlus.isConnected) {
        // عرض dialog الطباعة مباشرة
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => InvoicePrintDialog(
              invoice: _convertInvoiceEntityToModel(invoice),
            ),
          );
        }
      } else {
        // try {
        //   final prefs = await SharedPreferences.getInstance();
        //   final data = prefs.getString("BlUE_DEVICE");

        //   if (data == null) {
        //     // عرض dialog يطلب من المستخدم الذهاب إلى الإعدادات لإضافة جهاز
        //     if (mounted) {
        //       _showNoDeviceDialog();
        //     }
        //     return;
        //   } else {
        //     // محاولة الاتصال بالجهاز المحفوظ
        //     try {
        //       final deviceJson = jsonDecode(data);
        //       final BluetoothDevice device = BluetoothDevice.fromJson(
        //         deviceJson,
        //       );

        //       // إظهار مؤشر تحميل أثناء الاتصال
        //       if (mounted) {
        //         showDialog(
        //           context: context,
        //           barrierDismissible: false,
        //           builder: (context) => Center(
        //             child: Container(
        //               padding: EdgeInsets.all(24.w),
        //               decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 borderRadius: BorderRadius.circular(16.r),
        //               ),
        //               child: Column(
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: [
        //                   CircularProgressIndicator(),
        //                   SizedBox(height: 16.h),
        //                   Text(
        //                     S.of(context).connectingToPrinter,
        //                     style: TextStyle(fontSize: 14.sp),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         );
        //       }

        //       final result = await BluetoothPrintPlus.connect(device);

        //       // إغلاق مؤشر التحميل
        //       if (mounted) {
        //         Navigator.pop(context);
        //       }

        //       if (result) {
        //         // نجح الاتصال - عرض dialog الطباعة
        //         if (mounted) {
        //           showDialog(
        //             context: context,
        //             builder: (context) => InvoicePrintDialog(invoice: invoice),
        //           );
        //         }
        //       } else {
        //         // فشل الاتصال - عرض رسالة تطلب الذهاب إلى الإعدادات
        //         if (mounted) {
        //           _showConnectionFailedDialog();
        //         }
        //       }
        //     } catch (e) {
        //       // خطأ في تحليل البيانات المحفوظة
        //       if (mounted) {
        //         Navigator.pop(context); // إغلاق مؤشر التحميل إن وجد
        //         _showNoDeviceDialog();
        //       }
        //     }
        //   }
        // } catch (e) {
        //   // خطأ في قراءة SharedPreferences
        //   print('Error reading SharedPreferences: $e');
        if (mounted) {
          _showNoDeviceDialog();
        }
        // }
      }
    } else {
      // البلوتوث مغلق - عرض رسالةs
      if (mounted) {
        _showBluetoothOffDialog();
      }
    }
  }

  /// عرض dialog عند عدم وجود جهاز محفوظ
  void _showNoDeviceDialog() {
    final s = S.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Row(
          children: [
            Icon(
              Icons.bluetooth_disabled,
              color: AppColors.warning,
              size: 24.sp,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                S.of(context).noPrinterDeviceSaved,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        content: Text(
          S.of(context).printerDeviceNotFound,
          style: TextStyle(fontSize: 14.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(s.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.printerSettingsRoute);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: Text(s.goToSettings),
          ),
        ],
      ),
    );
  }

  /// عرض dialog عند فشل الاتصال
  void _showConnectionFailedDialog() {
    final s = S.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Row(
          children: [
            Icon(Icons.error_outline, color: AppColors.error, size: 24.sp),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                S.of(context).connectionFailed,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        content: Text(
          S.of(context).connectionFailedMessage,
          style: TextStyle(fontSize: 14.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(s.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.printerSettingsRoute);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: Text(s.goToSettings),
          ),
        ],
      ),
    );
  }

  /// عرض dialog عند إغلاق البلوتوث
  void _showBluetoothOffDialog() {
    final s = S.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Row(
          children: [
            Icon(Icons.bluetooth_disabled, color: AppColors.error, size: 24.sp),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                S.of(context).bluetoothIsOff,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        content: Text(
          S.of(context).bluetoothIsOffMessage,
          style: TextStyle(fontSize: 14.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(s.close),
          ),
        ],
      ),
    );
  }

  /// Convert InvoiceCustomerEntity to InvoiceCustomerModel
  InvoiceCustomerModel? _convertCustomerEntityToModel(
    InvoiceCustomerEntity? entity,
  ) {
    if (entity == null) return null;
    return InvoiceCustomerModel(
      id: entity.id,
      companyId: entity.companyId,
      name: entity.name,
      email: entity.email,
      phone: entity.phone,
      taxNumber: entity.taxNumber,
      address: entity.address,
      notes: entity.notes,
      status: entity.status,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// Convert InvoiceItemEntity to InvoiceItem
  InvoiceItem _convertItemEntityToModel(InvoiceItemEntity entity) {
    return InvoiceItem(
      id: entity.id ?? 0,
      taxInvoiceId: entity.taxInvoiceId ?? 0,
      name: entity.name ?? '',
      description: entity.description ?? '',
      quantity: entity.quantity ?? '0',
      price: entity.price ?? '0.00',
      discount: entity.discount ?? '0.00',
      taxPercent: entity.taxPercent ?? '0.00',
      taxAmount: entity.taxAmount ?? '0.00',
      total: entity.total ?? '0.00',
      createdAt: entity.createdAt ?? '',
      updatedAt: entity.updatedAt ?? '',
      productId: entity.productId ?? 0,
    );
  }

  /// Convert InvoiceEntity to InvoiceModel
  InvoiceModel _convertInvoiceEntityToModel(InvoiceEntity entity) {
    return InvoiceModel(
      id: entity.id,
      invoiceId: entity.invoiceId,
      invoiceNumber: entity.invoiceNumber,
      taxUid: entity.taxUid,
      qrCode: entity.qrCode,
      invoiceType: entity.invoiceType,
      documentType: entity.documentType,
      status: entity.status,
      errorMessage: entity.errorMessage,
      issueDate: entity.issueDate,
      customerName: entity.customerName,
      paymentMethodCode: entity.paymentMethodCode,
      subtotal: entity.subtotal,
      taxAmount: entity.taxAmount,
      discount: entity.discount,
      total: entity.total,
      description: entity.description,
      sentAt: entity.sentAt,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      companyId: entity.companyId,
      customerId: entity.customerId,
      items: entity.items?.map((e) => _convertItemEntityToModel(e)).toList(),
      customer: _convertCustomerEntityToModel(entity.customer),
      apiRequest: null, // Not needed for print dialog
    );
  }
}
