import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/features/customers/constants/customers_permissions.dart';
import 'package:invotek/core/utils/permission_helper.dart';

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
    final s = S.of(context);
    final hasViewPermission = PermissionChecker.hasPermission(
      context,
      CustomersPermissions.view,
    );
    final hasEditPermission = PermissionChecker.hasPermission(
      context,
      CustomersPermissions.edit,
    );
    final hasDeletePermission = PermissionChecker.hasPermission(
      context,
      CustomersPermissions.delete,
    );

    return Column(
      children: [
        _buildOptionTile(
          icon: Icons.visibility,
          title: s.viewDetails,
          color: AppColors.primary,
          onTap: hasViewPermission ? onViewDetails : null,
          hasPermission: hasViewPermission,
          permissionMessage: s.customersNoPermissionToAct,
        ),
        Divider(color: Colors.grey[300]),
        _buildOptionTile(
          icon: Icons.edit,
          title: s.editCustomer,
          color: AppColors.secondary,
          onTap: hasEditPermission ? onEdit : null,
          hasPermission: hasEditPermission,
          permissionMessage: s.customersNoPermissionToAct,
        ),
        Divider(color: Colors.grey[300]),
        _buildOptionTile(
          icon: Icons.delete,
          title: s.deleteCustomer,
          color: AppColors.error,
          onTap: hasDeletePermission ? onDelete : null,
          hasPermission: hasDeletePermission,
          permissionMessage: s.customersNoPermissionToAct,
        ),
      ],
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback? onTap,
    required bool hasPermission,
    required String permissionMessage,
  }) {
    return Tooltip(
      message: hasPermission ? '' : permissionMessage,
      child: ListTile(
        leading: Icon(
          hasPermission ? icon : Icons.lock_outline,
          color: hasPermission ? color : color.withOpacity(0.5),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: hasPermission ? null : color.withOpacity(0.5),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        onTap: onTap,
        enabled: hasPermission,
      ),
    );
  }
}
