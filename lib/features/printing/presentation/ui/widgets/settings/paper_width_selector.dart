import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/printing/core/utils/paper_preset.dart';
import 'package:invotek/generated/l10n.dart';

class PaperWidthSelector extends StatelessWidget {
  final PaperPreset value;
  final ValueChanged<PaperPreset> onChanged;

  const PaperWidthSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).paperSize,
          style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
        ),
        SizedBox(height: 8.h),
        DropdownButton<PaperPreset>(
          value: value,
          isExpanded: true,
          items: PaperPreset.values.map((preset) {
            return DropdownMenuItem(
              value: preset,
              child: Text(preset.name),
            );
          }).toList(),
          onChanged: (newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
        ),
      ],
    );
  }
}

