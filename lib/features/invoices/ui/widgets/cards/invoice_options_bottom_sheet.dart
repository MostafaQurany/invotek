import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/generated/l10n.dart';

class InvoiceOptionsBottomSheet extends StatelessWidget {
  final InvoiceModel invoice;
  final VoidCallback? onView;
  final VoidCallback? onEdit;
  final VoidCallback? onSend;
  final VoidCallback? onMarkPaid;
  final VoidCallback? onDuplicate;
  final VoidCallback? onDownload;
  final VoidCallback? onDelete;

  const InvoiceOptionsBottomSheet({
    super.key,
    required this.invoice,
    this.onView,
    this.onEdit,
    this.onSend,
    this.onMarkPaid,
    this.onDuplicate,
    this.onDownload,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle
          Container(
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          SizedBox(height: 20.h),

          // Invoice Info
          _buildInvoiceInfo(),

          SizedBox(height: 24.h),

          // Action Buttons
          _buildActionButtons(),

          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildInvoiceInfo() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(
              Icons.receipt_long,
              color: AppColors.primary,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  invoice.invoiceNumber ?? "Invoice Number",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
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
          _buildStatusBadge(invoice.status ?? "pending"),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    Color backgroundColor;
    Color textColor;
    String statusText;

    switch (status.toLowerCase()) {
      case 'paid':
        backgroundColor = AppColors.success.withOpacity(0.1);
        textColor = AppColors.success;
        statusText = S.current.paid;
        break;
      case 'pending':
        backgroundColor = AppColors.warning.withOpacity(0.1);
        textColor = AppColors.warning;
        statusText = S.current.pending;
        break;
      case 'overdue':
        backgroundColor = AppColors.error.withOpacity(0.1);
        textColor = AppColors.error;
        statusText = S.current.overdue;
        break;
      case 'draft':
        backgroundColor = AppColors.textSecondary.withOpacity(0.1);
        textColor = AppColors.textSecondary;
        statusText = S.current.draft;
        break;
      default:
        backgroundColor = AppColors.textSecondary.withOpacity(0.1);
        textColor = AppColors.textSecondary;
        statusText = status;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        statusText,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // View Button
        _buildActionButton(
          icon: Icons.visibility,
          label: S.current.view,
          color: AppColors.primary,
          onTap: onView,
        ),

        SizedBox(height: 12.h),

        // Edit Button
        _buildActionButton(
          icon: Icons.edit,
          label: S.current.edit,
          color: AppColors.warning,
          onTap: onEdit,
        ),

        SizedBox(height: 12.h),

        // Send Button
        if (invoice.status?.toLowerCase() != 'paid')
          _buildActionButton(
            icon: Icons.send,
            label: S.current.send,
            color: AppColors.success,
            onTap: onSend,
          ),

        if (invoice.status?.toLowerCase() != 'paid') SizedBox(height: 12.h),

        // Mark as Paid Button
        if (invoice.status?.toLowerCase() != 'paid')
          _buildActionButton(
            icon: Icons.check_circle,
            label: S.current.markAsPaid,
            color: AppColors.success,
            onTap: onMarkPaid,
          ),

        if (invoice.status?.toLowerCase() != 'paid') SizedBox(height: 12.h),

        // Duplicate Button
        _buildActionButton(
          icon: Icons.copy,
          label: S.current.duplicate,
          color: AppColors.info,
          onTap: onDuplicate,
        ),

        SizedBox(height: 12.h),

        // Download Button
        _buildActionButton(
          icon: Icons.download,
          label: S.current.downloadPDF,
          color: AppColors.primary,
          onTap: onDownload,
        ),

        SizedBox(height: 12.h),

        // Delete Button
        _buildActionButton(
          icon: Icons.delete,
          label: S.current.delete,
          color: AppColors.error,
          onTap: onDelete,
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: color.withOpacity(0.3), width: 1),
          ),
          child: Row(
            children: [
              Icon(icon, size: 20.sp, color: color),
              SizedBox(width: 16.w),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
