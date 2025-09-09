import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';

class DeleteProductDialog extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onConfirm;

  const DeleteProductDialog({
    super.key,
    required this.product,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Row(
        children: [
          Icon(Icons.warning_outlined, color: AppColors.error, size: 24.sp),
          SizedBox(width: 8.w),
          Text(
            'Delete Product',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Are you sure you want to delete this product?',
            style: TextStyle(fontSize: 14.sp),
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.error.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.inventory_2_outlined,
                  color: AppColors.error,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    product.name ?? 'Unnamed Product',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'This action cannot be undone.',
            style: TextStyle(fontSize: 12.sp, color: AppColors.greyDark),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ),
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.error,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            'Delete',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
