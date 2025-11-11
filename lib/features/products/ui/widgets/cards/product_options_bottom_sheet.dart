import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/products/constants/products_permissions.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';
import 'package:invotek/generated/l10n.dart';

class ProductOptionsBottomSheet extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onViewDetails;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ProductOptionsBottomSheet({
    super.key,
    required this.product,
    required this.onViewDetails,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /*         _buildHandleBar(),
          SizedBox(height: 24.h),*/
          _buildOptions(context),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildHandleBar() {
    return Container(
      width: 40.w,
      height: 4.h,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }

  Widget _buildOptions(BuildContext context) {
    final s = S.of(context);
    final hasViewPermission = PermissionChecker.hasPermission(
      context,
      ProductsPermissions.view,
    );
    final hasEditPermission = PermissionChecker.hasPermission(
      context,
      ProductsPermissions.edit,
    );
    final hasDeletePermission = PermissionChecker.hasPermission(
      context,
      ProductsPermissions.delete,
    );

    return Column(
      children: [
        _buildOptionTile(
          icon: hasViewPermission ? Icons.visibility : Icons.lock_outlined,
          title: s.viewDetails,
          color: hasViewPermission ? AppColors.primary : AppColors.greyDark,
          onTap: hasViewPermission ? onViewDetails : null,
          tooltip: hasViewPermission
              ? s.viewDetails
              : s.productsNoPermissionToAct,
        ),
        Divider(color: Colors.grey[300]),
        _buildOptionTile(
          icon: hasEditPermission ? Icons.edit : Icons.lock_outlined,
          title: s.editProduct,
          color: hasEditPermission ? AppColors.secondary : AppColors.greyDark,
          onTap: hasEditPermission ? onEdit : null,
          tooltip: hasEditPermission
              ? s.editProduct
              : s.productsNoPermissionToAct,
        ),
        Divider(color: Colors.grey[300]),
        _buildOptionTile(
          icon: hasDeletePermission ? Icons.delete : Icons.lock_outlined,
          title: s.deleteProduct,
          color: hasDeletePermission ? AppColors.error : AppColors.greyDark,
          onTap: hasDeletePermission ? onDelete : null,
          tooltip: hasDeletePermission
              ? s.deleteProduct
              : s.productsNoPermissionToAct,
        ),
      ],
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback? onTap,
    String? tooltip,
  }) {
    return Tooltip(
      message: tooltip ?? title,
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        onTap: onTap,
      ),
    );
  }
}
