import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

/// A reusable bottom sheet for applying multiple filters
/// Can be used across all features (customers, products, invoices, etc.)
class CommonFiltersBottomSheet extends StatefulWidget {
  /// Title of the bottom sheet
  final String title;

  /// List of filter groups to display
  final List<FilterGroup> filterGroups;

  /// Callback when filters are applied
  final Function(Map<String, String?>) onApply;

  /// Callback when filters are reset
  final VoidCallback? onReset;

  const CommonFiltersBottomSheet({
    super.key,
    required this.title,
    required this.filterGroups,
    required this.onApply,
    this.onReset,
  });

  @override
  State<CommonFiltersBottomSheet> createState() =>
      _CommonFiltersBottomSheetState();
}

class _CommonFiltersBottomSheetState extends State<CommonFiltersBottomSheet> {
  late Map<String, String?> _selectedValues;

  @override
  void initState() {
    super.initState();
    _selectedValues = {};
    for (var group in widget.filterGroups) {
      _selectedValues[group.key] = group.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
     padding: EdgeInsets.fromLTRB(
        24.w,
        5.h,
        24.w,
        bottomPadding > 0 ? bottomPadding + 32.h : 32.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // _buildHandleBar(),
          // SizedBox(height: 24.h),
          _buildTitle(),
          SizedBox(height: 24.h),

          // Filter Groups
          ...widget.filterGroups.map((group) {
            return Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: _buildFilterGroup(group),
            );
          }),

          SizedBox(height: 12.h),
          _buildActionButtons(s),
        ],
      ),
    );
  }

  // Widget _buildHandleBar() {
  //   return Center(
  //     child: Container(
  //       width: 40.w,
  //       height: 4.h,
  //       decoration: BoxDecoration(
  //         color: AppColors.grey.withOpacity(0.3),
  //         borderRadius: BorderRadius.circular(2.r),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildTitle() {
    return Text(
      widget.title,
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
    );
  }

  Widget _buildFilterGroup(FilterGroup group) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          group.label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 12.h),
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: group.options.map((option) {
            return _buildFilterChip(
              label: option.label,
              value: option.value,
              selected: _selectedValues[group.key],
              onSelected: (value) {
                setState(() {
                  _selectedValues[group.key] = value;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildFilterChip({
    required String label,
    required String? value,
    required String? selected,
    required Function(String?) onSelected,
  }) {
    final isSelected = selected == value;

    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (bool isSelected) {
        onSelected(isSelected ? value : null);
      },
      selectedColor: AppColors.primary.withOpacity(0.2),
      backgroundColor: AppColors.backgroundLight,
      labelStyle: TextStyle(
        color: isSelected ? AppColors.primary : AppColors.textSecondary,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        fontSize: 13.sp,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        side: BorderSide(
          color: isSelected
              ? AppColors.primary
              : AppColors.grey.withOpacity(0.3),
          width: 1,
        ),
      ),
    );
  }

  Widget _buildActionButtons(S s) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                for (var key in _selectedValues.keys) {
                  _selectedValues[key] = null;
                }
              });
              if (widget.onReset != null) {
                widget.onReset!();
              }
              widget.onApply(_selectedValues);
              Navigator.pop(context);
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              side: BorderSide(color: AppColors.primary),
            ),
            child: Text(
              s.resetFilters,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: FilledButton(
            onPressed: () {
              widget.onApply(_selectedValues);
              Navigator.pop(context);
            },
            style: FilledButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              backgroundColor: AppColors.primary,
            ),
            child: Text(
              s.applyFilters,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}

/// Configuration for a group of filters
class FilterGroup {
  /// Unique key for this filter group
  final String key;

  /// Label to display above the filter options
  final String label;

  /// Available filter options
  final List<FilterOption> options;

  /// Initial selected value
  final String? initialValue;

  const FilterGroup({
    required this.key,
    required this.label,
    required this.options,
    this.initialValue,
  });
}

/// Individual filter option
class FilterOption {
  /// The value to send to API
  final String? value;

  /// Display label
  final String label;

  const FilterOption({required this.value, required this.label});
}
