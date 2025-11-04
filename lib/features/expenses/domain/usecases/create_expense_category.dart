import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/expenses/data/repository/expense_categories_repository.dart';
import 'package:invotek/features/expenses/domain/entit/expense_category_model.dart';

class CreateExpenseCategory
    implements UseCase<ExpenseCategoryModel, CreateExpenseCategoryParams> {
  final ExpenseCategoriesRepository repository;

  CreateExpenseCategory(this.repository);

  @override
  Future<ApiResult<ExpenseCategoryModel>> call(
    CreateExpenseCategoryParams params,
  ) async {
    return await repository.createExpenseCategory(
      name: params.name,
      description: params.description,
      status: params.status ?? 'active',
    );
  }
}

class CreateExpenseCategoryParams {
  final String name;
  final String? description;
  final String? status;

  const CreateExpenseCategoryParams({
    required this.name,
    this.description,
    this.status,
  });
}
