import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/utils/app_images.dart';

class AppLoadingScreen extends StatelessWidget {
  final String? message;
  final Color? indicatorColor;
  final Color? backgroundColor;

  const AppLoadingScreen({
    super.key,
    this.message,
    this.indicatorColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image(
              image: AssetImage(AppImages.logoGreen),
              width: 0.4.sw,
              height: 0.2.sh,
            ),
            SizedBox(height: 40.h),
            // Loading indicator
            CircularProgressIndicator(
              color: indicatorColor ?? Colors.green,
              strokeWidth: 3,
            ),
            SizedBox(height: 20.h),
            // Loading text
            Text(
              message ?? 'Loading...',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
