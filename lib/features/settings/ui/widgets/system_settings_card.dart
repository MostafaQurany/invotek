import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/features/settings/ui/screens/language_settings_screen.dart';
import 'package:invotek/generated/l10n.dart';

class SystemSettingsCard extends StatelessWidget {
  const SystemSettingsCard({super.key});

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
              S.of(context).systemSettings,
              style: AppTextTheme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(height: 1, color: AppColors.border),
          _buildTile(
            context,
            icon: Icons.language,
            title: S.of(context).languageSettings,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LanguageSettingsScreen(),
              ),
            ),
          ),
          Divider(height: 1, color: AppColors.border, indent: 56.w),
          _buildTile(
            context,
            icon: Icons.notifications_outlined,
            title: S.of(context).notificationsSettings,
            onTap: () => Navigator.of(
              context,
            ).pushNamed(AppRoutes.notificationsSettingsRoute),
          ),
          // Divider(height: 1, color: AppColors.border, indent: 56.w),
          // _buildTile(
          //   context,
          //   icon: Icons.storage_outlined,
          //   title: S.of(context).dataStorage,
          //   onTap: () =>
          //       Navigator.of(context).pushNamed(AppRoutes.dataStorageRoute),
          // ),
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
