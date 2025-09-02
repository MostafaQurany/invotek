import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/generated/l10n.dart';

class OnboardingButtons extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final VoidCallback onComplete;

  const OnboardingButtons({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
    required this.onPrevious,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Previous button
          if (currentPage > 0)
            TextButton(
              onPressed: onPrevious,
              child: Text(
                S.of(context).previous,
                style: TextStyle(fontSize: 16.sp, color: colorScheme.primary),
              ),
            )
          else
            SizedBox(width: 80.w),

          // Next or complete button
          FilledButton(
            onPressed: currentPage == totalPages - 1 ? onComplete : onNext,
            child: Text(
              currentPage == totalPages - 1
                  ? S.of(context).startNow
                  : S.of(context).next,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
