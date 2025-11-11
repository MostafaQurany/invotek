import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';

class SliceHeightSelector extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;

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
          'ارتفاع الslice (بكسل)',
          style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
        ),
        SizedBox(height: 8.h),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: '900',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          controller: TextEditingController(text: value.toString()),
          onChanged: (newValue) {
            final height = int.tryParse(newValue) ?? 900;
            onChanged(height);
          },
        ),
      ],
    );
  }
}

