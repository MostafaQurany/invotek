import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/permission_helper.dart';
import '../../../../generated/l10n.dart';
import '../../constants/settings_permissions.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.onPrimary,
            size: 24.sp,
          ),
        ),
        title: Text(
          S.of(context).accountSettings,
          style: AppTextTheme.textTheme.headlineMedium?.copyWith(
            color: AppColors.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        //actions: [CommonMenuButton(color: AppColors.onPrimary)],
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: PermissionWidget(
        permission: SettingsPermissions.view,
        fallback: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock_outline, size: 64.sp, color: AppColors.error),
              SizedBox(height: 16.h),
              Text(
                S.of(context).settingsNoPermissionToView,
                style: AppTextTheme.textTheme.titleMedium?.copyWith(
                  color: AppColors.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                S.of(context).settingsNoPermissionToAct,
                style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      // Edit Profile
                      _buildSettingTile(
                        title: 'Edit Profile',
                        subtitle: 'Update your profile information',
                        icon: Icons.person_outline,
                        onTap: () {
                          Navigator.of(context).pushNamed('/edit-profile');
                        },
                      ),
                      SizedBox(height: 8.h),
                      Divider(height: 1.h),
                      SizedBox(height: 8.h),
                      // Change Password
                      _buildSettingTile(
                        title: S.of(context).changePassword,
                        subtitle: S.of(context).changePassword,
                        icon: Icons.lock_outline,
                        onTap: () {
                          Navigator.of(context).pushNamed('/change-password');
                        },
                      ),
                      SizedBox(height: 8.h),
                      Divider(height: 1.h),
                      SizedBox(height: 8.h),
                      // Delete Account
                      _buildSettingTile(
                        title: S.of(context).deleteAccount,
                        subtitle: S.of(context).deleteAccountWarning,
                        icon: Icons.delete_forever,
                        iconColor: Colors.red,
                        onTap: () {
                          Navigator.of(context).pushNamed('/delete-account');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    Color? iconColor,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: iconColor ?? AppColors.primary, size: 24.sp),
      title: Text(
        title,
        style: AppTextTheme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTextTheme.textTheme.bodyMedium?.copyWith(
          color: AppColors.onSurfaceVariant,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.onSurfaceVariant,
        size: 16.sp,
      ),
      onTap: onTap,
    );
  }
}
