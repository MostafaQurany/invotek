import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/common_menu_button.dart';
import 'package:invotek/core/widgets/common_search_bar.dart';
import 'package:invotek/core/widgets/generic_search_and_filters.dart';
import 'package:invotek/generated/l10n.dart';

class CustomersHeaderWidget extends StatefulWidget {
  final VoidCallback onMenuPressed;
  final TextEditingController searchController;
  final Function(String) onSearchChanged;
  final String selectedStatus;
  final String selectedCompany;
  final Function(String) onStatusChanged;
  final Function(String) onCompanyChanged;
  final VoidCallback onFilterPressed;

  const CustomersHeaderWidget({
    super.key,
    required this.onMenuPressed,
    required this.searchController,
    required this.onSearchChanged,
    required this.selectedStatus,
    required this.selectedCompany,
    required this.onStatusChanged,
    required this.onCompanyChanged,
    required this.onFilterPressed,
  });

  @override
  State<CustomersHeaderWidget> createState() => _CustomersHeaderWidgetState();
}

class _CustomersHeaderWidgetState extends State<CustomersHeaderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary, AppColors.primary.withOpacity(0.9)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // First Row: Menu, Title, Add Button
          _buildFirstRow(context, s),

          // Second Row: Search Bar with Filter Button
          _buildSearchRow(context, s),

          // Third Row: Animated Filters
          AnimatedBuilder(
            animation: _slideAnimation,
            builder: (context, child) {
              return SizeTransition(
                sizeFactor: _slideAnimation,
                child: _buildFiltersRow(context, s),
              );
            },
          ),

          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget _buildFirstRow(BuildContext context, S s) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16.w,
        50.h,
        16.w,
        16.h,
      ), // Top padding for status bar
      child: Row(
        children: [
          if (ZoomDrawer.of(context) == null)
            CommonMenuButton(color: AppColors.white),
          SizedBox(width: 16.w),

          // Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  s.customersList,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  s.customerManagement,
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.8),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16.w),

          // Menu Button
          if (ZoomDrawer.of(context) != null)
            CommonMenuButton(color: AppColors.white),
        ],
      ),
    );
  }

  Widget _buildSearchRow(BuildContext context, S s) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          // Search Bar
          Expanded(
            child: CommonSearchBarExtensions.customersSearch(
              controller: widget.searchController,
              onChanged: widget.onSearchChanged,
              hintText: s.searchCustomers,
            ),
          ),

          SizedBox(width: 12.w),

          // Filter Button
          Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
              color: AppColors.searchBarBackground,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                Icons.tune,
                color: AppColors.textSecondary,
                size: 20.sp,
              ),
              onPressed: widget.onFilterPressed,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFiltersRow(BuildContext context, S s) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Status Filter
          Expanded(
            child: _buildFilterDropdown(
              label: s.customerStatus,
              value: widget.selectedStatus,
              options: [
                FilterOptionExtensions.custom('all_status', s.all),
                FilterOptionExtensions.status('active', s.customerStatusActive),
                FilterOptionExtensions.status(
                  'inactive',
                  s.customerStatusInactive,
                ),
              ],
              onChanged: widget.onStatusChanged,
            ),
          ),

          SizedBox(width: 12.w),

          // Company Filter
          Expanded(
            child: _buildFilterDropdown(
              label: s.company,
              value: widget.selectedCompany,
              options: [
                FilterOptionExtensions.custom('all_company', s.all),
                FilterOptionExtensions.custom(
                  'tech_company',
                  s.customersCompanyTech,
                ),
                FilterOptionExtensions.custom(
                  'finance_company',
                  s.customersCompanyFinance,
                ),
                FilterOptionExtensions.custom(
                  'construction_company',
                  s.customersCompanyConstruction,
                ),
                FilterOptionExtensions.custom(
                  'education_company',
                  s.customersCompanyEducation,
                ),
                FilterOptionExtensions.custom(
                  'tourism_company',
                  s.customersCompanyTourism,
                ),
                FilterOptionExtensions.custom(
                  'healthcare_company',
                  s.customersCompanyHealthcare,
                ),
                FilterOptionExtensions.custom(
                  'transport_company',
                  s.customersCompanyTransport,
                ),
                FilterOptionExtensions.custom(
                  'ecommerce_company',
                  s.customersCompanyEcommerce,
                ),
              ],
              onChanged: widget.onCompanyChanged,
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
        initialValue: options.any((option) => option.value == value)
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
