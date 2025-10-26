import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/users_and_permissions/data/repository/users_repository.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';

class GetUserById implements UseCase<User, int> {
  final UsersRepository repository;

  GetUserById(this.repository);

  @override
  Future<ApiResult<User>> call(int id) async {
    return await repository.getUserById(id);
  }
}
