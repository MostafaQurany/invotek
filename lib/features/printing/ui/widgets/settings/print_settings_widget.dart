import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/printing/core/utils/paper_preset.dart';
import 'package:invotek/features/printing/core/models/invoice_language.dart';
import 'paper_width_selector.dart';
import 'slice_height_selector.dart';
import 'language_selector.dart';

class PrintSettingsWidget extends StatelessWidget {
  final PaperPreset paperWidth;
  final int sliceHeight;
  final InvoiceLanguage invoiceLanguage;
  final ValueChanged<PaperPreset> onPaperWidthChanged;
  final ValueChanged<int> onSliceHeightChanged;
  final ValueChanged<InvoiceLanguage> onLanguageChanged;

  const PrintSettingsWidget({
    super.key,
    required this.paperWidth,
    required this.sliceHeight,
    required this.invoiceLanguage,
    required this.onPaperWidthChanged,
    required this.onSliceHeightChanged,
    required this.onLanguageChanged,
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
            'إعدادات الطباعة',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 16.h),
          PaperWidthSelector(
            value: paperWidth,
            onChanged: onPaperWidthChanged,
          ),
          SizedBox(height: 16.h),
          SliceHeightSelector(
            value: sliceHeight,
            onChanged: onSliceHeightChanged,
          ),
          SizedBox(height: 16.h),
          LanguageSelector(
            value: invoiceLanguage,
            onChanged: onLanguageChanged,
          ),
        ],
      ),
    );
  }
}

