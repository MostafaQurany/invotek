import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/auth/domain/repo/auth_repo.dart';
import 'package:invotek/features/auth/data/models/reset_password_request.dart';
import 'package:invotek/features/auth/data/models/reset_password_response.dart';

class ResetPassword
    implements UseCase<ResetPasswordResponse, ResetPasswordRequest> {
  final AuthRepo repository;

  ResetPassword(this.repository);

  @override
  Future<ApiResult<ResetPasswordResponse>> call(
    ResetPasswordRequest params,
  ) async {
    return await repository.resetPassword(params);
  }
}
