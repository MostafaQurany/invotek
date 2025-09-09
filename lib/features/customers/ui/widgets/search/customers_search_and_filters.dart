import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/generic_search_and_filters.dart';
import 'package:invotek/generated/l10n.dart';

/// Customers-specific search and filters widget using the generic component
class CustomersSearchAndFilters extends StatelessWidget {
  final TextEditingController searchController;
  final String selectedStatus;
  final String selectedCompany;
  final Function(String) onSearchChanged;
  final Function(String) onStatusChanged;
  final Function(String) onCompanyChanged;
  final VoidCallback? onClearFilters;

  const CustomersSearchAndFilters({
    super.key,
    required this.searchController,
    required this.selectedStatus,
    required this.selectedCompany,
    required this.onSearchChanged,
    required this.onStatusChanged,
    required this.onCompanyChanged,
    this.onClearFilters,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return GenericSearchAndFilters(
      decoration: BoxDecoration(
        color: AppColors.backgroundLight, // Light background to match image
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.w),
      searchController: searchController,
      searchHintText: s.searchCustomers,
      onSearchChanged: onSearchChanged,
      showClearFilters: onClearFilters != null,
      filters: [
        FilterConfig(
          label: s.customerStatus,
          selectedValue: selectedStatus,
          options: [
            FilterOptionExtensions.custom('all_status', s.all),
            FilterOptionExtensions.status('active', s.customerStatusActive),
            FilterOptionExtensions.status('inactive', s.customerStatusInactive),
          ],
          onChanged: onStatusChanged,
        ),
        FilterConfig(
          label: s.company,
          selectedValue: selectedCompany,
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
      ],
    );
  }
}
