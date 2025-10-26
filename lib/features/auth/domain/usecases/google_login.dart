import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/auth/domain/repo/auth_repo.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/auth/data/models/google_login_request.dart';

class GoogleLogin implements UseCase<UserModel, GoogleLoginRequest> {
  final AuthRepo repository;

  GoogleLogin(this.repository);

  @override
  Future<ApiResult<UserModel>> call(GoogleLoginRequest params) async {
    return await repository.googleLogin(params);
  }
}
