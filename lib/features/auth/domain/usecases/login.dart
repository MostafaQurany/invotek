import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/auth/domain/repo/auth_repo.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/auth/data/models/login_request.dart';

class Login implements UseCase<UserModel, LoginRequest> {
  final AuthRepo repository;

  Login(this.repository);

  @override
  Future<ApiResult<UserModel>> call(LoginRequest params) async {
    return await repository.login(params);
  }
}
