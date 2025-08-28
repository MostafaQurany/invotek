import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';

class OnboardingIndicators extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const OnboardingIndicators({
    super.key,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          width: currentPage == index ? 24.w : 8.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: currentPage == index
                ? AppColors.primary
                : Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
