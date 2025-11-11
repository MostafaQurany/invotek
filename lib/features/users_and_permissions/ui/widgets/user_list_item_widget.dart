import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/features/users_and_permissions/utils/user_deletion_helper.dart';

class UserListItemWidget extends StatelessWidget {
  final User user;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const UserListItemWidget({
    super.key,
    required this.user,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              // User Avatar
              CircleAvatar(
                radius: 25.r,
                backgroundColor: AppColors.primary.withOpacity(0.1),
                child: Text(
                  (user.name?.isNotEmpty == true)
                      ? user.name![0].toUpperCase()
                      : 'U',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              SizedBox(width: 16.w),

              // User Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name ?? s.usersNoName,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      user.email ?? s.usersNoEmail,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: _getRoleColor(user.role).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            user.role != null ? _getLocalizedRole(context, user.role!) : s.usersNoRole,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: _getRoleColor(user.role),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: _getStatusColor(
                              user.status ?? '',
                            ).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            user.status != null ? _getLocalizedStatus(context, user.status!) : s.usersUndefined,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: _getStatusColor(user.status),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Action Buttons
              if (onEdit != null || onDelete != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (onEdit != null)
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: AppColors.secondary,
                          size: 20.sp,
                        ),
                        onPressed: onEdit,
                      ),
                    if (onDelete != null && UserDeletionHelper.canDeleteUser(user))
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: AppColors.error,
                          size: 20.sp,
                        ),
                        onPressed: onDelete,
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getRoleColor(String? role) {
    if (role == null) return Colors.grey;
    final roleLower = role.toLowerCase();
    // Handle both Arabic and English role names
    if (roleLower == 'مدير' || roleLower == 'admin') {
      return Colors.purple;
    } else if (roleLower == 'محاسب' || roleLower == 'accountant') {
      return Colors.blue;
    } else if (roleLower == 'مشرف' || roleLower == 'supervisor') {
      return Colors.orange;
    } else if (roleLower == 'مستخدم' || roleLower == 'user') {
      return Colors.green;
    }
    return Colors.grey;
  }

  Color _getStatusColor(String? status) {
    if (status == null) return Colors.grey;
    final statusLower = status.toLowerCase();
    // Handle both Arabic and English status names
    if (statusLower == 'نشط' || statusLower == 'active') {
      return Colors.green;
    } else if (statusLower == 'غير نشط' || statusLower == 'inactive') {
      return Colors.red;
    }
    return Colors.grey;
  }

  String _getLocalizedRole(BuildContext context, String role) {
    final s = S.of(context);
    final roleLower = role.toLowerCase();
    if (roleLower == 'مدير' || roleLower == 'admin') {
      return s.usersRoleAdmin;
    } else if (roleLower == 'محاسب' || roleLower == 'accountant') {
      return s.usersRoleAccountant;
    } else if (roleLower == 'مشرف' || roleLower == 'supervisor') {
      return s.usersRoleSupervisor;
    } else if (roleLower == 'مستخدم' || roleLower == 'user') {
      return s.usersRoleUser;
    }
    return role;
  }

  String _getLocalizedStatus(BuildContext context, String status) {
    final s = S.of(context);
    final statusLower = status.toLowerCase();
    if (statusLower == 'نشط' || statusLower == 'active') {
      return s.usersStatusActive;
    } else if (statusLower == 'غير نشط' || statusLower == 'inactive') {
      return s.usersStatusInactive;
    }
    return status;
  }
}
