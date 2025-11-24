import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/cubits/permissions_cubit.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/features/settings/constants/settings_permissions.dart';
import 'package:invotek/features/settings/ui/screens/change_password_screen.dart';
import 'package:invotek/features/settings/ui/screens/profile_settings_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/users_list_screen.dart';
import 'package:invotek/generated/l10n.dart';

class AccountSettingsCard extends StatelessWidget {
  const AccountSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(color: AppColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Text(
              S.of(context).settingsAccountSecurity,
              style: AppTextTheme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(height: 1, color: AppColors.border),
          _buildTile(
            context,
            icon: Icons.person_outline,
            title: S.of(context).settingsProfile,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ProfileSettingsScreen()),
            ),
          ),
          Divider(height: 1, color: AppColors.border, indent: 56.w),
          _buildTile(
            context,
            icon: Icons.lock_outline,
            title: S.of(context).settingsChangePassword,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ChangePasswordScreen()),
            ),
          ),
          BlocBuilder<PermissionsCubit, PermissionsState>(
            builder: (context, state) {
              final hasPermission = state.maybeWhen(
                loaded: (permissions) =>
                    permissions.hasPermission(SettingsPermissions.settings),
                orElse: () => false,
              );

              if (!hasPermission) return const SizedBox.shrink();

              return Column(
                children: [
                  Divider(height: 1, color: AppColors.border, indent: 56.w),
                  _buildTile(
                    context,
                    icon: Icons.people_outline,
                    title: S.of(context).settingsUsersManagement,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const UsersListScreen(),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, color: AppColors.textPrimary, size: 20.sp),
      ),
      title: Text(
        title,
        style: AppTextTheme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16.sp,
        color: AppColors.textSecondary,
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
    );
  }
}
