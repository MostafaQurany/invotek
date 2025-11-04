import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';

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
                  'Product Information',
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
                label: 'Description',
                value: product.description!,
              ),

            if (product.description != null && product.description!.isNotEmpty)
              SizedBox(height: 16.h),

            // Cost Price
            _buildInfoTile(
              icon: Icons.attach_money_outlined,
              label: 'Cost Price',
              value: product.cost != null ? '${product.cost!}' : 'Not set',
            ),

            SizedBox(height: 16.h),

            // Tax Rate
            _buildInfoTile(
              icon: Icons.percent_outlined,
              label: 'Tax Rate',
              value: '${product.taxRate ?? '0.0'}%',
            ),

            SizedBox(height: 16.h),

            // Unit
            _buildInfoTile(
              icon: Icons.straighten_outlined,
              label: 'Unit',
              value: product.unit ?? 'Not specified',
            ),

            SizedBox(height: 16.h),

            // Barcode
            _buildInfoTile(
              icon: Icons.qr_code_outlined,
              label: 'Barcode',
              value: product.barcode ?? 'Not set',
              onAction: product.barcode != null
                  ? () => onCopyToClipboard(product.barcode!)
                  : null,
              actionLabel: 'Copy',
            ),

            SizedBox(height: 16.h),

            // Taxable
            _buildInfoTile(
              icon: Icons.receipt_outlined,
              label: 'Taxable',
              value: product.hasTax == true ? 'Yes' : 'No',
              valueColor: product.hasTax == true
                  ? AppColors.success
                  : AppColors.greyDark,
            ),

            SizedBox(height: 16.h),

            // Track Inventory
            _buildInfoTile(
              icon: Icons.inventory_outlined,
              label: 'Track Inventory',
              value: product.trackInventory == true ? 'Yes' : 'No',
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
}
