import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';

/// A loading card with shimmer effect
class LoadingCard extends StatelessWidget {
  final double? height;
  final double? width;

  const LoadingCard({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(color: AppColors.border, width: 1),
      ),
      child: Container(
        height: height ?? 120.h,
        width: width,
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildShimmer(width: 120.w, height: 20.h),
            SizedBox(height: 12.h),
            _buildShimmer(width: double.infinity, height: 16.h),
            SizedBox(height: 8.h),
            _buildShimmer(width: 200.w, height: 16.h),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmer({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}
