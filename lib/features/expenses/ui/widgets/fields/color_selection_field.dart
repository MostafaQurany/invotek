import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class ColorSelectionField extends StatelessWidget {
  final String selectedColor;
  final ValueChanged<String> onColorChanged;

  const ColorSelectionField({
    super.key,
    required this.selectedColor,
    required this.onColorChanged,
  });

  static const List<String> _colors = [
    '#8B5CF6', // Purple
    '#A855F7', // Purple
    '#C084FC', // Purple
    '#E879F9', // Pink
    '#F472B6', // Pink
    '#FB7185', // Pink
    '#F97316', // Orange
    '#FB923C', // Orange
    '#FBBF24', // Yellow
    '#FDE047', // Yellow
    '#84CC16', // Green
    '#4ADE80', // Green
    '#22C55E', // Green
    '#10B981', // Green
    '#3B966E', // Teal
    '#14B8A6', // Teal
    '#06B6D4', // Cyan
    '#0EA5E9', // Blue
    '#3B82F6', // Blue
    '#6366F1', // Indigo
    '#8B5CF6', // Purple
    '#EC4899', // Pink
    '#EF4444', // Red
    '#F59E0B', // Amber
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with required asterisk
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: S.of(context).color,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
              TextSpan(
                text: ' *',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.error,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 8.h),

        // Selected Color Display
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppColors.textSecondary.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Text(
            selectedColor,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textPrimary,
              fontFamily: 'monospace',
            ),
          ),
        ),

        SizedBox(height: 12.h),

        // Color Grid
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 12,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 8.h,
            childAspectRatio: 1,
          ),
          itemCount: _colors.length,
          itemBuilder: (context, index) {
            final color = _colors[index];
            final isSelected = color == selectedColor;
            final colorValue = _parseColor(color);

            return GestureDetector(
              onTap: () => onColorChanged(color),
              child: Container(
                decoration: BoxDecoration(
                  color: colorValue,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    width: 3,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Color _parseColor(String colorString) {
    try {
      return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
    } catch (e) {
      return AppColors.primary;
    }
  }
}
