import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/products/constants/products_permissions.dart';

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
    final s = S.of(context);
    final hasDeletePermission = PermissionChecker.hasPermission(
      context,
      ProductsPermissions.delete,
    );

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Row(
        children: [
          Icon(Icons.warning_outlined, color: AppColors.error, size: 24.sp),
          SizedBox(width: 8.w),
          Text(
            s.deleteProduct,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.productsAreYouSureYouWantToDeleteThisProduct,
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
                    product.name ?? s.productsUnnamedProduct,
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
            s.productsThisActionCannotBeUndone,
            style: TextStyle(fontSize: 12.sp, color: AppColors.greyDark),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            s.cancel,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ),
        FilledButton(
          onPressed: hasDeletePermission
              ? () {
                  Navigator.pop(context);
                  onConfirm();
                }
              : null,
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.error,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Tooltip(
            message: hasDeletePermission
                ? s.delete
                : s.productsNoPermissionToAct,
            child: Text(
              s.delete,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
