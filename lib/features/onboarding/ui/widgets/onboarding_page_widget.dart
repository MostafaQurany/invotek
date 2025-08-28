import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/onboarding/data/models/onboarding_page.dart';
import 'package:invotek/generated/l10n.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPage page;

  const OnboardingPageWidget({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [page.backgroundColor, page.backgroundColor.withOpacity(0.8)],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // الصورة
            Expanded(
              flex: 3,
              child: Container(
                width: 200.w,
                height: 200.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Image.asset(page.imagePath, fit: BoxFit.contain),
                ),
              ),
            ),

            SizedBox(height: 40.h),

            // العنوان
            Expanded(
              flex: 1,
              child: Text(
                page.getTitle(S.of(context)),
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: page.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 20.h),

            // الوصف
            Expanded(
              flex: 2,
              child: Text(
                page.getDescription(S.of(context)),
                style: TextStyle(
                  fontSize: 16.sp,
                  color: page.textColor.withOpacity(0.9),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
