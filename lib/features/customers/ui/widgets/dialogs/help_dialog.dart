import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class HelpDialog extends StatelessWidget {
  const HelpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      title: Row(
        children: [
          Icon(Icons.help_outline, color: AppColors.primary),
          SizedBox(width: 8.w),
          Text(s.help),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.formHelpTitle,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            s.formHelpDescription,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.greyDark,
              height: 1.5,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text('OK')),
      ],
    );
  }
}
