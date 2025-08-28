import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/generated/l10n.dart';

class AuthScreenHeader extends StatelessWidget {
  final bool isExpanded;
  const AuthScreenHeader({super.key, required this.isExpanded});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: isExpanded ? 1.sh : 0.3.sh,
      width: double.infinity,
      curve: Curves.easeInToLinear,
      decoration: BoxDecoration(
        color: isExpanded ? AppColors.primary : null,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(32.r),
          bottomLeft: Radius.circular(32.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isExpanded)
            Text(
              S.of(context).welcome,
              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(color: AppColors.primary),
              textAlign: TextAlign.center,
            ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 500),
            curve: Curves.linearToEaseOut,
            alignment: isExpanded
                ? AlignmentDirectional.center
                : AlignmentDirectional.centerEnd,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 500),
              curve: Curves.linearToEaseOut,
              scale: isExpanded ? 1.3 : 1.0,
              child: Container(
                width: 0.6.sw,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadiusDirectional.horizontal(
                    start: Radius.circular(32.r),
                  ),
                ),
                child: Image.asset(AppImages.logoWhite),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
