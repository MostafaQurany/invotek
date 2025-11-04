import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/widgets/customer details widgets/customer_invoices_cubit.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/invoices/ui/screens/invoice_details_screen.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_card.dart';
import 'package:invotek/generated/l10n.dart';

class CustomerInvoicesListScreen extends StatefulWidget {
  final CustomerModel customer;

  const CustomerInvoicesListScreen({super.key, required this.customer});

  @override
  State<CustomerInvoicesListScreen> createState() =>
      _CustomerInvoicesListScreenState();
}

class _CustomerInvoicesListScreenState
    extends State<CustomerInvoicesListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // تحميل المزيد من الفواتير عند الوصول لنهاية القائمة
      context.read<CustomerInvoicesCubit>().loadMoreInvoices(
        widget.customer.id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            AnimatedEntryWidget(
              delay: Duration.zero,
              child: _buildHeader(context),
            ),

            // Content
            Expanded(
              child: BlocBuilder<CustomerInvoicesCubit, CustomerInvoicesState>(
                builder: (context, state) {
                  if (state is CustomerInvoicesInitial) {
                    return _buildEmptyState(context);
                  } else if (state is CustomerInvoicesLoading) {
                    return _buildLoadingState(context);
                  } else if (state is CustomerInvoicesLoaded) {
                    return _buildInvoicesList(context, state.invoices);
                  } else if (state is CustomerInvoicesError) {
                    return _buildErrorState(context, state.failure);
                  }
                  return _buildEmptyState(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
          // Back Button
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.textPrimary,
              size: 20.sp,
            ),
          ),

          SizedBox(width: 8.w),

          // Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).customerInvoices,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  widget.customer.name,
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

  Widget _buildInvoicesList(BuildContext context, List<InvoiceModel> invoices) {
    if (invoices.isEmpty) {
      return _buildEmptyState(context);
    }

    final cubit = context.read<CustomerInvoicesCubit>();
    final isLoadingMore = cubit.isLoadingMore;

    return AnimatedEntryWidget(
      delay: Duration(milliseconds: 200),
      child: RefreshIndicator(
        onRefresh: () => cubit.refreshInvoices(widget.customer.id),
        child: ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          itemCount: invoices.length + (isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == invoices.length) {
              // مؤشر التحميل في نهاية القائمة
              return _buildLoadingMoreIndicator();
            }

            final invoice = invoices[index];
            return InvoiceCard(
              invoice: invoice,
              onTap: () => _navigateToInvoiceDetails(context, invoice),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return AnimatedEntryWidget(
      delay: Duration(milliseconds: 200),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: AppColors.primary),
            SizedBox(height: 16.h),
            Text(
              S.of(context).loadingInvoices,
              style: TextStyle(fontSize: 16.sp, color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingMoreIndicator() {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20.w,
              height: 20.w,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primary,
              ),
            ),
            SizedBox(width: 12.w),
            Text(
              'جاري تحميل المزيد...',
              style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return AnimatedEntryWidget(
      delay: Duration(milliseconds: 200),
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
              S.of(context).customerInvoices,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'لا توجد فواتير لهذا العميل',
              style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, failure) {
    return AnimatedEntryWidget(
      delay: Duration(milliseconds: 200),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64.sp, color: AppColors.error),
            SizedBox(height: 16.h),
            Text(
              S.of(context).errorOccurredWithMessage(failure.message),
              style: TextStyle(fontSize: 16.sp, color: AppColors.textPrimary),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                context.read<CustomerInvoicesCubit>().refreshInvoices(
                  widget.customer.id,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
              ),
              child: Text(S.of(context).retry),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToInvoiceDetails(BuildContext context, InvoiceModel invoice) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InvoiceDetailsScreen(invoice: invoice),
      ),
    );
  }
}
