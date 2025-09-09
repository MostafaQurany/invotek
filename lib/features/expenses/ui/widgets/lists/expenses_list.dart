import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/demo/entit/expense_model.dart';
import 'package:invotek/features/expenses/ui/widgets/cards/expense_card.dart';

class ExpensesList extends StatelessWidget {
  final List<ExpenseModel> expenses;
  final Function(ExpenseModel) onExpenseTap;
  final Function(ExpenseModel) onExpenseView;
  final Function(ExpenseModel) onExpenseEdit;
  final Function(ExpenseModel) onExpenseDelete;

  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onExpenseTap,
    required this.onExpenseView,
    required this.onExpenseEdit,
    required this.onExpenseDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SliverFillRemaining(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28.r),
            topRight: Radius.circular(28.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView.builder(
            padding: EdgeInsets.only(top: 16.h),
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final expense = expenses[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: ExpenseCard(
                  expense: expense,
                  onTap: () => onExpenseTap(expense),
                  onEdit: () => onExpenseEdit(expense),
                  onDelete: () => onExpenseDelete(expense),
                  onView: () => onExpenseView(expense),
                  colorScheme: colorScheme,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
