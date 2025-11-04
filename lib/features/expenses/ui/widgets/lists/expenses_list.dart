import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/expenses/domain/entit/expense_model.dart';
import 'package:invotek/features/expenses/ui/widgets/cards/expense_card.dart';

class ExpensesList extends StatelessWidget {
  final List<ExpenseModel> expenses;
  final Function(ExpenseModel) onExpenseTap;
  final Function(ExpenseModel) onExpenseView;
  final Function(ExpenseModel) onExpenseEdit;
  final Function(ExpenseModel) onExpenseDelete;
  final bool isLoadingMore;
  final ScrollController? scrollController;

  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onExpenseTap,
    required this.onExpenseView,
    required this.onExpenseEdit,
    required this.onExpenseDelete,
    this.isLoadingMore = false,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 35.h),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: expenses.length + (isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == expenses.length && isLoadingMore) {
                return Container(
                  padding: EdgeInsets.all(16.w),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }

              final expense = expenses[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: ExpenseCard(
                  expense: expense,
                  onTap: () => onExpenseTap(expense),
                  onEdit: () => onExpenseEdit(expense),
                  onDelete: () => onExpenseDelete(expense),
                  onView: () => onExpenseView(expense),
                  colorScheme: Theme.of(context).colorScheme,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
