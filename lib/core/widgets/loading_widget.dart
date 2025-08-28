import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/utils/app_images.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;
  final Color? indicatorColor;
  final double? logoWidth;
  final double? logoHeight;
  final bool showLogo;

  const LoadingWidget({
    super.key,
    this.message,
    this.indicatorColor,
    this.logoWidth,
    this.logoHeight,
    this.showLogo = true,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showLogo) ...[
            // Logo
            Image(
              image: AssetImage(AppImages.logoGreen),
              width: logoWidth ?? 0.4.sw,
              height: logoHeight ?? 0.2.sh,
            ),
            SizedBox(height: 40.h),
          ],
          // Loading indicator
          CircularProgressIndicator(
            color: indicatorColor ?? Colors.green,
            strokeWidth: 3,
          ),
          if (message != null) ...[
            SizedBox(height: 20.h),
            // Loading text
            Text(
              message!,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// Loading overlay widget
class LoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final String? message;
  final Color? indicatorColor;
  final Color? overlayColor;

  const LoadingOverlay({
    super.key,
    required this.child,
    required this.isLoading,
    this.message,
    this.indicatorColor,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: overlayColor ?? Colors.black.withValues(alpha: 0.5),
            child: LoadingWidget(
              message: message,
              indicatorColor: indicatorColor,
              showLogo: false,
            ),
          ),
      ],
    );
  }
}

// Loading button widget
class LoadingButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? indicatorColor;
  final double? width;
  final double? height;

  const LoadingButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.indicatorColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
        ),
        child: isLoading
            ? SizedBox(
                width: 20.w,
                height: 20.h,
                child: CircularProgressIndicator(
                  color: indicatorColor ?? Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Text(text),
      ),
    );
  }
}
