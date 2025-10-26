import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/customers/data/repository/customers_repository.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';

class CreateCustomer implements UseCase<CustomerModel, CreateCustomerParams> {
  final CustomersRepository repository;

  CreateCustomer(this.repository);

  @override
  Future<ApiResult<CustomerModel>> call(CreateCustomerParams params) async {
    return await repository.createCustomer(
      name: params.name,
      email: params.email,
      phone: params.phone,
      address: params.address,
      taxNumber: params.taxNumber,
      notes: params.notes,
      status: params.status,
      companyName: params.companyName,
      commercialRegister: params.commercialRegister,
      city: params.city,
      region: params.region,
      postalCode: params.postalCode,
      detailedAddress: params.detailedAddress,
      responsiblePerson: params.responsiblePerson,
    );
  }
}

class CreateCustomerParams {
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? taxNumber;
  final String? notes;
  final String status;
  final String? companyName;
  final String? commercialRegister;
  final String? city;
  final String? region;
  final String? postalCode;
  final String? detailedAddress;
  final String? responsiblePerson;

  const CreateCustomerParams({
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.taxNumber,
    this.notes,
    this.status = 'active',
    this.companyName,
    this.commercialRegister,
    this.city,
    this.region,
    this.postalCode,
    this.detailedAddress,
    this.responsiblePerson,
  });
}
