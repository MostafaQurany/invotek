import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/generated/l10n.dart';

class HomeErrorSection extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final String? retryText;
  final IconData? icon;

  const HomeErrorSection({
    super.key,
    required this.message,
    this.onRetry,
    this.retryText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Center(
        child: Column(
          children: [
            Icon(
              icon ?? Icons.error_outline,
              size: 48.sp,
              color: colorScheme.error,
            ),
            SizedBox(height: 16.h),
            Text(
              message.isNotEmpty ? message : S.of(context).dashboardErrorMessage,
              style: TextStyle(fontSize: 16.sp, color: colorScheme.error),
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: onRetry,
                child: Text(retryText ?? S.of(context).retry),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
