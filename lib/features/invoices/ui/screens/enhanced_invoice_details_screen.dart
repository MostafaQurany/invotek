import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/core/widgets/loading_widget.dart';
import 'package:invotek/core/widgets/error_widget.dart' as custom;
import 'package:invotek/features/invoices/data/models/invoice_customer_model.dart';
import 'package:invotek/features/invoices/demo/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/features/invoices/ui/widgets/headers/invoice_details_header_widget.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_summary_card.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_customer_card.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_items_card.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_payment_card.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_additional_info_card.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/delete_invoice_dialog.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/send_invoice_dialog.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/mark_paid_dialog.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/qr_code_dialog.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:invotek/features/products/demo/cubit/products_cubit.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/features/products/ui/screens/product_details_screen.dart';
import 'package:invotek/features/customers/demo/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';
import 'package:invotek/features/customers/data/repository/customers_repository.dart';
import 'package:invotek/features/customers/ui/screens/customer_details_screen.dart';

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
  int? _loadingProductId;

  // إضافة CustomersCubit محلي
  late CustomersCubit _customersCubit;
  bool _isLoadingCustomer = false;
  int? _loadingCustomerId;

  @override
  void initState() {
    super.initState();
    // إنشاء ProductsCubit محلي
    _productsCubit = ProductsCubit(getIt<ProductsRepository>());
    // إنشاء CustomersCubit محلي
    _customersCubit = CustomersCubit(getIt<CustomersRepository>());

    // استدعاء API لجلب تفاصيل الفاتورة
    context.read<InvoicesCubit>().getInvoiceById(widget.invoiceId);
  }

  @override
  void dispose() {
    _productsCubit.close();
    _customersCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                _loadingProductId = null;

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
                (products, selectedProduct, currentPage, totalPages, error) {
                  if (_isLoadingProduct) {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }

                    _isLoadingProduct = false;
                    _loadingProductId = null;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(error),
                        backgroundColor: AppColors.error,
                      ),
                    );
                  }
                },
          );
        },
        child: BlocListener<CustomersCubit, CustomersState>(
          bloc: _customersCubit,
          listener: (context, customersState) {
            customersState.whenOrNull(
              loaded: (customers, selectedCustomer, currentPage, totalPages) {
                if (selectedCustomer != null && _isLoadingCustomer) {
                  // إغلاق مؤشر التحميل
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }

                  _isLoadingCustomer = false;
                  _loadingCustomerId = null;

                  // الانتقال إلى شاشة تفاصيل العميل
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider<CustomersCubit>.value(
                        value: _customersCubit,
                        child: CustomerDetailsScreen(customer: selectedCustomer),
                      ),
                    ),
                  );
                }
              },
              failure: (customers, selectedCustomer, currentPage, totalPages, error) {
                if (_isLoadingCustomer) {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }

                  _isLoadingCustomer = false;
                  _loadingCustomerId = null;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('خطأ في تحميل العميل: $error'),
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
                    (invoices, selectedInvoice, currentPage, totalPages, error) =>
                        _buildLoadingState(),
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
                    (invoices, selectedInvoice, currentPage, totalPages, error) {
                  return _buildErrorState(error);
                },
              );
            },
          ),
        ),
      ),
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
          // Modern Header with Animation
          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration.zero,
              child: InvoiceDetailsHeaderWidget(
                invoice: invoice,
                onBack: () => Navigator.pop(context),
                onEdit: () => _editInvoice(invoice),
              ),
            ),
          ),

          // Space with Animation
          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 200),
              child: SizedBox(height: 16.h),
            ),
          ),

          // Content Cards with Staggered Animation
          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 400),
              child: InvoiceSummaryCard(
                invoice: invoice,
                onStatusTap: () => _showStatusOptions(invoice),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 600),
              child: SizedBox(height: 16.h),
            ),
          ),

          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 800),
              child: InvoiceCustomerCard(
                customer:
                    invoice.customer ??
                    InvoiceCustomerModel(
                      id: 0,
                      name: invoice.customerName ?? "اسم العميل",
                      email: "بريد العميل",
                      phone: "هاتف العميل",
                      companyId: 0,
                      taxNumber: "0",
                      address: "عنوان العميل",
                      notes: "ملاحظات",
                      status: "0",
                      createdAt: "0",
                      updatedAt: "0",
                    ),
                onCustomerTap: () => _viewCustomerDetails(invoice),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 1000),
              child: SizedBox(height: 16.h),
            ),
          ),

          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 1200),
              child: InvoiceItemsCard(
                items: invoice.items ?? [],
                onItemTap: (item) {
                  _viewItemDetails(item);
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 1400),
              child: SizedBox(height: 16.h),
            ),
          ),

          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 1600),
              child: InvoicePaymentCard(
                invoice: invoice,
                onPaymentMethodTap: () => _changePaymentMethod(invoice),
                onMarkPaid: () => _markAsPaid(invoice),
              ),
            ),
          ),

          // Additional Information Card
          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 1800),
              child: SizedBox(height: 16.h),
            ),
          ),

          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 2000),
              child: InvoiceAdditionalInfoCard(
                invoice: invoice,
                onQRCodeTap: () => _viewQRCode(invoice),
                onTaxUIDTap: () => _viewTaxUID(invoice),
              ),
            ),
          ),

          // Bottom spacing
          SliverToBoxAdapter(child: SizedBox(height: 100.h)),
        ],
      ),
      //   floatingActionButton: _buildFloatingActionButton(invoice),
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
      builder: (context) => _buildStatusOptionsBottomSheet(invoice),
    );
  }

  Widget _buildStatusOptionsBottomSheet(InvoiceModel invoice) {
    return Container(
      padding: EdgeInsets.all(16.w),
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
    if (invoice.customer?.id != null) {
      _isLoadingCustomer = true;
      _loadingCustomerId = invoice.customer!.id;
      
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16.h),
              Text('جاري تحميل تفاصيل العميل...'),
            ],
          ),
        ),
      );

      _customersCubit.getCustomerById(invoice.customer!.id!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('لا يوجد معرف عميل متاح'),
          backgroundColor: AppColors.warning,
        ),
      );
    }
  }

  void _viewItemDetails(dynamic item) {
    if (item.productId != null) {
      _isLoadingProduct = true;
      _loadingProductId = item.productId;

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
          content: Text('لا يوجد معرف منتج متاح'),
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

  void _sendInvoice(InvoiceModel invoice) {
    showDialog(
      context: context,
      builder: (context) => SendInvoiceDialog(
        invoice: invoice,
        onSend: () async {
          try {
            // إظهار مؤشر تحميل
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(child: CircularProgressIndicator()),
            );

            // استدعاء API لإرسال الفاتورة
            // TODO: إضافة دالة sendInvoice في InvoicesCubit
            await Future.delayed(Duration(seconds: 2)); // محاكاة API call

            Navigator.pop(context); // إغلاق مؤشر التحميل
            Navigator.pop(context); // إغلاق حوار الإرسال

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S.of(context).invoiceSentSuccessfully),
                backgroundColor: AppColors.success,
              ),
            );
          } catch (e) {
            Navigator.pop(context); // إغلاق مؤشر التحميل
            Navigator.pop(context); // إغلاق حوار الإرسال

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S.of(context).errorSendingInvoice(e.toString())),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
      ),
    );
  }

  void _showMoreOptions(InvoiceModel invoice) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _buildMoreOptionsBottomSheet(invoice),
    );
  }

  Widget _buildMoreOptionsBottomSheet(InvoiceModel invoice) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.delete, color: AppColors.error),
            title: Text(S.of(context).deleteInvoice),
            onTap: () {
              Navigator.pop(context);
              _deleteInvoice(invoice);
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.copy, color: AppColors.primary),
          //   title: Text('تكرار الفاتورة'),
          //   onTap: () {
          //     Navigator.pop(context);
          //     _duplicateInvoice(invoice);
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.download, color: AppColors.success),
            title: Text(S.of(context).downloadPDF),
            onTap: () {
              Navigator.pop(context);
              _downloadPDF(invoice);
            },
          ),
          ListTile(
            leading: const Icon(Icons.refresh, color: AppColors.primary),
            title: Text(S.of(context).refreshData),
            onTap: () {
              Navigator.pop(context);
              context.read<InvoicesCubit>().getInvoiceById(widget.invoiceId);
            },
          ),
        ],
      ),
    );
  }

  void _deleteInvoice(InvoiceModel invoice) {
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

  void _duplicateInvoice(InvoiceModel invoice) {
    // TODO: Implement duplicate invoice
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          S.of(context).duplicateInvoiceMessage(invoice.invoiceNumber ?? ''),
        ),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _downloadPDF(InvoiceModel invoice) async {
    try {
      // إظهار مؤشر تحميل
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16.h),
              Text(S.of(context).creatingFile),
            ],
          ),
        ),
      );

      // إنشاء ملف نصي
      final textContent = _buildPrintText(invoice);

      // حفظ الملف
      final directory = await getApplicationDocumentsDirectory();
      final fileName = S
          .of(context)
          .fileName(
            invoice.invoiceNumber ?? 'غير_محدد',
            DateTime.now().millisecondsSinceEpoch.toString(),
          );
      final file = File('${directory.path}/$fileName');
      await file.writeAsString(textContent);

      Navigator.pop(context); // إغلاق مؤشر التحميل

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).fileSavedSuccessfully(file.path)),
          backgroundColor: AppColors.success,
        ),
      );
    } catch (e) {
      Navigator.pop(context); // إغلاق مؤشر التحميل

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).errorCreatingFile(e.toString())),
          backgroundColor: AppColors.error,
        ),
      );
    }
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
        status: status,
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

  /// إنشاء نص للطباعة
  String _buildPrintText(InvoiceModel invoice) {
    final s = S.of(context);
    final buffer = StringBuffer();

    // Header
    final separator = s.separator * 50;
    buffer.writeln(separator);
    buffer.writeln(s.invoiceDetails);
    buffer.writeln(separator);
    buffer.writeln(
      '${s.invoiceNumber}: ${invoice.invoiceNumber ?? 'غير محدد'}',
    );
    buffer.writeln('${s.date}: ${invoice.issueDate ?? 'غير محدد'}');
    buffer.writeln('${s.status}: ${_getStatusText(invoice.status ?? '')}');
    buffer.writeln();

    // Customer Information
    buffer.writeln('${s.customerInformation}:');
    buffer.writeln('${s.customerName}: ${invoice.customerName ?? 'غير محدد'}');
    if (invoice.customer?.email?.isNotEmpty ?? false) {
      buffer.writeln('${s.customerEmail}: ${invoice.customer!.email}');
    }
    if (invoice.customer?.phone?.isNotEmpty ?? false) {
      buffer.writeln('${s.customerPhone}: ${invoice.customer!.phone}');
    }
    if (invoice.customer?.address?.isNotEmpty ?? false) {
      buffer.writeln('${s.customerAddress}: ${invoice.customer!.address}');
    }
    buffer.writeln();

    // Invoice Items
    if (invoice.items?.isNotEmpty ?? false) {
      buffer.writeln('${s.invoiceItems}:');
      final itemSeparator = s.itemSeparator * 50;
      buffer.writeln(itemSeparator);
      buffer.writeln(s.itemHeader);
      buffer.writeln(itemSeparator);

      for (final item in invoice.items!) {
        buffer.writeln(
          s.itemRow(
            item.name ?? '',
            item.quantity?.toString() ?? '0',
            item.price ?? '0.00',
            item.total ?? '0.00',
          ),
        );
      }
      buffer.writeln();
    }

    // Totals
    buffer.writeln('${s.amountInformation}:');
    buffer.writeln(s.subtotalLine(invoice.subtotal ?? '0.00'));
    if (double.tryParse(invoice.taxAmount ?? '0.00') != null &&
        double.tryParse(invoice.taxAmount ?? '0.00')! > 0) {
      buffer.writeln(s.taxLine(invoice.taxAmount ?? '0.00'));
    }
    buffer.writeln(s.totalLine(invoice.total ?? '0.00'));
    buffer.writeln();

    // Footer
    buffer.writeln(separator);
    buffer.writeln(s.thankYouMessage);
    buffer.writeln(s.createdByInvotek);
    buffer.writeln(separator);

    return buffer.toString();
  }
}
