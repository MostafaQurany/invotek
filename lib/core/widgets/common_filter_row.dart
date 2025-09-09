import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';

class FilterOption {
  final String value;
  final String label;

  const FilterOption({required this.value, required this.label});
}

class CommonFilterRow extends StatelessWidget {
  final List<FilterConfig> filters;
  final EdgeInsets? margin;

  const CommonFilterRow({super.key, required this.filters, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: filters.map((filter) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  filter.label,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyDark,
                  ),
                ),
                SizedBox(height: 4.h),
                DropdownButtonFormField<String>(
                  value: filter.selectedValue,
                  onChanged: filter.onChanged,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: AppColors.greyLight,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: AppColors.greyLight,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                  ),
                  items: filter.options.map((option) {
                    return DropdownMenuItem<String>(
                      value: option.value,
                      child: Text(
                        option.label,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    );
                  }).toList(),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.greyDark,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class FilterConfig {
  final String label;
  final String selectedValue;
  final List<FilterOption> options;
  final Function(String?)? onChanged;

  const FilterConfig({
    required this.label,
    required this.selectedValue,
    required this.options,
    this.onChanged,
  });
}
