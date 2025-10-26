import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/users_and_permissions/data/repository/users_repository.dart';

class DeleteUser implements UseCase<bool, int> {
  final UsersRepository repository;

  DeleteUser(this.repository);

  @override
  Future<ApiResult<bool>> call(int id) async {
    final result = await repository.deleteUser(id);
    return result.when(
      success: (_) => ApiResult.success(true),
      failure: (failure) => ApiResult.failure(failure),
    );
  }
}
