import 'dart:convert';

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
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/invoices/demo/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_additional_info_card.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_customer_card.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_items_card.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_payment_card.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_summary_card.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/delete_invoice_dialog.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/mark_paid_dialog.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/qr_code_dialog.dart';
import 'package:invotek/features/invoices/ui/widgets/headers/invoice_details_header_widget.dart';
import 'package:invotek/features/printing/ui/dialogs/invoice_print_dialog.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/domain/cubit/products_cubit.dart';
import 'package:invotek/features/products/ui/screens/product_details_screen.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          body: BlocListener<ProductsCubit, ProductsState>(
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
                        builder: (context) => BlocProvider<ProductsCubit>.value(
                          value: _productsCubit,
                          child: ProductDetailsScreen(product: selectedProduct),
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
                  loaded: (invoices, selectedInvoice, currentPage, totalPages) {
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
                      Icons.arrow_back,
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
                      Icons.arrow_back,
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

  Widget _buildContent(InvoiceModel? invoice) {
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
                  invoice.customer ??
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
              items: invoice.items ?? [],
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
  void _editInvoice(InvoiceModel invoice) {
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

    Navigator.pushNamed(
      context,
      AppRoutes.editInvoiceRoute,
      arguments: invoice,
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

  void _showStatusOptions(InvoiceModel invoice) {
    showModalBottomSheet(
      context: context,
      useSafeArea: false,
      isScrollControlled: true,
      builder: (context) => _buildStatusOptionsBottomSheet(invoice),
    );
  }

  Widget _buildStatusOptionsBottomSheet(InvoiceModel invoice) {
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

  void _viewCustomerDetails(InvoiceModel invoice) {
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

  void _changePaymentMethod(InvoiceModel invoice) {
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

  void _markAsPaid(InvoiceModel invoice) {
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

  void _deleteInvoice(InvoiceModel invoice) {
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

  void _viewQRCode(InvoiceModel invoice) {
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

  void _viewTaxUID(InvoiceModel invoice) {
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

  void _updateStatus(InvoiceModel invoice, String status) async {
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

  Widget _buildFloatingActionButton(InvoiceModel invoice) {
    final s = S.of(context);
    final canDelete = invoice.status?.toLowerCase() == 'draft';

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

        // استخدام hashCode من state لضمان تفرد heroTag
        final uniqueId = hashCode;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Delete Button (only for draft invoices)
            if (canDelete) ...[
              Tooltip(
                message: hasDeletePermission
                    ? s.deleteInvoice
                    : s.invoicesNoPermissionToAct,
                child: FloatingActionButton(
                  heroTag: "delete_${invoice.id}_$uniqueId",
                  onPressed: hasDeletePermission
                      ? () => _deleteInvoice(invoice)
                      : null,
                  backgroundColor: hasDeletePermission
                      ? AppColors.error
                      : AppColors.grey.withOpacity(0.5),
                  child: Icon(
                    hasDeletePermission ? Icons.delete : Icons.lock_outline,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
            ],
            // Print Button
            Tooltip(
              message: hasPrintPermission
                  ? s.printInvoice
                  : s.invoicesNoPermissionToAct,
              child: FloatingActionButton(
                heroTag: "print_${invoice.id}_$uniqueId",
                onPressed: hasPrintPermission
                    ? () => _showPrintOptions(invoice)
                    : null,
                backgroundColor: hasPrintPermission
                    ? AppColors.warning
                    : AppColors.grey.withOpacity(0.5),
                child: Icon(
                  hasPrintPermission ? Icons.print : Icons.lock_outline,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 8.h),

            // // Send Invoice Button
            // FloatingActionButton(
            //   heroTag: "send_${invoice.id}",
            //   onPressed: () => _sendInvoice(invoice),
            //   backgroundColor: AppColors.success,
            //   tooltip: 'إرسال الفاتورة',
            //   child: const Icon(Icons.send, color: Colors.white),
            // ),
            // SizedBox(height: 8.h),

            // // Edit Invoice Button
            // FloatingActionButton(
            //   heroTag: "edit_${invoice.id}",
            //   onPressed: () => _editInvoice(invoice),
            //   backgroundColor: AppColors.primary,
            //   tooltip: 'تعديل الفاتورة',
            //   child: const Icon(Icons.edit, color: Colors.white),
            // ),
            // SizedBox(height: 8.h),

            // // More Options Button
            // FloatingActionButton(
            //   heroTag: "more_${invoice.id}",
            //   onPressed: () => _showMoreOptions(invoice),
            //   backgroundColor: AppColors.surface,
            //   tooltip: 'المزيد',
            //   child: const Icon(Icons.more_vert, color: AppColors.textPrimary),
            // ),
          ],
        );
      },
    );
  }

  Future<void> _showPrintOptions(InvoiceModel invoice) async {
    // التحقق من صلاحية الطباعة قبل فتح الحوار
    final permissionsState = context.read<PermissionsCubit>().state;
    final hasPrintPermission = permissionsState.maybeWhen(
      loaded: (permissions) =>
          permissions.hasPermission(InvoicesPermissions.print),
      orElse: () => false,
    );

    if (!hasPrintPermission) {
      PermissionChecker.showPermissionDeniedSnackBar(
        context,
        S.of(context).printInvoice,
      );
      return;
    }

    if (BluetoothPrintPlus.isBlueOn) {
      if (BluetoothPrintPlus.isConnected) {
        // عرض dialog الطباعة مباشرة
        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => InvoicePrintDialog(invoice: invoice),
          );
        }
      } else {
        // الحصول على آخر جهاز محفوظ
        try {
          final prefs = await SharedPreferences.getInstance();
          final data = prefs.getString("BlUE_DEVICE");

          if (data == null) {
            // عرض dialog يطلب من المستخدم الذهاب إلى الإعدادات لإضافة جهاز
            if (mounted) {
              _showNoDeviceDialog();
            }
          } else {
            // محاولة الاتصال بالجهاز المحفوظ
            try {
              final deviceJson = jsonDecode(data);
              final BluetoothDevice device = BluetoothDevice.fromJson(
                deviceJson,
              );

              // إظهار مؤشر تحميل أثناء الاتصال
              if (mounted) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => Center(
                    child: Container(
                      padding: EdgeInsets.all(24.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16.h),
                          Text(
                            S.of(context).connectingToPrinter,
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              final result = await BluetoothPrintPlus.connect(device);

              // إغلاق مؤشر التحميل
              if (mounted) {
                Navigator.pop(context);
              }

              if (result) {
                // نجح الاتصال - عرض dialog الطباعة
                if (mounted) {
                  showDialog(
                    context: context,
                    builder: (context) => InvoicePrintDialog(invoice: invoice),
                  );
                }
              } else {
                // فشل الاتصال - عرض رسالة تطلب الذهاب إلى الإعدادات
                if (mounted) {
                  _showConnectionFailedDialog();
                }
              }
            } catch (e) {
              // خطأ في تحليل البيانات المحفوظة
              if (mounted) {
                Navigator.pop(context); // إغلاق مؤشر التحميل إن وجد
                _showNoDeviceDialog();
              }
            }
          }
        } catch (e) {
          // خطأ في قراءة SharedPreferences
          if (mounted) {
            _showNoDeviceDialog();
          }
        }
      }
    } else {
      // البلوتوث مغلق - عرض رسالة
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
}
