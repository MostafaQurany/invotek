import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const SettingsCard({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Icon(icon, color: AppColors.primary, size: 24.sp),
                SizedBox(width: 12.w),
                Text(
                  title,
                  style: AppTextTheme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.onSurface,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // Content
            child,
          ],
        ),
      ),
    );
  }
}
