import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/constants/users_permissions.dart';
import 'package:invotek/features/users_and_permissions/utils/user_deletion_helper.dart';
import 'package:invotek/generated/l10n.dart';

class UserOptionsBottomSheet extends StatelessWidget {
  final User user;
  final VoidCallback onViewDetails;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const UserOptionsBottomSheet({
    super.key,
    required this.user,
    required this.onViewDetails,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final hasViewPermission = PermissionChecker.hasPermission(
      context,
      UsersPermissions.view,
    );
    final hasEditPermission = PermissionChecker.hasPermission(
      context,
      UsersPermissions.edit,
    );
    final hasDeletePermission = PermissionChecker.hasPermission(
      context,
      UsersPermissions.delete,
    );
    final canDelete = UserDeletionHelper.canDeleteUser(user);
    final isDeleteEnabled = hasDeletePermission && canDelete;

    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 0.h, 24.w, 32.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // // Handle Bar
          // Center(
          //   child: Container(
          //     width: 40.w,
          //     height: 4.h,
          //     decoration: BoxDecoration(
          //       color: AppColors.grey.withOpacity(0.3),
          //       borderRadius: BorderRadius.circular(2.r),
          //     ),
          //   ),
          // ),
          //SizedBox(height: 24.h),

          // User Info Header
          Row(
            children: [
              Container(
                width: 50.w,
                height: 50.w,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    _getInitials(user.name ?? ''),
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name ?? s.usersUnknownUser,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      user.email ?? s.usersNoEmail,
                      style: TextStyle(fontSize: 14.sp, color: AppColors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 32.h),

          // Action Options
          _buildOptionItem(
            icon: hasViewPermission
                ? Icons.visibility_outlined
                : Icons.lock_outlined,
            title: s.usersViewDetails,
            subtitle: s.usersViewUserDetails,
            onTap: hasViewPermission ? onViewDetails : null,
            tooltip: hasViewPermission ? null : s.usersNoPermissionToAct,
          ),

          SizedBox(height: 8.h),

          _buildOptionItem(
            icon: hasEditPermission ? Icons.edit_outlined : Icons.lock_outlined,
            title: s.usersEditUser,
            subtitle: s.usersEditUserInformation,
            onTap: hasEditPermission ? onEdit : null,
            tooltip: hasEditPermission ? null : s.usersNoPermissionToAct,
          ),

          // Delete Option - Only show if deletion is enabled
          if (isDeleteEnabled) ...[
            SizedBox(height: 8.h),
            _buildOptionItem(
              icon: Icons.delete_outline,
              title: s.usersDeleteUser,
              subtitle: s.usersDeleteUserPermanently,
              onTap: onDelete,
              isDestructive: true,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildOptionItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback? onTap,
    bool isDestructive = false,
    String? tooltip,
  }) {
    final color = isDestructive ? AppColors.error : AppColors.textPrimary;
    final iconColor = (isDestructive ? AppColors.error : AppColors.primary)
        .withOpacity(onTap == null ? 0.5 : 1.0);

    Widget item = InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(icon, size: 20.sp, color: iconColor),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14.sp, color: AppColors.grey),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColors.grey),
          ],
        ),
      ),
    );

    if (tooltip != null && onTap == null) {
      return Tooltip(message: tooltip, child: item);
    }

    return item;
  }

  String _getInitials(String name) {
    if (name.isEmpty) return 'U';
    final words = name.split(' ');
    if (words.length >= 2) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }
}
