import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class SliceHeightSelector extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;

  static const List<int> _sliceHeightOptions = [
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    1000,
  ];

  const SliceHeightSelector({
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
          S.of(context).sliceHeight,
          style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
        ),
        SizedBox(height: 8.h),
        DropdownButtonFormField<int>(
          value: _sliceHeightOptions.contains(value) ? value : 400,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
          ),
          items: _sliceHeightOptions.map((height) {
            return DropdownMenuItem<int>(
              value: height,
              child: Text(
                height.toString(),
                style: TextStyle(fontSize: 14.sp),
              ),
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
