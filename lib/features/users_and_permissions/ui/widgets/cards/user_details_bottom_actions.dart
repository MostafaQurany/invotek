import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/users_and_permissions/constants/users_permissions.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/utils/user_deletion_helper.dart';

class UserDetailsBottomActions extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final User user;

  const UserDetailsBottomActions({
    super.key,
    required this.onDelete,
    required this.onEdit,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
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
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 32.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Delete Button - Only show if deletion is enabled
          if (isDeleteEnabled) ...[
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onDelete,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  side: BorderSide(color: AppColors.error.withOpacity(0.3)),
                ),
                icon: Icon(
                  Icons.delete_outline,
                  size: 20.sp,
                  color: AppColors.error,
                ),
                label: Text(
                  s.delete,
                  style: TextStyle(
                    color: AppColors.error,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
          ],

          // Edit Button
          Expanded(
            flex: 2,
            child: Builder(
              builder: (context) {
                return Tooltip(
                  message: hasEditPermission
                      ? s.usersEditUser
                      : s.usersNoPermissionToAct,
                  child: FilledButton.icon(
                    onPressed: hasEditPermission ? onEdit : null,
                    style: FilledButton.styleFrom(
                      backgroundColor: hasEditPermission
                          ? AppColors.primary
                          : AppColors.greyDark,
                      foregroundColor: AppColors.white,
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    icon: Icon(
                      hasEditPermission
                          ? Icons.edit_rounded
                          : Icons.lock_outlined,
                      size: 20.sp,
                      color: AppColors.white,
                    ),
                    label: Text(
                      s.usersEditUser,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
