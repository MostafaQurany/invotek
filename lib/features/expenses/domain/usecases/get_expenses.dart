import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/expenses/data/repository/expenses_repository.dart';
import 'package:invotek/features/expenses/domain/entit/expense_model.dart';

class GetExpenses implements UseCase<List<ExpenseModel>, GetExpensesParams> {
  final ExpensesRepository repository;

  GetExpenses(this.repository);

  @override
  Future<ApiResult<List<ExpenseModel>>> call(GetExpensesParams params) async {
    return await repository.getExpenses(
      search: params.search,
      status: params.status,
      categoryId: params.categoryId,
      page: params.page,
      limit: params.limit,
      sortBy: params.sortBy,
      sortOrder: params.sortOrder,
    );
  }
}

class GetExpensesParams {
  final String? search;
  final String? status;
  final int? categoryId;
  final int? page;
  final int? limit;
  final String? sortBy;
  final String? sortOrder;

  const GetExpensesParams({
    this.search,
    this.status,
    this.categoryId,
    this.page,
    this.limit,
    this.sortBy,
    this.sortOrder,
  });
}
