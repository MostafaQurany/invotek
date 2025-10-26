import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/expenses/data/repository/expense_categories_repository.dart';

class DeleteExpenseCategory implements UseCase<bool, int> {
  final ExpenseCategoriesRepository repository;

  DeleteExpenseCategory(this.repository);

  @override
  Future<ApiResult<bool>> call(int id) async {
    return await repository.deleteExpenseCategory(id);
  }
}
