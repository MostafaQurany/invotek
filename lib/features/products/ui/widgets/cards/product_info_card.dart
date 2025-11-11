import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/currency_formatter.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';
import 'package:invotek/generated/l10n.dart';

class ProductInfoCard extends StatelessWidget {
  final ProductModel product;
  final Function(String) onCopyToClipboard;

  const ProductInfoCard({
    super.key,
    required this.product,
    required this.onCopyToClipboard,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, color: AppColors.primary, size: 24.sp),
                SizedBox(width: 12.w),
                Text(
                  s.productsProductInformation,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            // Description
            if (product.description != null && product.description!.isNotEmpty)
              _buildInfoTile(
                icon: Icons.description_outlined,
                label: s.productsDescription,
                value: product.description!,
              ),

            if (product.description != null && product.description!.isNotEmpty)
              SizedBox(height: 16.h),

            // Cost Price
            _buildInfoTile(
              icon: Icons.attach_money_outlined,
              label: s.productsCostPrice,
              value: product.cost != null
                  ? CurrencyFormatter.formatCurrencyString(product.cost!, null)
                  : s.productsNotSet,
            ),

            SizedBox(height: 16.h),

            // Tax Rate
            _buildInfoTile(
              icon: Icons.percent_outlined,
              label: s.productsTaxRate,
              value: '${product.taxRate ?? '0.0'}%',
            ),

            SizedBox(height: 16.h),

            // Unit
            _buildInfoTile(
              icon: Icons.straighten_outlined,
              label: s.productsUnit,
              value: product.unit ?? s.productsNotSpecified,
            ),

            SizedBox(height: 16.h),

            // Barcode
            _buildBarcodeTile(context),
            // SKU
            _buildSKUTile(context),

            SizedBox(height: 16.h),

            // Taxable
            _buildInfoTile(
              icon: Icons.receipt_outlined,
              label: s.productsTaxable,
              value: product.hasTax == true ? s.productsYes : s.productsNo,
              valueColor: product.hasTax == true
                  ? AppColors.success
                  : AppColors.greyDark,
            ),

            SizedBox(height: 16.h),

            // Track Inventory
            _buildInfoTile(
              icon: Icons.inventory_outlined,
              label: s.productsTrackInventory,
              value: product.trackInventory == true ? s.productsYes : s.productsNo,
              valueColor: product.trackInventory == true
                  ? AppColors.success
                  : AppColors.greyDark,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
    String? actionLabel,
    VoidCallback? onAction,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(icon, color: AppColors.greyDark, size: 20.sp),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: valueColor ?? AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
        if (onAction != null && actionLabel != null)
          GestureDetector(
            onTap: onAction,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                actionLabel,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBarcodeTile(BuildContext context) {
    final s = S.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.qr_code_outlined, color: AppColors.greyDark, size: 20.sp),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.productsBarcode,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyDark,
                ),
              ),
              SizedBox(height: 8.h),
              if (product.barcode != null && product.barcode!.isNotEmpty)
                GestureDetector(
                  onTap: () => onCopyToClipboard(product.barcode!),
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.border, width: 1),
                    ),
                    child: Column(
                      children: [
                        BarcodeWidget(
                          barcode: Barcode.code128(),
                          data: product.barcode!,
                          width: double.infinity,
                          height: 80.h,
                          drawText: true,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.copy,
                              size: 14.sp,
                              color: AppColors.primary,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              s.productsTapToCopy,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              else
                Text(
                  s.productsNotSet,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSKUTile(BuildContext context) {
    final s = S.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.qr_code_outlined, color: AppColors.greyDark, size: 20.sp),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                s.productsSku,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyDark,
                ),
              ),
              SizedBox(height: 8.h),
              if (product.sku != null && product.sku!.isNotEmpty)
                GestureDetector(
                  onTap: () => onCopyToClipboard(product.sku!),
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.border, width: 1),
                    ),
                    child: Column(
                      children: [
                        BarcodeWidget(
                          barcode: Barcode.code128(),
                          data: product.sku!,
                          width: double.infinity,
                          height: 80.h,
                          drawText: true,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.copy,
                              size: 14.sp,
                              color: AppColors.primary,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              s.productsTapToCopy,
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              else
                Text(
                  s.productsNotSet,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
