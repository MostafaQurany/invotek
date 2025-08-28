import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';

class LoadingWidgets {
  static Widget circularLoading({Color? color, double? size, String? message}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: color ?? AppColors.primary,
            strokeWidth: 3,
          ),
          if (message != null) ...[
            SizedBox(height: 16.h),
            Text(
              message,
              style: TextStyle(color: AppColors.primary, fontSize: 16.sp),
            ),
          ],
        ],
      ),
    );
  }

  static Widget linearLoading({Color? color, String? message}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LinearProgressIndicator(
            color: color ?? AppColors.primary,
            backgroundColor: Colors.grey[300],
          ),
          if (message != null) ...[
            SizedBox(height: 16.h),
            Text(
              message,
              style: TextStyle(color: AppColors.primary, fontSize: 16.sp),
            ),
          ],
        ],
      ),
    );
  }

  static Widget skeletonLoading({
    double? height,
    double? width,
    BorderRadius? borderRadius,
  }) {
    return Container(
      height: height ?? 20.h,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
      child: const SizedBox(),
    );
  }

  static Widget buttonLoading({required String text, Color? color}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 16.w,
          height: 16.w,
          child: CircularProgressIndicator(
            color: color ?? Colors.white,
            strokeWidth: 2,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          text,
          style: TextStyle(color: color ?? Colors.white, fontSize: 16.sp),
        ),
      ],
    );
  }

  static Widget overlayLoading({
    required Widget child,
    bool isLoading = false,
    String? message,
  }) {
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            color: Colors.black.withValues(alpha: 0.5),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: AppColors.primary),
                    if (message != null) ...[
                      SizedBox(height: 16.h),
                      Text(
                        message,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
