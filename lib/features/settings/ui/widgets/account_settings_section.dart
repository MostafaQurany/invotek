import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/generated/l10n.dart';

class AccountSettingsSection extends StatelessWidget {
  const AccountSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      leading: Icon(
        icon, 
        color: iconColor ?? AppColors.primary, 
        size: 24.sp,
      ),
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
