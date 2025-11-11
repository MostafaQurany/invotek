import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/common_search_bar.dart';
import 'package:invotek/generated/l10n.dart';

class ExpenseCategoriesHeaderWidget extends StatefulWidget {
  final VoidCallback onMenuPressed;
  final VoidCallback onAddPressed;
  final TextEditingController searchController;
  final Function(String) onSearchChanged;
  final String selectedStatus;
  final Function(String) onStatusChanged;

  const ExpenseCategoriesHeaderWidget({
    super.key,
    required this.onMenuPressed,
    required this.onAddPressed,
    required this.searchController,
    required this.onSearchChanged,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  @override
  State<ExpenseCategoriesHeaderWidget> createState() =>
      _ExpenseCategoriesHeaderWidgetState();
}

class _ExpenseCategoriesHeaderWidgetState
    extends State<ExpenseCategoriesHeaderWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<double> _rotationAnimation;
  bool _showFilters = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _sizeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleFilters() {
    setState(() {
      _showFilters = !_showFilters;
      if (_showFilters) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      child: Column(
        children: [
          // First Row: Menu, Title, Add Button
          _buildTopRow(),

          // Second Row: Search Bar
          _buildSearchRow(),

          // Third Row: Animated Filters
          _buildAnimatedFilters(),
        ],
      ),
    );
  }

  Widget _buildTopRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          // Menu Button
          IconButton(
            onPressed: widget.onMenuPressed,
            icon: Icon(Icons.menu, color: AppColors.white, size: 24.sp),
          ),
          // Title
          Expanded(
            child: Text(
              S.of(context).expenseCategories,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Add Button
          IconButton(
            onPressed: null,
            icon: Icon(Icons.add, color: AppColors.primary, size: 24.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          // Search Bar
          Expanded(
            child: CommonSearchBarExtensions.expenseCategoriesSearch(
              controller: widget.searchController,
              onChanged: widget.onSearchChanged,
              hintText: S.of(context).expensesSearchCategories,
            ),
          ),

          SizedBox(width: 8.w),

          // Filter Button
          GestureDetector(
            onTap: _toggleFilters,
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: AnimatedRotation(
                turns: _rotationAnimation.value,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.filter_list,
                  color: AppColors.white,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedFilters() {
    return SizeTransition(
      sizeFactor: _sizeAnimation,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            // Status Filter
            Expanded(
              child: _buildFilterDropdown(
                value: widget.selectedStatus,
                items: [
                  DropdownMenuItem(
                    value: 'all_status',
                    child: Text(S.of(context).expensesAllStatus),
                  ),
                  DropdownMenuItem(value: 'active', child: Text(S.of(context).active)),
                  DropdownMenuItem(value: 'inactive', child: Text(S.of(context).inactive)),
                ],
                onChanged: widget.onStatusChanged,
                hint: 'Status',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterDropdown({
    required String value,
    required List<DropdownMenuItem<String>> items,
    required Function(String) onChanged,
    required String hint,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.searchBarBackground,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.grey.withOpacity(0.3)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          items: items,
          onChanged: (newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
          style: TextStyle(color: AppColors.textPrimary, fontSize: 14.sp),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textSecondary,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}
