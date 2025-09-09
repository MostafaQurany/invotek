import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class CustomersAppBar extends StatelessWidget {
  final VoidCallback onMenuPressed;
  final VoidCallback onAddPressed;

  const CustomersAppBar({
    super.key,
    required this.onMenuPressed,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return SliverAppBar(
      // Dark green background as specified in image description
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      floating: true,
      snap: true,
      toolbarHeight: 70.h,

      // Centered title with bold white font
      title: Text(
        s.customersList,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.white,
        ),
      ),
      centerTitle: true,

      // Hamburger menu on the left
      leading: IconButton(
        icon: Icon(Icons.menu, color: AppColors.white, size: 24.sp),
        onPressed: onMenuPressed,
      ),

      // Add button on the right
      actions: [
        IconButton(
          icon: Icon(Icons.add, color: AppColors.white, size: 24.sp),
          onPressed: onAddPressed,
        ),
        SizedBox(width: 8.w),
      ],
    );
  }
}
