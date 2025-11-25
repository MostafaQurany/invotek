import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoCard extends StatefulWidget {
  const AppInfoCard({super.key});

  @override
  State<AppInfoCard> createState() => _AppInfoCardState();
}

class _AppInfoCardState extends State<AppInfoCard> {
  PackageInfo? _packageInfo;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPackageInfo();
  }

  Future<void> _loadPackageInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        _packageInfo = packageInfo;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

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
              S.of(context).appInformation,
              style: AppTextTheme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(height: 1, color: AppColors.border),
          _buildTile(
            context,
            icon: Icons.info_outline,
            title: S.of(context).aboutUs,
            subtitle: _isLoading
                ? null
                : '${S.of(context).version}: ${_packageInfo?.version ?? '1.0.0'}',
            onTap: () =>
                Navigator.of(context).pushNamed(AppRoutes.aboutUsRoute),
          ),
        ],
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
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
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: AppTextTheme.textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondary,
              ),
            )
          : null,
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
