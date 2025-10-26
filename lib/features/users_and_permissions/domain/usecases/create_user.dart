import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/users_and_permissions/data/repository/users_repository.dart';
import 'package:invotek/features/users_and_permissions/data/models/requests/user_requests.dart';

class CreateUser implements UseCase<void, CreateUserRequest> {
  final UsersRepository repository;

  CreateUser(this.repository);

  @override
  Future<ApiResult<void>> call(CreateUserRequest params) async {
    return await repository.createUser(
      name: params.name,
      email: params.email,
      password: params.password,
      phone: params.phone,
      role: params.role,
      status: params.status,
      address: params.address,
      notes: params.notes,
    );
  }
}
