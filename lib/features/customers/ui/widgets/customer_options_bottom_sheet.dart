import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';
import 'package:invotek/generated/l10n.dart';

class CustomerOptionsBottomSheet extends StatelessWidget {
  final CustomerModel customer;
  final VoidCallback onViewDetails;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CustomerOptionsBottomSheet({
    super.key,
    required this.customer,
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
          _buildOptions(context),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Widget _buildOptions(BuildContext context) {
    return Column(
      children: [
        _buildOptionTile(
          icon: Icons.visibility,
          title: S.of(context).viewDetails,
          color: AppColors.primary,
          onTap: onViewDetails,
        ),
        Divider(color: Colors.grey[300]),
        _buildOptionTile(
          icon: Icons.edit,
          title: S.of(context).editCustomer,
          color: AppColors.secondary,
          onTap: onEdit,
        ),
        Divider(color: Colors.grey[300]),
        _buildOptionTile(
          icon: Icons.delete,
          title: S.of(context).deleteCustomer,
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
