import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';

/// مكون عرض رسائل الخطأ
class ErrorWidget extends StatelessWidget {
  final String message;
  final String? title;
  final VoidCallback? onRetry;
  final String? retryText;
  final IconData? icon;

  const ErrorWidget({
    super.key,
    required this.message,
    this.title,
    this.onRetry,
    this.retryText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Error Icon
            Icon(
              icon ?? Icons.error_outline,
              size: 64.sp,
              color: AppColors.error,
            ),

            SizedBox(height: 16.h),

            // Error Title
            if (title != null) ...[
              Text(
                title!,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
            ],

            // Error Message
            Text(
              message,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 24.h),

            // Retry Button
            if (onRetry != null)
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: Icon(Icons.refresh, size: 18.sp),
                label: Text(
                  retryText ?? 'إعادة المحاولة',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// مكون عرض حالة فارغة
class EmptyWidget extends StatelessWidget {
  final String message;
  final String? title;
  final VoidCallback? onAction;
  final String? actionText;
  final IconData? icon;

  const EmptyWidget({
    super.key,
    required this.message,
    this.title,
    this.onAction,
    this.actionText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Empty Icon
            Icon(
              icon ?? Icons.inbox_outlined,
              size: 64.sp,
              color: AppColors.textSecondary,
            ),

            SizedBox(height: 16.h),

            // Empty Title
            if (title != null) ...[
              Text(
                title!,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
            ],

            // Empty Message
            Text(
              message,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 24.h),

            // Action Button
            if (onAction != null)
              ElevatedButton.icon(
                onPressed: onAction,
                icon: Icon(Icons.add, size: 18.sp),
                label: Text(
                  actionText ?? 'إضافة جديد',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// مكون عرض رسالة نجاح
class SuccessWidget extends StatelessWidget {
  final String message;
  final String? title;
  final VoidCallback? onAction;
  final String? actionText;
  final IconData? icon;

  const SuccessWidget({
    super.key,
    required this.message,
    this.title,
    this.onAction,
    this.actionText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Success Icon
            Icon(
              icon ?? Icons.check_circle_outline,
              size: 64.sp,
              color: AppColors.success,
            ),

            SizedBox(height: 16.h),

            // Success Title
            if (title != null) ...[
              Text(
                title!,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
            ],

            // Success Message
            Text(
              message,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 24.h),

            // Action Button
            if (onAction != null)
              ElevatedButton.icon(
                onPressed: onAction,
                icon: Icon(Icons.arrow_forward, size: 18.sp),
                label: Text(
                  actionText ?? 'متابعة',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 12.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
