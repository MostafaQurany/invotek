import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';

import '../../../../generated/l10n.dart';

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
      padding: EdgeInsets.all(24.w),
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
    return Column(
      children: [
        _buildOptionTile(
          icon: Icons.visibility,
          title: S.current.viewDetails,
          color: AppColors.primary,
          onTap: onViewDetails,
        ),
        Divider(color: Colors.grey[300]),
        _buildOptionTile(
          icon: Icons.edit,
          title: S.current.editProduct,
          color: AppColors.secondary,
          onTap: onEdit,
        ),
        Divider(color: Colors.grey[300]),
        _buildOptionTile(
          icon: Icons.delete,
          title: S.current.deleteProduct,
          color: AppColors.error,
          onTap: onDelete,
        ),
      ],
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      onTap: onTap,
    );
  }
}
