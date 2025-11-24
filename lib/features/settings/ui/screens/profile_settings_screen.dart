import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/settings/constants/settings_permissions.dart';
import 'package:invotek/features/settings/ui/widgets/shared/shared_widgets.dart';
import 'package:invotek/generated/l10n.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
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
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: PermissionWidget(
        permission: SettingsPermissions.view,
        fallback: Center(
          child: EmptyStateWidget(
            icon: Icons.lock_outline,
            title: S.of(context).settingsNoPermissionToView,
            description: S.of(context).settingsNoPermissionToAct,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(16.w),
          children: [
            SettingsCard(
              title: S.of(context).accountSettings,
              showDivider: true,
              child: Column(
                children: [
                  SettingsTile(
                    icon: Icons.person_outline,
                    title: S.of(context).editProfile,
                    subtitle: S.of(context).updateYourProfileInformation,
                    onTap: () =>
                        Navigator.of(context).pushNamed('/edit-profile'),
                  ),
                  Divider(height: 1, color: AppColors.border, indent: 56.w),
                  SettingsTile(
                    icon: Icons.lock_outline,
                    title: S.of(context).changePassword,
                    subtitle: S.of(context).settingsChangePasswordDesc,
                    onTap: () =>
                        Navigator.of(context).pushNamed('/change-password'),
                  ),
                  Divider(height: 1, color: AppColors.border, indent: 56.w),
                  SettingsTile(
                    icon: Icons.delete_forever,
                    iconColor: AppColors.error,
                    title: S.of(context).deleteAccount,
                    subtitle: S.of(context).deleteAccountWarning,
                    onTap: () =>
                        Navigator.of(context).pushNamed('/delete-account'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
