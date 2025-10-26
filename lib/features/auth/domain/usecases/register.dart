import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/auth/domain/repo/auth_repo.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/auth/data/models/register_request.dart';

class Register implements UseCase<UserModel, RegisterRequest> {
  final AuthRepo repository;

  Register(this.repository);

  @override
  Future<ApiResult<UserModel>> call(RegisterRequest params) async {
    return await repository.register(params);
  }
}
