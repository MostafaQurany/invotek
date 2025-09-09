import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/demo/cubit/expenses_cubit.dart';
import 'package:invotek/features/expenses/demo/entit/expense_model.dart';
import 'package:invotek/features/expenses/ui/widgets/states/expenses_empty_state.dart';
import 'package:invotek/features/expenses/ui/widgets/states/expenses_error_state.dart';
import 'package:invotek/features/expenses/ui/widgets/lists/expenses_list.dart';

class ExpensesStateBuilder extends StatelessWidget {
  final Function(ExpenseModel) onExpenseTap;
  final Function(ExpenseModel) onExpenseView;
  final Function(ExpenseModel) onExpenseEdit;
  final Function(ExpenseModel) onExpenseDelete;
  final VoidCallback onAddExpense;
  final VoidCallback onRetry;
  final String selectedStatus;
  final String selectedCategory;
  final Function(String) onStatusChanged;
  final Function(String) onCategoryChanged;

  const ExpensesStateBuilder({
    super.key,
    required this.onExpenseTap,
    required this.onExpenseView,
    required this.onExpenseEdit,
    required this.onExpenseDelete,
    required this.onAddExpense,
    required this.onRetry,
    required this.selectedStatus,
    required this.selectedCategory,
    required this.onStatusChanged,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesCubit, ExpensesState>(
      builder: (context, state) {
        print(
          '🏗️ ExpensesStateBuilder building with state: ${state.runtimeType}',
        );

        return state.when(
          initial:
              (expenses, selectedExpense, currentPage, totalPages, error) =>
                  SliverFillRemaining(
                    child: ExpensesEmptyState(onAddExpense: onAddExpense),
                  ),
          loading:
              (expenses, selectedExpense, currentPage, totalPages, message) =>
                  SliverFillRemaining(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(28.r),
                          topRight: Radius.circular(28.r),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(height: 16),
                            Text(
                              message == 'loading_more'
                                  ? 'Loading more...'
                                  : 'Loading expenses...',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          loaded: (expenses, selectedExpense, currentPage, totalPages) {
            if (expenses.isEmpty) {
              return SliverFillRemaining(
                child: ExpensesEmptyState(onAddExpense: onAddExpense),
              );
            }
            return ExpensesList(
              expenses: expenses,
              onExpenseTap: onExpenseTap,
              onExpenseView: onExpenseView,
              onExpenseEdit: onExpenseEdit,
              onExpenseDelete: onExpenseDelete,
            );
          },
          createSuccess:
              (expenses, created, selectedExpense, currentPage, totalPages) =>
                  ExpensesList(
                    expenses: expenses,
                    onExpenseTap: onExpenseTap,
                    onExpenseView: onExpenseView,
                    onExpenseEdit: onExpenseEdit,
                    onExpenseDelete: onExpenseDelete,
                  ),
          updateSuccess:
              (expenses, updated, selectedExpense, currentPage, totalPages) =>
                  ExpensesList(
                    expenses: expenses,
                    onExpenseTap: onExpenseTap,
                    onExpenseView: onExpenseView,
                    onExpenseEdit: onExpenseEdit,
                    onExpenseDelete: onExpenseDelete,
                  ),
          deleteSuccess:
              (expenses, deletedId, selectedExpense, currentPage, totalPages) =>
                  ExpensesList(
                    expenses: expenses,
                    onExpenseTap: onExpenseTap,
                    onExpenseView: onExpenseView,
                    onExpenseEdit: onExpenseEdit,
                    onExpenseDelete: onExpenseDelete,
                  ),
          failure:
              (expenses, selectedExpense, currentPage, totalPages, error) =>
                  SliverFillRemaining(
                    child: ExpensesErrorState(error: error, onRetry: onRetry),
                  ),
        );
      },
    );
  }
}
