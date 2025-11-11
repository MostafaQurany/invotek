import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/expenses/domain/cubit/expenses_cubit.dart';
import 'package:invotek/features/expenses/domain/entit/expense_model.dart';
import 'package:invotek/features/expenses/ui/widgets/lists/expenses_list.dart';
import 'package:invotek/features/expenses/ui/widgets/states/expenses_empty_state.dart';
import 'package:invotek/features/expenses/ui/widgets/states/expenses_error_state.dart';

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
  final ScrollController? scrollController;

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
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.775.sh,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whiteGray,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
      ),
      child: BlocBuilder<ExpensesCubit, ExpensesState>(
          builder: (context, state) {
            print(
              '🏗️ ExpensesStateBuilder building with state: ${state.runtimeType}',
            );

            return state.when(
              initial:
                  (expenses, selectedExpense, currentPage, totalPages, error) {
                    if (expenses.isEmpty) {
                      return ExpensesEmptyState(onAddExpense: onAddExpense);
                    }
                    return ExpensesList(
                      expenses: expenses,
                      onExpenseTap: onExpenseTap,
                      onExpenseView: onExpenseView,
                      onExpenseEdit: onExpenseEdit,
                      onExpenseDelete: onExpenseDelete,
                      scrollController: scrollController,
                      isLoadingMore: false,
                    );
                  },

              loading:
                  (
                    expenses,
                    selectedExpense,
                    currentPage,
                    totalPages,
                    message,
                  ) {
                    if (expenses.isEmpty) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    }
                    return ExpensesList(
                      expenses: expenses,
                      onExpenseTap: onExpenseTap,
                      onExpenseView: onExpenseView,
                      onExpenseEdit: onExpenseEdit,
                      onExpenseDelete: onExpenseDelete,
                      scrollController: scrollController,
                      isLoadingMore: message == 'loading_more',
                    );
                  },
              loaded: (expenses, selectedExpense, currentPage, totalPages) {
                if (expenses.isEmpty) {
                  return ExpensesEmptyState(onAddExpense: onAddExpense);
                }
                return ExpensesList(
                  expenses: expenses,
                  onExpenseTap: onExpenseTap,
                  onExpenseView: onExpenseView,
                  onExpenseEdit: onExpenseEdit,
                  onExpenseDelete: onExpenseDelete,
                  isLoadingMore: false,
                  scrollController: scrollController,
                );
              },
              createSuccess:
                  (
                    expenses,
                    created,
                    selectedExpense,
                    currentPage,
                    totalPages,
                  ) {
                    if (expenses.isEmpty) {
                      return ExpensesEmptyState(onAddExpense: onAddExpense);
                    }
                    return ExpensesList(
                      expenses: expenses,
                      onExpenseTap: onExpenseTap,
                      onExpenseView: onExpenseView,
                      onExpenseEdit: onExpenseEdit,
                      isLoadingMore: false,
                      onExpenseDelete: onExpenseDelete,
                      scrollController: scrollController,
                    );
                  },
              updateSuccess:
                  (
                    expenses,
                    updated,
                    selectedExpense,
                    currentPage,
                    totalPages,
                  ) {
                    if (expenses.isEmpty) {
                      return ExpensesEmptyState(onAddExpense: onAddExpense);
                    }
                    return ExpensesList(
                      expenses: expenses,
                      onExpenseTap: onExpenseTap,
                      onExpenseView: onExpenseView,
                      isLoadingMore: false,
                      onExpenseEdit: onExpenseEdit,
                      onExpenseDelete: onExpenseDelete,
                      scrollController: scrollController,
                    );
                  },
              deleteSuccess:
                  (
                    expenses,
                    deletedId,
                    selectedExpense,
                    currentPage,
                    totalPages,
                  ) {
                    if (expenses.isEmpty) {
                      return ExpensesEmptyState(onAddExpense: onAddExpense);
                    }
                    return ExpensesList(
                      expenses: expenses,
                      onExpenseTap: onExpenseTap,
                      onExpenseView: onExpenseView,
                      onExpenseEdit: onExpenseEdit,
                      onExpenseDelete: onExpenseDelete,
                      scrollController: scrollController,
                      isLoadingMore: false,
                    );
                  },
              failure:
                  (expenses, selectedExpense, currentPage, totalPages, error) {
                    if (expenses.isEmpty) {
                      return ExpensesErrorState(
                        error: error.message,
                        onRetry: onRetry,
                      );
                    }
                    return ExpensesList(
                      expenses: expenses,
                      onExpenseTap: onExpenseTap,
                      onExpenseView: onExpenseView,
                      onExpenseEdit: onExpenseEdit,
                      onExpenseDelete: onExpenseDelete,
                      scrollController: scrollController,
                      isLoadingMore: false,
                    );
                  },
            );
          },
        ),
    );
  }
}
