import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class StatusDropdown extends StatelessWidget {
  final String selectedStatus;
  final ValueChanged<String?> onChanged;
  final String? errorText;

  const StatusDropdown({
    super.key,
    required this.selectedStatus,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              s.status,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              '*',
              style: TextStyle(
                color: AppColors.error,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        DropdownButtonFormField<String>(
          value: selectedStatus,
          isExpanded: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.flag_outlined,
              color: AppColors.textSecondary,
              size: 20.sp,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.grey.withOpacity(0.3)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.grey.withOpacity(0.3)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: AppColors.error, width: 2),
            ),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            errorText: errorText,
          ),
          items: [
            DropdownMenuItem(
              value: 'active',
              child: Text(s.active, overflow: TextOverflow.ellipsis),
            ),
            DropdownMenuItem(
              value: 'inactive',
              child: Text(s.inactive, overflow: TextOverflow.ellipsis),
            ),
            DropdownMenuItem(
              value: 'out_of_stock',
              child: Text('Out of Stock', overflow: TextOverflow.ellipsis),
            ),
            DropdownMenuItem(
              value: 'discontinued',
              child: Text('Discontinued', overflow: TextOverflow.ellipsis),
            ),
          ],
          onChanged: onChanged,
        ),
      ],
    );
  }
}
