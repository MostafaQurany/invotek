import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';

class ProductSummaryCard extends StatelessWidget {
  final ProductModel product;

  const ProductSummaryCard({super.key, required this.product});

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
                // Product Icon/Avatar
                Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Icon(
                    Icons.inventory_2_outlined,
                    color: AppColors.primary,
                    size: 32.sp,
                  ),
                ),

                SizedBox(width: 16.w),

                // Product Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? 'Unnamed Product',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      if (product.sku != null && product.sku!.isNotEmpty)
                        Text(
                          'SKU: ${product.sku!}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.greyDark,
                          ),
                        ),
                      SizedBox(height: 8.h),
                      _buildProductStatusChip(product.status ?? 'inactive'),
                    ],
                  ),
                ),

                // Price and Quantity
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      product.price ?? '0.00',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Qty: ${product.quantity ?? 0}',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.greyDark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductStatusChip(String status) {
    final isActive = status.toLowerCase() == 'active';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.success.withOpacity(0.1)
            : AppColors.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(
              color: isActive ? AppColors.success : AppColors.error,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 6.w),
          Text(
            status.toUpperCase(),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: isActive ? AppColors.success : AppColors.error,
            ),
          ),
        ],
      ),
    );
  }
}
