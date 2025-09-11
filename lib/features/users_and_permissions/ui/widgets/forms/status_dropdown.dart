import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class StatusDropdown extends StatelessWidget {
  final String value;
  final ValueChanged<String?> onChanged;
  final Color? backgroundColor;

  const StatusDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    final statuses = [
      {'value': 'all', 'label': s.allStatuses},
      {'value': 'active', 'label': s.active},
      {'value': 'inactive', 'label': s.inactive},
      {'value': 'suspended', 'label': 'Suspended'},
    ];

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey.withOpacity(0.2), width: 1),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
          border: InputBorder.none,
          hintText: 'Select Status',
          hintStyle: TextStyle(color: AppColors.grey, fontSize: 14.sp),
        ),
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: AppColors.grey,
          size: 20.sp,
        ),
        dropdownColor: AppColors.white,
        items: statuses.map((status) {
          return DropdownMenuItem<String>(
            value: status['value'],
            child: Text(
              status['label']!,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
