import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/data/repository/users_repository.dart';
import 'package:invotek/features/users_and_permissions/data/models/requests/user_requests.dart';

class UpdateUser implements UseCase<User, UpdateUserParams> {
  final UsersRepository repository;

  UpdateUser(this.repository);

  @override
  Future<ApiResult<User>> call(UpdateUserParams params) async {
    return await repository.updateUser(
      id: params.id,
      name: params.name,
      email: params.email,
      phone: params.phone,
      role: params.role,
      status: params.status,
      address: params.address,
      notes: params.notes,
    );
  }
}

class UpdateUserParams {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String role;
  final String status;
  final String? address;
  final String? notes;

  UpdateUserParams({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.role,
    required this.status,
    this.address,
    this.notes,
  });
}
