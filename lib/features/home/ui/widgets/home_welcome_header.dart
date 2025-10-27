import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/generated/l10n.dart';

class HomeWelcomeHeader extends StatelessWidget {
  final String? userName;
  final String? customWelcomeText;
  final String? customSubtitleText;

  const HomeWelcomeHeader({
    super.key,
    this.userName,
    this.customWelcomeText,
    this.customSubtitleText,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            customWelcomeText ??
                (userName != null
                    ? S.of(context).welcomeBackWithName(userName!)
                    : S.of(context).welcomeBack),
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: colorScheme.primary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            customSubtitleText ?? S.of(context).chooseFeature,
            style: TextStyle(
              fontSize: 16.sp,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
