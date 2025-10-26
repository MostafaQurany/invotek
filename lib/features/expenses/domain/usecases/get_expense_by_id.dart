import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/expenses/data/repository/expenses_repository.dart';
import 'package:invotek/features/expenses/demo/entit/expense_model.dart';

class GetExpenseById implements UseCase<ExpenseModel, int> {
  final ExpensesRepository repository;

  GetExpenseById(this.repository);

  @override
  Future<ApiResult<ExpenseModel>> call(int id) async {
    return await repository.getExpenseById(id);
  }
}
