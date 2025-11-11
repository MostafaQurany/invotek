import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/widgets/common_menu_button.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/permission_helper.dart';
import '../../../../generated/l10n.dart';
import '../../constants/settings_permissions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final canPop = Navigator.of(context).canPop();
          if (canPop) {
            // السماح بالرجوع العادي بدون dialog
            Navigator.of(context).pop();
          } else {
            // فتح zoomDrawer والانتقال إلى home
            try {
              final zoomDrawer = ZoomDrawer.of(context);
              if (zoomDrawer != null) {
                // إغلاق zoomDrawer إذا كان مفتوحاً
                if (zoomDrawer.isOpen()) {
                  zoomDrawer.close();
                }
                // الانتقال إلى home باستخدام NavigationCubit
                context.read<NavigationCubit>().navigateToRoute(
                  AppRoutes.homeRoute,
                );
              } else {
                // Fallback: الانتقال إلى home مباشرة
                Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
              }
            } catch (e) {
              // Fallback: الانتقال إلى home مباشرة
              Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
            }
          }
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        appBar: AppBar(
          leading: (ZoomDrawer.of(context) == null)
              ? IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new, color: AppColors.white),
                )
              : null,
          title: Text(
            S.of(context).settings,
            style: AppTextTheme.textTheme.headlineMedium?.copyWith(
              color: AppColors.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: (ZoomDrawer.of(context) != null)
              ? [CommonMenuButton(color: AppColors.onPrimary)]
              : null,
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
                // App Settings Button
                _buildSettingsCard(
                  context: context,
                  title: S.of(context).systemSettings,
                  subtitle: S.of(context).systemSettings,
                  icon: Icons.settings,
                  iconColor: AppColors.primary,
                  onTap: () {
                    Navigator.of(context).pushNamed('/app-settings');
                  },
                ),
                SizedBox(height: 16.h),
                // Company Settings Button
                _buildSettingsCard(
                  context: context,
                  title: S.of(context).companySettings,
                  subtitle: S.of(context).companySettings,
                  icon: Icons.business,
                  iconColor: AppColors.primary,
                  onTap: () {
                    Navigator.of(context).pushNamed('/company-settings');
                  },
                ),
                SizedBox(height: 16.h),
                // Profile Settings Button
                _buildSettingsCard(
                  context: context,
                  title: S.of(context).accountSettings,
                  subtitle: S.of(context).accountSettings,
                  icon: Icons.person,
                  iconColor: AppColors.primary,
                  onTap: () {
                    Navigator.of(context).pushNamed('/profile-settings');
                  },
                ),
                SizedBox(height: 16.h),
                // Printer Settings Button
                _buildSettingsCard(
                  context: context,
                  title: S.of(context).printSettings,
                  subtitle: S.of(context).printSettings,
                  icon: Icons.print,
                  iconColor: AppColors.primary,
                  onTap: () {
                    Navigator.of(
                      context,
                    ).pushNamed(AppRoutes.printerSettingsRoute);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(icon, color: iconColor, size: 28.sp),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextTheme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.onSurface,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subtitle,
                      style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.onSurfaceVariant,
                size: 20.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
