import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

/// A generic, reusable search and filters widget that can be used throughout the app
/// with any cubit and any filter configuration.
class GenericSearchAndFilters extends StatelessWidget {
  /// The search controller
  final TextEditingController searchController;

  /// The hint text for the search bar
  final String searchHintText;

  /// Callback when search text changes
  final Function(String) onSearchChanged;

  /// List of filter configurations
  final List<FilterConfig> filters;

  /// Optional callback when clear filters is pressed
  final VoidCallback? onClearFilters;

  /// Whether to show the clear filters button
  final bool showClearFilters;

  /// Custom padding for the container
  final EdgeInsets? padding;

  /// Custom decoration for the container
  final BoxDecoration? decoration;

  const GenericSearchAndFilters({
    super.key,
    required this.searchController,
    required this.searchHintText,
    required this.onSearchChanged,
    required this.filters,
    this.onClearFilters,
    this.showClearFilters = false,
    this.padding,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: padding ?? EdgeInsets.all(16.w),
      decoration:
          decoration ??
          BoxDecoration(
            color: colorScheme.surface,
            border: Border(
              bottom: BorderSide(
                color: colorScheme.outline.withOpacity(0.1),
                width: 1,
              ),
            ),
          ),
      child: Column(
        children: [
          _buildSearchBar(context),
          SizedBox(height: 12.h),
          if (filters.isNotEmpty) ...[
            SizedBox(height: 12.h),
            _buildFilters(context),
          ],
          if (showClearFilters && onClearFilters != null) ...[
            SizedBox(height: 8.h),
            _buildClearFiltersButton(context),
          ],
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color:
            AppColors.searchBarBackground, // Light grey background from image
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: searchController,
        onChanged: onSearchChanged,
        style: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
        decoration: InputDecoration(
          hintText: searchHintText,
          hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.textSecondary,
            size: 20.sp,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
        ),
      ),
    );
  }

  Widget _buildFilters(BuildContext context) {
    if (filters.length == 1) {
      return _buildSingleFilter(context, filters.first);
    } else if (filters.length == 2) {
      return Row(
        children: [
          Expanded(child: _buildSingleFilter(context, filters[0])),
          SizedBox(width: 12.w),
          Expanded(child: _buildSingleFilter(context, filters[1])),
        ],
      );
    } else {
      // For more than 2 filters, use a wrap layout
      return Wrap(
        spacing: 8.w,
        runSpacing: 8.h,
        children: filters
            .map(
              (filter) => SizedBox(
                width: (MediaQuery.of(context).size.width - 48.w) / 2,
                child: _buildSingleFilter(context, filter),
              ),
            )
            .toList(),
      );
    }
  }

  Widget _buildSingleFilter(BuildContext context, FilterConfig filter) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.cardBackground, // White background for cards
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value:
            filter.options.any((option) => option.value == filter.selectedValue)
            ? filter.selectedValue
            : filter.options.isNotEmpty
            ? filter.options.first.value
            : null,
        isExpanded: true,
        isDense: true,
        decoration: InputDecoration(
          labelText: filter.label,
          labelStyle: TextStyle(
            fontSize: 12.sp,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          isDense: true,
        ),
        items: filter.options
            .map(
              (option) => DropdownMenuItem(
                value: option.value,
                child: Text(
                  option.label,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
            .toList(),
        onChanged: (value) {
          if (value != null) {
            filter.onChanged(value);
          }
        },
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.textSecondary,
          size: 20.sp,
        ),
        style: TextStyle(fontSize: 14.sp, color: AppColors.textPrimary),
      ),
    );
  }

  Widget _buildClearFiltersButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onClearFilters,
        icon: Icon(Icons.clear_all, size: 16.sp),
        label: Text(S.current.clearFilters),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
    );
  }
}

/// Configuration class for a single filter dropdown
class FilterConfig {
  /// The label for the filter
  final String label;

  /// The currently selected value
  final String selectedValue;

  /// List of available options
  final List<FilterOption> options;

  /// Callback when the filter value changes
  final Function(String) onChanged;

  const FilterConfig({
    required this.label,
    required this.selectedValue,
    required this.options,
    required this.onChanged,
  });
}

/// Configuration class for a filter option
class FilterOption {
  /// The value of the option
  final String value;

  /// The display label of the option
  final String label;

  const FilterOption({required this.value, required this.label});
}

/// Extension to create common filter options easily
extension FilterOptionExtensions on FilterOption {
  /// Creates an "All" option
  static FilterOption all(String label) =>
      FilterOption(value: 'all', label: label);

  /// Creates a status option
  static FilterOption status(String value, String label) =>
      FilterOption(value: value, label: label);

  /// Creates a custom option
  static FilterOption custom(String value, String label) =>
      FilterOption(value: value, label: label);
}
