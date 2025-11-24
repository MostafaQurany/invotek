import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';

enum StatusBadgeType { success, error, warning, info }

/// A status badge with different color variants
class StatusBadge extends StatelessWidget {
  final String text;
  final StatusBadgeType type;

  const StatusBadge({super.key, required this.text, required this.type});

  Color get _backgroundColor {
    switch (type) {
      case StatusBadgeType.success:
        return AppColors.success.withOpacity(0.1);
      case StatusBadgeType.error:
        return AppColors.error.withOpacity(0.1);
      case StatusBadgeType.warning:
        return Colors.orange.withOpacity(0.1);
      case StatusBadgeType.info:
        return AppColors.primary.withOpacity(0.1);
    }
  }

  Color get _textColor {
    switch (type) {
      case StatusBadgeType.success:
        return AppColors.success;
      case StatusBadgeType.error:
        return AppColors.error;
      case StatusBadgeType.warning:
        return Colors.orange;
      case StatusBadgeType.info:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: AppTextTheme.textTheme.bodySmall?.copyWith(
          color: _textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
