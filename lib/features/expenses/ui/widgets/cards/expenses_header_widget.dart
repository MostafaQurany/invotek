import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/common_menu_button.dart';
import 'package:invotek/core/widgets/common_search_bar.dart';
import 'package:invotek/features/expenses/domain/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/expenses/domain/cubit/expenses_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class ExpensesHeaderWidget extends StatefulWidget {
  final TextEditingController searchController;
  final Function(String) onSearchChanged;
  final String selectedStatus;
  final String selectedCategory;
  final Function(String) onStatusChanged;
  final Function(String) onCategoryChanged;
  // Optional sorting controls
  final String? selectedSortBy;
  final String? selectedSortOrder;
  final Function(String)? onSortByChanged;
  final Function(String)? onSortOrderChanged;

  const ExpensesHeaderWidget({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.selectedStatus,
    required this.selectedCategory,
    required this.onStatusChanged,
    required this.onCategoryChanged,
    this.selectedSortBy,
    this.selectedSortOrder,
    this.onSortByChanged,
    this.onSortOrderChanged,
  });

  @override
  State<ExpensesHeaderWidget> createState() => _ExpensesHeaderWidgetState();
}

class _ExpensesHeaderWidgetState extends State<ExpensesHeaderWidget>
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary, AppColors.primary.withOpacity(0.9)],
        ),
      ),
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
          if (ZoomDrawer.of(context) == null)
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.white,
                size: 26.sp,
              ),
            ),
          // Title
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).expensesList,
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  S.of(context).manageExpensesAndBudgets,
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.8),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          if (ZoomDrawer.of(context) != null)
            CommonMenuButton(color: AppColors.white),
        ],
      ),
    );
  }

  Widget _buildSearchRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: IconButton(
              onPressed: () {
                ExpensesCubit.get(context).loadFirstPage(refresh: true);
                ExpenseCategoriesCubit.get(
                  context,
                ).loadFirstPage(refresh: true);
              },
              icon: Icon(Icons.refresh, color: AppColors.primary, size: 20.sp),
            ),
          ),
          SizedBox(width: 8.w),

          // Search Bar
          Expanded(
            child: CommonSearchBarExtensions.expensesSearch(
              controller: widget.searchController,
              onChanged: widget.onSearchChanged,
              hintText: S.of(context).searchExpenses,
            ),
          ),

          SizedBox(width: 8.w),

          // Filter Button
          GestureDetector(
            onTap: _toggleFilters,
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: AnimatedRotation(
                turns: _rotationAnimation.value,
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.filter_list,
                  color: AppColors.primary,
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
            // // Status Filter
            // Expanded(
            //   child: _buildFilterDropdown(
            //     value: widget.selectedStatus,
            //     items: const [
            //       DropdownMenuItem(
            //         value: 'all_status',
            //         child: Text('All Status'),
            //       ),
            //       DropdownMenuItem(value: 'active', child: Text('Active')),
            //       DropdownMenuItem(value: 'inactive', child: Text('Inactive')),
            //     ],
            //     onChanged: widget.onStatusChanged,
            //     hint: S.of(context).status,
            //   ),
            // ),

            // SizedBox(width: 12.w),

            // Category Filter
            Expanded(
              child:
                  BlocBuilder<ExpenseCategoriesCubit, ExpenseCategoriesState>(
                    builder: (context, state) {
                      return _buildCategoryDropdown(state);
                    },
                  ),
            ),

            SizedBox(width: 12.w),

            // Sort By
            if (widget.onSortByChanged != null)
              Expanded(
                child: _buildFilterDropdown(
                  value: widget.selectedSortBy ?? 'created_at',
                  items: [
                    DropdownMenuItem(value: 'title', child: Text(S.of(context).expensesSortByTitle)),
                    DropdownMenuItem(value: 'amount', child: Text(S.of(context).expensesSortByAmount)),
                    DropdownMenuItem(
                      value: 'created_at',
                      child: Text(S.of(context).expensesSortByCreatedAt),
                    ),
                    DropdownMenuItem(
                      value: 'updated_at',
                      child: Text(S.of(context).expensesSortByUpdatedAt),
                    ),
                    DropdownMenuItem(value: 'date', child: Text(S.of(context).expensesSortByDate)),
                  ],
                  onChanged: widget.onSortByChanged!,
                  hint: S.of(context).expensesSortBy,
                ),
              ),

            SizedBox(width: 12.w),

            // Sort Order
            if (widget.onSortOrderChanged != null)
              Expanded(
                child: _buildFilterDropdown(
                  value: widget.selectedSortOrder ?? 'desc',
                  items: [
                    DropdownMenuItem(value: 'asc', child: Text(S.of(context).expensesSortOrderAsc)),
                    DropdownMenuItem(value: 'desc', child: Text(S.of(context).expensesSortOrderDesc)),
                  ],
                  onChanged: widget.onSortOrderChanged!,
                  hint: S.of(context).expensesOrder,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown(ExpenseCategoriesState state) {
    return state.whenOrNull(
          loaded: (categories, selectedCategory, currentPage, totalPages) {
            // Create dropdown items from categories
            final s = S.of(context);
            final List<DropdownMenuItem<String>> categoryItems = [
              DropdownMenuItem(
                value: 'all_category',
                child: Text(s.expensesAllCategories),
              ),
              ...categories.map(
                (category) => DropdownMenuItem(
                  value: category.id.toString(),
                  child: Text(category.name),
                ),
              ),
            ];

            return _buildFilterDropdown(
              value: widget.selectedCategory,
              items: categoryItems,
              onChanged: widget.onCategoryChanged,
              hint: S.of(context).categories,
            );
          },
        ) ??
        // Fallback when categories are not loaded yet
        _buildFilterDropdown(
          value: widget.selectedCategory,
          items: [
            DropdownMenuItem(
              value: 'all_category',
              child: Text(S.of(context).expensesAllCategories),
            ),
          ],
          onChanged: widget.onCategoryChanged,
          hint: S.of(context).categories,
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
        borderRadius: BorderRadius.circular(16.r),

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
          style: TextStyle(color: AppColors.textPrimary, fontSize: 12.sp),
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
