import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
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
        }, childCount: categories.length),
      ),
    );
  }
}
