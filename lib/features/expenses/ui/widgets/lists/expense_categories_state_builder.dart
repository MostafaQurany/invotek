import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/demo/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/expenses/demo/entit/expense_category_model.dart';
import 'package:invotek/features/expenses/ui/widgets/states/expense_categories_empty_state.dart';
import 'package:invotek/features/expenses/ui/widgets/states/expense_categories_error_state.dart';
import 'package:invotek/features/expenses/ui/widgets/lists/expense_categories_list.dart';

class ExpenseCategoriesStateBuilder extends StatelessWidget {
  final Function(ExpenseCategoryModel) onCategoryTap;
  final Function(ExpenseCategoryModel) onCategoryView;
  final Function(ExpenseCategoryModel) onCategoryEdit;
  final Function(ExpenseCategoryModel) onCategoryDelete;
  final VoidCallback onAddCategory;
  final VoidCallback onRetry;
  final String selectedStatus;
  final Function(String) onStatusChanged;

  const ExpenseCategoriesStateBuilder({
    super.key,
    required this.onCategoryTap,
    required this.onCategoryView,
    required this.onCategoryEdit,
    required this.onCategoryDelete,
    required this.onAddCategory,
    required this.onRetry,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseCategoriesCubit, ExpenseCategoriesState>(
      builder: (context, state) {
        print(
          '🏗️ ExpenseCategoriesStateBuilder building with state: ${state.runtimeType}',
        );

        return state.when(
          initial:
              (categories, selectedCategory, currentPage, totalPages, error) =>
                  ExpenseCategoriesEmptyState(onAddCategory: onAddCategory),
          loading:
              (
                categories,
                selectedCategory,
                currentPage,
                totalPages,
                message,
              ) => Container(
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(height: 16),
                      Text(
                        message == 'loading_more'
                            ? 'Loading more...'
                            : 'Loading categories...',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
          loaded: (categories, selectedCategory, currentPage, totalPages) {
            if (categories.isEmpty) {
              return ExpenseCategoriesEmptyState(onAddCategory: onAddCategory);
            }
            return ExpenseCategoriesList(
              categories: categories,
              onCategoryTap: onCategoryTap,
              onCategoryView: onCategoryView,
              onCategoryEdit: onCategoryEdit,
              onCategoryDelete: onCategoryDelete,
            );
          },
          createSuccess:
              (
                categories,
                created,
                selectedCategory,
                currentPage,
                totalPages,
              ) => ExpenseCategoriesList(
                categories: categories,
                onCategoryTap: onCategoryTap,
                onCategoryView: onCategoryView,
                onCategoryEdit: onCategoryEdit,
                onCategoryDelete: onCategoryDelete,
              ),
          updateSuccess:
              (
                categories,
                updated,
                selectedCategory,
                currentPage,
                totalPages,
              ) => ExpenseCategoriesList(
                categories: categories,
                onCategoryTap: onCategoryTap,
                onCategoryView: onCategoryView,
                onCategoryEdit: onCategoryEdit,
                onCategoryDelete: onCategoryDelete,
              ),
          deleteSuccess:
              (
                categories,
                deletedId,
                selectedCategory,
                currentPage,
                totalPages,
              ) => ExpenseCategoriesList(
                categories: categories,
                onCategoryTap: onCategoryTap,
                onCategoryView: onCategoryView,
                onCategoryEdit: onCategoryEdit,
                onCategoryDelete: onCategoryDelete,
              ),
          failure:
              (categories, selectedCategory, currentPage, totalPages, error) =>
                  ExpenseCategoriesErrorState(error: error, onRetry: onRetry),
        );
      },
    );
  }
}
