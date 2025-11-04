import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/expenses/data/repository/expense_categories_repository.dart';
import 'package:invotek/features/expenses/domain/entit/expense_category_model.dart';

class GetExpenseCategories
    implements UseCase<List<ExpenseCategoryModel>, GetExpenseCategoriesParams> {
  final ExpenseCategoriesRepository repository;

  GetExpenseCategories(this.repository);

  @override
  Future<ApiResult<List<ExpenseCategoryModel>>> call(
    GetExpenseCategoriesParams params,
  ) async {
    return await repository.getExpenseCategories(
      search: params.search,
      status: params.status,
      page: params.page,
      limit: params.limit,
      sortBy: params.sortBy,
      sortOrder: params.sortOrder,
    );
  }
}

class GetExpenseCategoriesParams {
  final String? search;
  final String? status;
  final int? page;
  final int? limit;
  final String? sortBy;
  final String? sortOrder;

  const GetExpenseCategoriesParams({
    this.search,
    this.status,
    this.page,
    this.limit,
    this.sortBy,
    this.sortOrder,
  });
}
