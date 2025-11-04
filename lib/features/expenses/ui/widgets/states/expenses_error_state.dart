import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';

class ExpensesErrorState extends StatelessWidget {
  final String error;
  final VoidCallback onRetry;

  const ExpensesErrorState({
    super.key,
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Error Icon
            Container(
              width: 120.w,
              height: 120.w,
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(60.r),
              ),
              child: Icon(
                Icons.error_outline,
                size: 60.sp,
                color: AppColors.error,
              ),
            ),

            SizedBox(height: 24.h),

            // Title
            Text(
              'Something went wrong',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),

            SizedBox(height: 8.h),

            // Error Message
            Text(
              error,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.textSecondary,
                height: 1.4,
              ),
            ),

            SizedBox(height: 32.h),

            // Retry Button
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: Icon(Icons.refresh, size: 20.sp),
              label: Text(
                'Try Again',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
