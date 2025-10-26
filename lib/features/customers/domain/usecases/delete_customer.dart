import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/customers/data/repository/customers_repository.dart';

class DeleteCustomer implements UseCase<bool, int> {
  final CustomersRepository repository;

  DeleteCustomer(this.repository);

  @override
  Future<ApiResult<bool>> call(int id) async {
    return await repository.deleteCustomer(id);
  }
}
