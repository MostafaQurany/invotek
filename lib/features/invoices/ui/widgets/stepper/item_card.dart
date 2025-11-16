import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/currency_formatter.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/generated/l10n.dart';

class ItemCard extends StatelessWidget {
  final InvoiceItemData item;
  final int index;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final String? taxInvoiceType;

  const ItemCard({
    super.key,
    required this.item,
    required this.index,
    required this.onEdit,
    required this.onDelete,
    this.taxInvoiceType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with actions
          Row(
            children: [
              Expanded(
                child: Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              IconButton(
                onPressed: onEdit,
                icon: Icon(Icons.edit, size: 20.sp, color: AppColors.primary),
                constraints: BoxConstraints(minWidth: 32.w, minHeight: 32.h),
                padding: EdgeInsets.zero,
              ),
              IconButton(
                onPressed: onDelete,
                icon: Icon(Icons.delete, size: 20.sp, color: Colors.red),
                constraints: BoxConstraints(minWidth: 32.w, minHeight: 32.h),
                padding: EdgeInsets.zero,
              ),
            ],
          ),

          SizedBox(height: 8.h),

          // Item details
          Row(
            children: [
              Expanded(child: _buildDetailItem(S.of(context).itemQuantity, item.quantity)),
              Expanded(
                child: _buildDetailItem(
                  S.of(context).itemPrice,
                  CurrencyFormatter.formatCurrencyString(item.price, context),
                ),
              ),
              Expanded(child: _buildDetailItem(S.of(context).itemDiscount, '${item.discount}%')),
            ],
          ),

          SizedBox(height: 8.h),

          // Show tax fields only if taxInvoiceType is not 'income'
          if (taxInvoiceType != 'income')
            Row(
              children: [
                Expanded(
                  child: _buildDetailItem(S.of(context).itemTax, '${item.taxPercent}%'),
                ),
                Expanded(
                  child: _buildDetailItem(
                    S.of(context).itemTaxAmount,
                    CurrencyFormatter.formatCurrencyString(
                      item.taxAmount,
                      context,
                    ),
                  ),
                ),
                Expanded(
                  child: _buildDetailItem(
                    S.of(context).itemTotal,
                    CurrencyFormatter.formatCurrencyString(item.total, context),
                    isTotal: true,
                  ),
                ),
              ],
            )
          else
            // For income type, show only total
            Row(
              children: [
                Expanded(
                  child: _buildDetailItem(
                    S.of(context).itemTotal,
                    CurrencyFormatter.formatCurrencyString(item.total, context),
                    isTotal: true,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value, {bool isTotal = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: AppColors.textSecondary),
        ),
        SizedBox(height: 2.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: isTotal ? FontWeight.w600 : FontWeight.w500,
            color: isTotal ? AppColors.primary : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}


