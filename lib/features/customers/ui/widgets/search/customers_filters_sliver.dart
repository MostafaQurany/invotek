import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/generic_search_and_filters.dart';
import 'package:invotek/generated/l10n.dart';

class CustomersFiltersSliver extends StatelessWidget {
  final String selectedStatus;
  final String selectedCompany;
  final Function(String) onStatusChanged;
  final Function(String) onCompanyChanged;

  const CustomersFiltersSliver({
    super.key,
    required this.selectedStatus,
    required this.selectedCompany,
    required this.onStatusChanged,
    required this.onCompanyChanged,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
      child: Row(
        children: [
          // Status Filter
          Expanded(
            child: _buildFilterDropdown(
              label: s.customerStatus,
              value: selectedStatus,
              options: [
                FilterOptionExtensions.custom('all_status', s.all),
                FilterOptionExtensions.status('active', s.customerStatusActive),
                FilterOptionExtensions.status(
                  'inactive',
                  s.customerStatusInactive,
                ),
              ],
              onChanged: onStatusChanged,
            ),
          ),

          SizedBox(width: 12.w),

          // Company Filter
          Expanded(
            child: _buildFilterDropdown(
              label: s.company,
              value: selectedCompany,
              options: [
                FilterOptionExtensions.custom('all_company', s.all),
                FilterOptionExtensions.custom(
                  'tech_company',
                  'شركة التقنية المتقدمة',
                ),
                FilterOptionExtensions.custom(
                  'finance_company',
                  'مؤسسة الخدمات المالية',
                ),
                FilterOptionExtensions.custom(
                  'construction_company',
                  'شركة البناء والتطوير',
                ),
                FilterOptionExtensions.custom(
                  'education_company',
                  'مؤسسة التعليم الحديث',
                ),
                FilterOptionExtensions.custom(
                  'tourism_company',
                  'شركة السياحة والترفيه',
                ),
                FilterOptionExtensions.custom(
                  'healthcare_company',
                  'مؤسسة الرعاية الصحية',
                ),
                FilterOptionExtensions.custom(
                  'transport_company',
                  'شركة النقل واللوجستيات',
                ),
                FilterOptionExtensions.custom(
                  'ecommerce_company',
                  'مؤسسة التجارة الإلكترونية',
                ),
              ],
              onChanged: onCompanyChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown({
    required String label,
    required String value,
    required List<FilterOption> options,
    required Function(String) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
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
        value: options.any((option) => option.value == value)
            ? value
            : options.isNotEmpty
            ? options.first.value
            : null,
        isExpanded: true,
        isDense: true,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 12.sp,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          isDense: true,
        ),
        items: options
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
            onChanged(value);
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
}
