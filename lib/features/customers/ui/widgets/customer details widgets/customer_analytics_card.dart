import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/widgets/customer details widgets/customer_invoices_cubit.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/generated/l10n.dart';

class CustomerAnalyticsCard extends StatefulWidget {
  final CustomerModel customer;

  const CustomerAnalyticsCard({super.key, required this.customer});

  @override
  State<CustomerAnalyticsCard> createState() => _CustomerAnalyticsCardState();
}

class _CustomerAnalyticsCardState extends State<CustomerAnalyticsCard> {
  @override
  void initState() {
    super.initState();
    // تحميل فواتير العميل عند إنشاء العنصر
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CustomerInvoicesCubit>().loadCustomerInvoices(
        widget.customer.id,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.analytics_outlined,
                color: AppColors.primary,
                size: 24.sp,
              ),
              SizedBox(width: 12.w),
              Text(
                S.of(context).lastInvoices,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          BlocBuilder<CustomerInvoicesCubit, CustomerInvoicesState>(
            builder: (context, state) {
              if (state is CustomerInvoicesInitial) {
                return const SizedBox();
              } else if (state is CustomerInvoicesLoading) {
                return _buildLoadingState();
              } else if (state is CustomerInvoicesLoaded) {
                return _buildInvoicesList(state.invoices, state.totalInvoices);
              } else if (state is CustomerInvoicesError) {
                return _buildErrorState(state.failure);
              }else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState() {
    return SizedBox(
      height: 120.h,
      child: Center(child: CircularProgressIndicator(color: AppColors.primary)),
    );
  }

  Widget _buildErrorState(Failure failure) {
    return SizedBox(
      height: 120.h,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: AppColors.error, size: 32.sp),
            SizedBox(height: 8.h),
            Text(
              S.of(context).errorLoadingInvoices,
              style: TextStyle(color: AppColors.error, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvoicesList(List<InvoiceModel> invoices, int totalInvoices) {
    if (invoices.isEmpty) {
      return SizedBox(
        height: 120.h,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.receipt_long_outlined,
                color: AppColors.greyDark,
                size: 32.sp,
              ),
              SizedBox(height: 8.h),
              Text(
                S.of(context).noInvoices,
                style: TextStyle(color: AppColors.greyDark, fontSize: 14.sp),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        // // إحصائيات سريعة
        // Row(
        //   children: [
        //     Expanded(
        //       child: _buildStatCard(
        //         icon: Icons.receipt_long,
        //         label: S.of(context).totalInvoices,
        //         value: invoices.length.toString(),
        //         subtitle: S.of(context).lastFiveInvoices,
        //       ),
        //     ),
        //     SizedBox(width: 16.w),
        //     Expanded(
        //       child: _buildStatCard(
        //         icon: Icons.paid,
        //         label: S.of(context).totalAmount,
        //         value: _calculateTotalAmount(invoices),
        //         subtitle: S.of(context).saudiRiyal,
        //       ),
        //     ),
        //   ],
        // ),
        // SizedBox(height: 16.h),

        // قائمة الفواتير المختصرة
        ...invoices.take(5).map((invoice) => _buildInvoiceItem(invoice)),

        if (invoices.length > 3)
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              S.of(context).customersLastFiveInvoices,
              style: TextStyle(
                color: AppColors.greyDark,
                fontSize: 12.sp,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: 24.sp),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.greyDark,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            subtitle,
            style: TextStyle(fontSize: 10.sp, color: AppColors.greyDark),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceItem(InvoiceModel invoice) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.greyLight.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.greyLight, width: 1),
      ),
      child: Row(
        children: [
          Icon(Icons.receipt, color: AppColors.primary, size: 20.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  invoice.invoiceNumber ?? S.of(context).invoiceUnknown,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  invoice.total ?? '0.00',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.success,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: _getStatusColor(invoice.status).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              invoice.status ?? S.of(context).invoiceUnknown,
              style: TextStyle(
                fontSize: 10.sp,
                color: _getStatusColor(invoice.status),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _calculateTotalAmount(List<InvoiceModel> invoices) {
    double total = 0.0;
    for (var invoice in invoices) {
      total += double.tryParse(invoice.total ?? '0') ?? 0.0;
    }
    return total.toStringAsFixed(2);
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'paid':
      case 'مدفوعة':
        return AppColors.success;
      case 'pending':
      case 'معلقة':
        return AppColors.warning;
      case 'cancelled':
      case 'ملغية':
        return AppColors.error;
      case 'draft':
      case 'مسودة':
        return AppColors.greyDark;
      case 'overdue':
      case 'متأخرة':
        return AppColors.error;
      case 'sent':
      case 'مرسلة':
        return AppColors.primary;
      case 'returned':
      case 'مرتجعة':
        return AppColors.warning;
      default:
        return AppColors.greyDark;
    }
  }
}
