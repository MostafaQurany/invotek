import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/demo/cubit/expense_categories_cubit.dart';
import 'package:invotek/features/expenses/demo/entit/expense_category_model.dart';
import 'package:invotek/features/expenses/ui/widgets/cards/expense_category_card.dart';

class ExpenseCategoriesList extends StatelessWidget {
  final List<ExpenseCategoryModel> categories;
  final Function(ExpenseCategoryModel) onCategoryTap;
  final Function(ExpenseCategoryModel) onCategoryView;
  final Function(ExpenseCategoryModel) onCategoryEdit;
  final Function(ExpenseCategoryModel) onCategoryDelete;

  const ExpenseCategoriesList({
    super.key,
    required this.categories,
    required this.onCategoryTap,
    required this.onCategoryView,
    required this.onCategoryEdit,
    required this.onCategoryDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final categoriesCubit = ExpenseCategoriesCubit.get(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
      ),
      child: BlocBuilder<ExpenseCategoriesCubit, ExpenseCategoriesState>(
        builder: (context, state) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            itemCount: categories.length + (categoriesCubit.hasMore ? 1 : 0),
            itemBuilder: (context, index) {
              // Show loading indicator at the end if there are more pages
              if (index == categories.length) {
                return Container(
                  padding: EdgeInsets.all(16.h),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                      strokeWidth: 2.0,
                    ),
                  ),
                );
              }

              final category = categories[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: ExpenseCategoryCard(
                  category: category,
                  onTap: () => onCategoryTap(category),
                  onEdit: () => onCategoryEdit(category),
                  onDelete: () => onCategoryDelete(category),
                  onView: () => onCategoryView(category),
                  colorScheme: colorScheme,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
