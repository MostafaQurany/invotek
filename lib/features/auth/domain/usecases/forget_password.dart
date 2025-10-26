import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/auth/domain/repo/auth_repo.dart';
import 'package:invotek/features/auth/data/models/forget_password_request.dart';
import 'package:invotek/features/auth/data/models/forget_password_respond.dart';

class ForgetPassword
    implements UseCase<ForgetPasswordResponse, ForgetPasswordRequest> {
  final AuthRepo repository;

  ForgetPassword(this.repository);

  @override
  Future<ApiResult<ForgetPasswordResponse>> call(
    ForgetPasswordRequest params,
  ) async {
    return await repository.forgetPassword(params);
  }
}
