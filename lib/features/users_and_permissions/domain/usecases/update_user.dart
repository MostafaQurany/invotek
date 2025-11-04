import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/data/repository/users_repository.dart';

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
      position: params.position,
      status: params.status,
    );
  }
}

class UpdateUserParams {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? position;
  final String status;

  UpdateUserParams({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.position,
    required this.status,
  });
}
