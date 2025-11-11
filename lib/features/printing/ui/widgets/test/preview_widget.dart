import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';

class PreviewWidget extends StatelessWidget {
  final List<Uint8List> previewChunks;

  const PreviewWidget({
    super.key,
    required this.previewChunks,
  });

  @override
  Widget build(BuildContext context) {
    if (previewChunks.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'معاينة:',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        ...previewChunks.map(
          (chunk) => Container(
            margin: EdgeInsets.only(bottom: 8.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.memory(chunk, fit: BoxFit.contain),
          ),
        ),
      ],
    );
  }
}

