import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/expenses/data/repository/expense_categories_repository.dart';
import 'package:invotek/features/expenses/domain/entit/expense_category_model.dart';

class UpdateExpenseCategory
    implements UseCase<ExpenseCategoryModel, UpdateExpenseCategoryParams> {
  final ExpenseCategoriesRepository repository;

  UpdateExpenseCategory(this.repository);

  @override
  Future<ApiResult<ExpenseCategoryModel>> call(
    UpdateExpenseCategoryParams params,
  ) async {
    return await repository.updateExpenseCategory(
      id: params.id,
      name: params.name,
      description: params.description,
      status: params.status,
    );
  }
}

class UpdateExpenseCategoryParams {
  final int id;
  final String name;
  final String? description;
  final String? status;

  const UpdateExpenseCategoryParams({
    required this.id,
    required this.name,
    this.description,
    this.status,
  });
}
