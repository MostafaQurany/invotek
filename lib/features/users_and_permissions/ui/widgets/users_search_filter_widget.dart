import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class UsersSearchFilterWidget extends StatelessWidget {
  final TextEditingController searchController;
  final String statusFilter;
  final String roleFilter;
  final Function(String) onSearchChanged;
  final Function(String) onStatusFilterChanged;
  final Function(String) onRoleFilterChanged;

  const UsersSearchFilterWidget({
    super.key,
    required this.searchController,
    required this.statusFilter,
    required this.roleFilter,
    required this.onSearchChanged,
    required this.onStatusFilterChanged,
    required this.onRoleFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
            child: TextField(
              controller: searchController,
              onChanged: onSearchChanged,
              decoration: InputDecoration(
                hintText: S.of(context).searchForUser,
                hintStyle: TextStyle(fontSize: 12.sp),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.primary,
                  size: 18.sp,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: AppColors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: AppColors.primary),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: AppColors.error),
                ),
                filled: true,
                fillColor: AppColors.primary.withValues(alpha: 0.1),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: _buildFilterDropdown(
                  S.of(context).status,
                  statusFilter,
                  ['all', 'active', 'inactive'],
                  [
                    S.of(context).all,
                    S.of(context).active,
                    S.of(context).inactive,
                  ],
                  onStatusFilterChanged,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: _buildFilterDropdown(
                  S.of(context).role,
                  roleFilter,
                  ['all', 'admin', 'user', 'manager'],
                  [
                    S.of(context).all,
                    S.of(context).admin,
                    S.of(context).user,
                    S.of(context).manager,
                  ],
                  onRoleFilterChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown(
    String label,
    String currentValue,
    List<String> values,
    List<String> labels,
    Function(String) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 2.h),
        Container(
          height: 36.h,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: currentValue,
              isExpanded: true,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              items: values.asMap().entries.map((entry) {
                return DropdownMenuItem<String>(
                  value: entry.value,
                  child: Text(
                    labels[entry.key],
                    style: TextStyle(fontSize: 12.sp),
                  ),
                );
              }).toList(),
              onChanged: (value) => onChanged(value!),
            ),
          ),
        ),
      ],
    );
  }
}
