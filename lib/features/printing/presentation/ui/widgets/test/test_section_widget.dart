import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';
import 'preview_widget.dart';

class TestSectionWidget extends StatelessWidget {
  final bool isGeneratingPreview;
  final bool isConnected;
  final List<Uint8List> testPreview;
  final VoidCallback onGeneratePreview;
  final VoidCallback onPrintTest;

  const TestSectionWidget({
    super.key,
    required this.isGeneratingPreview,
    required this.isConnected,
    required this.testPreview,
    required this.onGeneratePreview,
    required this.onPrintTest,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).previewAndTestPrint,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: isGeneratingPreview ? null : onGeneratePreview,
                  icon: const Icon(Icons.visibility),
                  label: Text(S.of(context).preview),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: isConnected ? onPrintTest : null,
                  icon: const Icon(Icons.print),
                  label: Text(S.of(context).testPrint),
                ),
              ),
            ],
          ),
          if (testPreview.isNotEmpty) ...[
            SizedBox(height: 16.h),
            PreviewWidget(previewChunks: testPreview),
          ],
        ],
      ),
    );
  }
}

