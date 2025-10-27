import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/customers/data/repository/customers_repository.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';

class GetCustomerById implements UseCase<CustomerModel, int> {
  final CustomersRepository repository;

  GetCustomerById(this.repository);

  @override
  Future<ApiResult<CustomerModel>> call(int id) async {
    return await repository.getCustomerById(id);
  }
}
