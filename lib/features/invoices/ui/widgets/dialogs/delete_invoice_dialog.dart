import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/generated/l10n.dart';

class DeleteInvoiceDialog extends StatelessWidget {
  final InvoiceModel invoice;
  final VoidCallback onDelete;

  const DeleteInvoiceDialog({
    super.key,
    required this.invoice,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      contentPadding: EdgeInsets.all(24.w),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Warning Icon
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: AppColors.error.withOpacity(0.1),
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: Icon(
              Icons.warning_amber,
              size: 40.sp,
              color: AppColors.error,
            ),
          ),

          SizedBox(height: 24.h),

          // Title
          Text(
            S.of(context).deleteInvoice,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),

          SizedBox(height: 12.h),

          // Description
          Text(
            S.of(context).deleteInvoiceConfirmation,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),

          SizedBox(height: 8.h),

          // Invoice Info
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Icon(Icons.receipt_long, size: 20.sp, color: AppColors.primary),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        invoice.invoiceNumber ?? "Invoice Number",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        invoice.customerName ?? "Customer Name",
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

          SizedBox(height: 24.h),

          // Warning Text
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.error.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppColors.error.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.info, size: 20.sp, color: AppColors.error),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    S.of(context).deleteInvoiceWarning,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.error,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        // Cancel Button
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            S.of(context).cancel,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
        ),

        // Delete Button
        ElevatedButton(
          onPressed: () {
            onDelete();
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.error,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            S.of(context).delete,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
