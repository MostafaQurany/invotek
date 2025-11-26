import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/currency_formatter.dart';
import 'package:invotek/core/utils/date_formatter.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/generated/l10n.dart';

class InvoiceCard extends StatelessWidget {
  final InvoiceEntity invoice;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onView;
  final VoidCallback? onSend;
  final VoidCallback? onReturn;
  const InvoiceCard({
    super.key,
    required this.invoice,
    this.onTap,
    this.onEdit,
    this.onDelete,
    this.onView,
    this.onSend,
    this.onReturn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row
                Row(
                  children: [
                    // Invoice Number
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            invoice.invoiceNumber ??
                                S.of(context).invoicesInvoiceNumber,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            invoice.customerName ??
                                S.of(context).invoicesCustomerName,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Status Badge
                    _buildStatusBadge(
                      invoiceType:
                          invoice.documentType?.toLowerCase() ?? "invoice",
                      status: invoice.status ?? "pending",
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                // Amount and Date Row
                Row(
                  children: [
                    // Amount
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).amount,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          CurrencyFormatter.formatCurrencyString(
                            invoice.total,
                            context,
                          ),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    // actions based on document_type and status
                    _buildActionButtons(context),
                  ],
                ),

                SizedBox(height: 12.h),

                // Payment Method
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Date
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).date,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          _formatDate(invoice.issueDate ?? ""),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${invoice.items?.length ?? 0} ${S.of(context).items}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),

                // عرض فواتير الإرجاع إذا كانت موجودة
                if (invoice.returnedInvoices != null &&
                    invoice.returnedInvoices!.isNotEmpty)
                  _buildCreditInvoiceSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCreditInvoiceSection(BuildContext context) {
    final returnedInvoices = invoice.returnedInvoices ?? [];
    if (returnedInvoices.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: EdgeInsets.only(top: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.warning.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.warning.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.undo, size: 16.sp, color: AppColors.warning),
              SizedBox(width: 8.w),
              Text(
                S.of(context).creditInvoice,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.warning,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          // عرض جميع فواتير الإرجاع
          ...returnedInvoices.map((returnedInvoice) {
            return Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(
                returnedInvoice.invoiceNumber ?? 'N/A',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    // إذا كان document_type == "credit": إخفاء جميع الإجراءات
    if (invoice.documentType?.toLowerCase() == 'credit') {
      return const SizedBox.shrink();
    }

    // إذا كان document_type == "invoice"
    if (invoice.documentType?.toLowerCase() == 'invoice') {
      // إذا كان status == "pending": إظهار Edit, Delete, Send
      if (invoice.status?.toLowerCase() == 'pending') {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (onEdit != null)
                IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.greyLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: onEdit,
                  icon: Icon(
                    Icons.edit,
                    color: AppColors.greyDark,
                    size: 16.sp,
                  ),
                ),
              if (onDelete != null)
                IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.error,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: onDelete,
                  icon: Icon(Icons.delete, color: AppColors.white, size: 16.sp),
                ),
            ],
          ),
        );
      } else if (invoice.status?.toLowerCase() == 'sent' &&
          (invoice.returnedInvoices == null ||
              invoice.returnedInvoices!.isEmpty)) {
        // إذا كان status == "sent" وليس لديها returned invoices: إظهار Return فقط
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton.filled(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.warning,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: onReturn,
                icon: Icon(Icons.undo, color: AppColors.white, size: 16.sp),
                tooltip: S.of(context).returnInvoice,
              ),
            ],
          ),
        );
      } else {
        // إذا كان status != "pending" و != "sent" أو لديها credit invoice: لا تظهر أي أزرار
        return const SizedBox.shrink();
      }
    }

    // Default: إظهار جميع الإجراءات
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (onEdit != null)
          IconButton(onPressed: onEdit, icon: const Icon(Icons.edit)),
        if (onDelete != null)
          IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)),
        if (onSend != null)
          IconButton(onPressed: onSend, icon: const Icon(Icons.send)),
      ],
    );
  }

  Widget _buildStatusBadge({
    required String invoiceType,
    required String status,
  }) {
    Color backgroundColor;
    Color textColor;
    String statusText;

    if (invoiceType == 'invoice') {
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
    } else {
      backgroundColor = AppColors.greyDark.withOpacity(0.1);
      textColor = AppColors.textSecondary;
      statusText = S.current.creditInvoice;
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
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }

  String _formatDate(String dateString) {
    return DateFormatter.apiStringToDisplayFormat(dateString) ?? dateString;
  }
}
