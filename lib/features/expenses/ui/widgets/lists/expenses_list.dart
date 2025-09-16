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
  final bool isLoadingMore;

  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onExpenseTap,
    required this.onExpenseView,
    required this.onExpenseEdit,
    required this.onExpenseDelete,
    this.isLoadingMore = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h),
          // Expenses Count Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  'Expenses (${expenses.length})',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    '${expenses.length} Total',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          // Expenses List - Using ListView.builder for memory efficiency
          ListView.builder(
            physics:
                const NeverScrollableScrollPhysics(), // Parent SingleChildScrollView handles scrolling
            shrinkWrap: true, // Takes only the space it needs
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
          // Bottom spacing for FAB
          SizedBox(height: 80.h),
        ],
      ),
    );
  }
}
