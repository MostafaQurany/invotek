import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/generated/l10n.dart';

class HomeLoadingSection extends StatelessWidget {
  final String? customMessage;
  final Color? indicatorColor;

  const HomeLoadingSection({
    super.key,
    this.customMessage,
    this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Center(
        child: Column(
          children: [
            CircularProgressIndicator(
              color: indicatorColor ?? colorScheme.primary,
            ),
            SizedBox(height: 16.h),
            Text(
              customMessage ?? S.of(context).loadingDashboard,
              style: TextStyle(
                fontSize: 16.sp,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
