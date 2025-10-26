import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/customers/data/repository/customers_repository.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';

class UpdateCustomer implements UseCase<CustomerModel, UpdateCustomerParams> {
  final CustomersRepository repository;

  UpdateCustomer(this.repository);

  @override
  Future<ApiResult<CustomerModel>> call(UpdateCustomerParams params) async {
    return await repository.updateCustomer(
      id: params.id,
      name: params.name,
      email: params.email,
      phone: params.phone,
      address: params.address,
      taxNumber: params.taxNumber,
      notes: params.notes,
      status: params.status,
    );
  }
}

class UpdateCustomerParams {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? taxNumber;
  final String? notes;
  final String status;

  const UpdateCustomerParams({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.taxNumber,
    this.notes,
    this.status = 'active',
  });
}
