import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/home/ui/widgets/animated_fade_slide_card.dart';

class CustomButtonSelector extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Function()? onPressed;

  const CustomButtonSelector({
    super.key,
    required this.text,
    this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedFadeSlideCard(
      visible: true,
      duration: const Duration(milliseconds: 500),
      offset: const Offset(1, 0),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          width: 0.8.sw,
          height: 50.h,
          child: Container(
            decoration: BoxDecoration(
              border: BoxBorder.fromSTEB(
                end: BorderSide(color: AppColors.primary, width: 1.5),
                bottom: BorderSide(color: AppColors.primary, width: 3),
              ),
              borderRadius: BorderRadiusGeometry.only(
                bottomRight: Radius.circular(8.r),
                topLeft: Radius.circular(8.r),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(iconData, size: 24.sp, color: AppColors.primary),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
