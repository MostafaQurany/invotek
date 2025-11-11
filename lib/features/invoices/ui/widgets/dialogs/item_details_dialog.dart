import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/currency_formatter.dart';
import 'package:invotek/features/invoices/data/models/invoice_item.dart';
import 'package:invotek/generated/l10n.dart';

/// حوار عرض تفاصيل عنصر الفاتورة
class ItemDetailsDialog extends StatelessWidget {
  final InvoiceItem item;

  const ItemDetailsDialog({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(Icons.inventory_2, color: AppColors.primary, size: 24.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    S.of(context).itemDetails,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: AppColors.textSecondary,
                    size: 20.sp,
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // Item Name
            _buildInfoRow(
              context,
              S.of(context).itemName,
              item.name ?? S.of(context).noName,
              Icons.label,
            ),

            SizedBox(height: 12.h),

            // Description
            if (item.description?.isNotEmpty ?? false) ...[
              _buildInfoRow(
                context,
                S.of(context).description,
                item.description!,
                Icons.description,
              ),
              SizedBox(height: 12.h),
            ],

            // Quantity and Price Row
            Row(
              children: [
                Expanded(
                  child: _buildInfoRow(
                    context,
                    S.of(context).itemQuantity,
                    item.quantity ?? '0',
                    Icons.inventory,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildInfoRow(
                    context,
                    S.of(context).itemPrice,
                    CurrencyFormatter.formatCurrencyString(item.price, context),
                    Icons.attach_money,
                  ),
                ),
              ],
            ),

            SizedBox(height: 12.h),

            // Discount
            if (item.discount?.isNotEmpty ?? false) ...[
              _buildInfoRow(
                context,
                S.of(context).invoicesDiscount,
                '${item.discount} ',
                Icons.discount,
              ),
              SizedBox(height: 12.h),
            ],

            // Tax Information
            if (item.taxPercent?.isNotEmpty ?? false) ...[
              Row(
                children: [
                  Expanded(
                    child: _buildInfoRow(
                      context,
                      S.of(context).invoicesTaxPercentage,
                      '${item.taxPercent}%',
                      Icons.percent,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildInfoRow(
                      context,
                      S.of(context).taxAmount,
                      CurrencyFormatter.formatCurrencyString(
                        item.taxAmount,
                        context,
                      ),
                      Icons.receipt,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
            ],

            // Total
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.primary.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.calculate, color: AppColors.primary, size: 20.sp),
                  SizedBox(width: 8.w),
                  Text(
                    S.of(context).itemTotal,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  Spacer(),
                  Text(
                    CurrencyFormatter.formatCurrencyString(item.total, context),
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            // Product Information (if available)
            if (item.product != null) ...[
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: AppColors.border),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.shopping_bag,
                          color: AppColors.textSecondary,
                          size: 16.sp,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          S.of(context).invoicesProductInformation,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    if (item.product?.name?.isNotEmpty ?? false)
                      Text(
                        '${S.of(context).invoicesProductNameLabel} ${item.product!.name}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    if (item.product?.sku?.isNotEmpty ?? false)
                      Text(
                        'SKU: ${item.product!.sku}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
            ],

            // Action Buttons
            Row(
              children: [
                // Copy Item Details
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      _copyItemDetails(context);
                    },
                    icon: Icon(Icons.copy, size: 16.sp),
                    label: Text(
                      S.of(context).copy,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: BorderSide(color: AppColors.primary),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                  ),
                ),

                SizedBox(width: 12.w),

                // Close Button
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, size: 16.sp),
                    label: Text(
                      S.of(context).close,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.textSecondary,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.textSecondary, size: 16.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _copyItemDetails(BuildContext context) {
    final s = S.of(context);
    final details = _buildItemDetailsText(context);
    Clipboard.setData(ClipboardData(text: details));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(s.invoicesItemDetailsCopied),
        backgroundColor: AppColors.success,
      ),
    );
  }

  String _buildItemDetailsText(BuildContext context) {
    final s = S.of(context);
    final buffer = StringBuffer();
    buffer.writeln(s.invoicesItemDetails);
    buffer.writeln('${s.invoicesItemNameLabel} ${item.name ?? s.noName}');
    if (item.description?.isNotEmpty ?? false) {
      buffer.writeln('${s.invoicesItemDescriptionLabel} ${item.description}');
    }
    buffer.writeln('${s.invoicesItemQuantityLabel} ${item.quantity ?? '0'}');
    buffer.writeln('${s.invoicesItemPriceLabel} ${item.price ?? '0.00'} ');
    if (item.discount?.isNotEmpty ?? false) {
      buffer.writeln('${s.invoicesItemDiscountLabel} ${item.discount} ');
    }
    if (item.taxPercent?.isNotEmpty ?? false) {
      buffer.writeln('${s.invoicesItemTaxPercentageLabel} ${item.taxPercent}%');
    }
    if (item.taxAmount?.isNotEmpty ?? false) {
      buffer.writeln('${s.invoicesItemTaxAmountLabel} ${item.taxAmount} ');
    }
    buffer.writeln('${s.invoicesItemTotalLabel} ${item.total ?? '0.00'} ');

    if (item.product != null) {
      buffer.writeln();
      buffer.writeln(s.invoicesProductInfo);
      if (item.product?.name?.isNotEmpty ?? false) {
        buffer.writeln('${s.invoicesProductNameLabel} ${item.product!.name}');
      }
      if (item.product?.sku?.isNotEmpty ?? false) {
        buffer.writeln('SKU: ${item.product!.sku}');
      }
    }

    return buffer.toString();
  }
}
