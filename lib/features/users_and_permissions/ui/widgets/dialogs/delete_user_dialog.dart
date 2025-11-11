import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/features/users_and_permissions/constants/users_permissions.dart';
import 'package:invotek/features/users_and_permissions/utils/user_deletion_helper.dart';

class DeleteUserDialog extends StatelessWidget {
  final User user;
  final VoidCallback onConfirm;

  const DeleteUserDialog({
    super.key,
    required this.user,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final canDelete = UserDeletionHelper.canDeleteUser(user);
    final errorMessage = UserDeletionHelper.getDeletionErrorMessage(user);

    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      contentPadding: EdgeInsets.all(24.w),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Warning Icon
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: AppColors.error.withOpacity(0.1),
              borderRadius: BorderRadius.circular(40.r),
            ),
            child: Icon(
              Icons.warning_outlined,
              size: 40.sp,
              color: AppColors.error,
            ),
          ),

          SizedBox(height: 24.h),

          // Title
          Text(
            s.usersDeleteUser,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 12.h),

          // Message
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.grey,
                height: 1.5,
              ),
              children: [
                TextSpan(text: '${s.usersAreYouSureYouWantToDeleteUser} '),
                TextSpan(
                  text: ' "${user.name ?? s.usersUnknownUser}" ',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                TextSpan(text: '? ${s.usersThisActionCannotBeUndone}'),
              ],
            ),
          ),

          SizedBox(height: 32.h),

          // Action Buttons
          Row(
            children: [
              // Cancel Button
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    side: BorderSide(color: AppColors.grey.withOpacity(0.3)),
                  ),
                  child: Text(
                    s.cancel,
                    style: TextStyle(
                      color: AppColors.greyDark,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              // Delete Button
              Expanded(
                child: Builder(
                  builder: (context) {
                    final hasDeletePermission = PermissionChecker.hasPermission(
                      context,
                      UsersPermissions.delete,
                    );
                    final isEnabled = hasDeletePermission && canDelete;
                    
                    String tooltipMessage;
                    if (!isEnabled) {
                      if (errorMessage != null) {
                        tooltipMessage = errorMessage == 'usersCannotDeleteYourselfMessage'
                            ? s.usersCannotDeleteYourselfMessage
                            : s.usersCannotDeleteAdminMessage;
                      } else {
                        tooltipMessage = s.usersNoPermissionToAct;
                      }
                    } else {
                      tooltipMessage = s.delete;
                    }
                    
                    return Tooltip(
                      message: tooltipMessage,
                      child: FilledButton(
                        onPressed: isEnabled
                            ? () {
                                Navigator.pop(context);
                                onConfirm();
                              }
                            : null,
                        style: FilledButton.styleFrom(
                          backgroundColor: isEnabled
                              ? AppColors.error
                              : AppColors.greyDark,
                          foregroundColor: AppColors.white,
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          s.delete,
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
        ],
      ),
    );
  }
}
