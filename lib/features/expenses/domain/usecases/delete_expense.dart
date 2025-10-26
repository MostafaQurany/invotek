import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/expenses/data/repository/expenses_repository.dart';

class DeleteExpense implements UseCase<bool, int> {
  final ExpensesRepository repository;

  DeleteExpense(this.repository);

  @override
  Future<ApiResult<bool>> call(int id) async {
    return await repository.deleteExpense(id);
  }
}
