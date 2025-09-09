import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/demo/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/expenses/demo/entit/expense_category_model.dart';
import 'package:invotek/features/expenses/ui/widgets/cards/expense_categories_header_widget.dart';
import 'package:invotek/features/expenses/ui/widgets/lists/expense_categories_state_builder.dart';
import 'package:invotek/features/expenses/ui/widgets/cards/expense_category_options_bottom_sheet.dart';
import 'package:invotek/features/expenses/ui/widgets/dialogs/delete_expense_category_dialog.dart';

class ExpenseCategoriesListScreen extends StatefulWidget {
  const ExpenseCategoriesListScreen({super.key});

  @override
  State<ExpenseCategoriesListScreen> createState() =>
      _ExpenseCategoriesListScreenState();
}

class ExpenseCategoriesListScreenWithProvider extends StatelessWidget {
  const ExpenseCategoriesListScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExpenseCategoriesListScreen();
  }
}

class _ExpenseCategoriesListScreenState
    extends State<ExpenseCategoriesListScreen> {
  final _searchController = TextEditingController();

  String? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _initializeOptions();
  }

  void _initializeOptions() {
    _selectedStatus = 'all_status';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocListener<ExpenseCategoriesCubit, ExpenseCategoriesState>(
        listener: (context, state) {
          print(
            '🔄 ExpenseCategoriesListScreen received state: ${state.runtimeType}',
          );
          state.whenOrNull(
            deleteSuccess:
                (
                  categories,
                  deletedId,
                  selectedCategory,
                  currentPage,
                  totalPages,
                ) {
                  print(
                    '✅ DeleteSuccess received with ${categories.length} categories, deletedId: $deletedId',
                  );
                  // Category deleted successfully - UI will update automatically
                },
          );
        },
        child: RefreshIndicator(
          onRefresh: () async {
            ExpenseCategoriesCubit.get(context).loadFirstPage(refresh: true);
          },
          child: CustomScrollView(
            slivers: [
              // Custom Header Widget as Sliver
              SliverToBoxAdapter(
                child: ExpenseCategoriesHeaderWidget(
                  onMenuPressed: _handleMenuPressed,
                  onAddPressed: _navigateToAddExpenseCategory,
                  searchController: _searchController,
                  onSearchChanged: (query) {
                    ExpenseCategoriesCubit.get(context).loadFirstPage(
                      refresh: true,
                      search: query.isEmpty ? null : query,
                      status: _selectedStatus == 'all_status'
                          ? null
                          : _selectedStatus,
                    );
                  },
                  selectedStatus: _selectedStatus ?? '',
                  onStatusChanged: _onStatusChanged,
                ),
              ),

              // Categories List
              ExpenseCategoriesStateBuilder(
                onCategoryTap: (category) =>
                    _showCategoryOptions(context, category),
                onCategoryView: _navigateToCategoryDetails,
                onCategoryEdit: _navigateToEditCategory,
                onCategoryDelete: _showDeleteConfirmation,
                onAddCategory: _navigateToAddExpenseCategory,
                onRetry: _retry,
                selectedStatus: _selectedStatus ?? '',
                onStatusChanged: _onStatusChanged,
              ),

              // Bottom spacing for FAB
              SliverToBoxAdapter(child: SizedBox(height: 100.h)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddExpenseCategory,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        icon: Icon(Icons.add, size: 20.sp),
        label: Text(
          'Add Category',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.r),
        ),
      ),
    );
  }

  // Event Handlers
  void _handleMenuPressed() {
    ZoomDrawer.of(context)?.toggle();
  }

  void _onStatusChanged(String status) {
    setState(() {
      _selectedStatus = status;
    });
    ExpenseCategoriesCubit.get(context).loadFirstPage(
      refresh: true,
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: status == 'all_status' ? null : status,
    );
  }

  void _navigateToAddExpenseCategory() {
    // TODO: Implement when AddExpenseCategoryScreen is created
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Add Category screen - Coming Soon!'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _navigateToCategoryDetails(ExpenseCategoryModel category) {
    // TODO: Implement when ExpenseCategoryDetailsScreen is created
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Category Details screen - Coming Soon!'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _navigateToEditCategory(ExpenseCategoryModel category) {
    // TODO: Implement when EditExpenseCategoryScreen is created
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Edit Category screen - Coming Soon!'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _showCategoryOptions(
    BuildContext context,
    ExpenseCategoryModel category,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => ExpenseCategoryOptionsBottomSheet(
        category: category,
        onView: () {
          Navigator.pop(context);
          _navigateToCategoryDetails(category);
        },
        onEdit: () {
          Navigator.pop(context);
          _navigateToEditCategory(category);
        },
        onDelete: () {
          Navigator.pop(context);
          _showDeleteConfirmation(category);
        },
      ),
    );
  }

  void _showDeleteConfirmation(ExpenseCategoryModel category) {
    final categoriesCubit = ExpenseCategoriesCubit.get(context);
    showDialog(
      context: context,
      builder: (context) => DeleteExpenseCategoryDialog(
        category: category,
        onConfirm: () {
          categoriesCubit.deleteExpenseCategory(category.id);
        },
      ),
    );
  }

  void _retry() {
    ExpenseCategoriesCubit.get(context).loadFirstPage(refresh: true);
  }
}
