import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';
import 'package:invotek/generated/l10n.dart';

class EnhancedProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const EnhancedProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: Offset(0, 2),
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
            child: Row(
              children: [
                // Product Icon
                _buildProductIcon(),
                SizedBox(width: 12.w),

                // Product Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name and Status Chip
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              product.name ?? s.productsUnnamedProduct,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          _buildStatusChip(),
                        ],
                      ),

                      SizedBox(height: 4.h),

                      // Quantity
                      Text(
                        '${s.productsQuantity}: ${product.quantity ?? 0}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.greyDark,
                        ),
                      ),

                      SizedBox(height: 4.h),

                      // SKU
                      if (product.sku != null && product.sku!.isNotEmpty)
                        Text(
                          '${s.productsSku}: ${product.sku!}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.greyDark,
                          ),
                        ),
                    ],
                  ),
                ),

                // Price and Actions
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Price
                    Text(
                      'SAR ${product.price ?? '0.00'}',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    // Action Menu
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        switch (value) {
                          case 'edit':
                            onEdit?.call();
                            break;
                          case 'delete':
                            onDelete?.call();
                            break;
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'edit',
                          child: Row(
                            children: [
                              Icon(Icons.edit_outlined, size: 18.sp),
                              SizedBox(width: 8.w),
                              Text(s.productsEdit),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete_outlined,
                                size: 18.sp,
                                color: AppColors.error,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                s.productsDelete,
                                style: TextStyle(color: AppColors.error),
                              ),
                            ],
                          ),
                        ),
                      ],
                      icon: Icon(
                        Icons.more_vert,
                        color: AppColors.greyDark,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductIcon() {
    return Container(
      width: 50.w,
      height: 50.w,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        Icons.inventory_2_outlined,
        color: AppColors.primary,
        size: 24.sp,
      ),
    );
  }

  Widget _buildStatusChip() {
    final isActive = product.status?.toLowerCase() == 'active';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.success.withOpacity(0.1)
            : AppColors.greyLight,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        product.status?.toUpperCase() ?? 'INACTIVE',
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          color: isActive ? AppColors.success : AppColors.greyDark,
        ),
      ),
    );
  }
}
