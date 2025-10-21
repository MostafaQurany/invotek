import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/generated/l10n.dart';

class ReceiptPreviewWidget extends StatelessWidget {
  final InvoiceModel invoice;
  final String paperSize;
  final bool showHeader;
  final bool showFooter;

  const ReceiptPreviewWidget({
    super.key,
    required this.invoice,
    this.paperSize = '80mm',
    this.showHeader = true,
    this.showFooter = true,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          if (showHeader) _buildHeader(context, s),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: _buildReceiptContent(context, s),
            ),
          ),
          if (showFooter) _buildFooter(context, s),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, S s) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.receipt_long, color: AppColors.primary, size: 20.sp),
          SizedBox(width: 8.w),
          Text(
            s.thermalReceipt,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              paperSize,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, S s) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12.r),
          bottomRight: Radius.circular(12.r),
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: AppColors.textSecondary, size: 16.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              'معاينة الإيصال - $paperSize',
              style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReceiptContent(BuildContext context, S s) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Header
        Text(
          'فاتورة ضريبية',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          '${s.invoiceNumber}: ${invoice.invoiceNumber}',
          style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
        ),
        Text(
          '${s.issueDate}: ${invoice.issueDate}',
          style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
        ),
        SizedBox(height: 16.h),
        Divider(color: AppColors.border),
        SizedBox(height: 16.h),

        // Customer Info
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '${s.customer}: ${invoice.customerName}',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ),
        SizedBox(height: 16.h),

        // Items
        ...invoice.items?.map(
              (item) => Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        item.name ?? '',
                        style: TextStyle(fontSize: 12.sp),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '${item.quantity} x ${item.price}',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      item.total.toString(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ) ??
            [],

        SizedBox(height: 16.h),
        Divider(color: AppColors.border),
        SizedBox(height: 16.h),

        // Totals
        _buildTotalRow(s.subtotal, invoice.subtotal ?? '0'),
        _buildTotalRow(s.tax, invoice.taxAmount ?? '0'),
        _buildTotalRow(s.discount, invoice.discount ?? '0'),
        SizedBox(height: 8.h),
        Divider(color: AppColors.border, thickness: 2),
        SizedBox(height: 8.h),
        _buildTotalRow(s.total, invoice.total ?? '0', isTotal: true),

        SizedBox(height: 24.h),
        Text(
          s.thankYou,
          style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildTotalRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 14.sp : 12.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? AppColors.primary : AppColors.textPrimary,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 14.sp : 12.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? AppColors.primary : AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class ReceiptPreviewCard extends StatelessWidget {
  final InvoiceModel invoice;
  final String paperSize;
  final VoidCallback? onPrint;
  final VoidCallback? onEdit;

  const ReceiptPreviewCard({
    super.key,
    required this.invoice,
    this.paperSize = '80mm',
    this.onPrint,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.05),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.receipt_long, color: AppColors.primary, size: 20.sp),
                SizedBox(width: 8.w),
                Text(
                  'معاينة الإيصال',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    paperSize,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Receipt Preview
          SizedBox(
            height: 300.h,
            child: ReceiptPreviewWidget(
              invoice: invoice,
              paperSize: paperSize,
              showHeader: false,
              showFooter: false,
            ),
          ),

          // Actions
          Container(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                if (onEdit != null) ...[
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: onEdit,
                      icon: Icon(Icons.edit, size: 16.sp),
                      label: Text('تعديل'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: BorderSide(color: AppColors.primary),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                ],
                if (onPrint != null)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: onPrint,
                      icon: Icon(Icons.print, size: 16.sp),
                      label: Text(s.printReceipt),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
