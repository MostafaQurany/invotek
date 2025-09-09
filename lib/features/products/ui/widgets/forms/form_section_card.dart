import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormSectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final ColorScheme colorScheme;

  const FormSectionCard({
    super.key,
    required this.title,
    required this.children,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(color: colorScheme.outline.withOpacity(0.1), width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 20.h),
            ...children,
          ],
        ),
      ),
    );
  }
}
