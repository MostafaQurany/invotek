import 'expense_api_model.dart';
import 'response/get_all_expenses_response.dart';

class ExpensesPaginationResult {
  final List<ExpenseApiModel> expenses;
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final bool hasNextPage;
  final bool hasPreviousPage;

  ExpensesPaginationResult({
    required this.expenses,
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory ExpensesPaginationResult.fromResponse(
    GetAllExpensesResponse response,
  ) {
    final currentPage = response.currentPage ?? 1;
    final lastPage = response.lastPage ?? 1;
    final total = response.total ?? 0;
    final expenses = response.data ?? <ExpenseApiModel>[];

    return ExpensesPaginationResult(
      expenses: expenses,
      currentPage: currentPage,
      totalPages: lastPage,
      totalItems: total,
      hasNextPage: response.nextPageUrl != null,
      hasPreviousPage: response.prevPageUrl != null,
    );
  }
}
