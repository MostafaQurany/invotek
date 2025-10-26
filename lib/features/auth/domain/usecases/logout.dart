import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/features/auth/domain/repo/auth_repo.dart';

class Logout implements UseCase<bool, NoParams> {
  final AuthRepo repository;

  Logout(this.repository);

  @override
  Future<ApiResult<bool>> call(NoParams params) async {
    try {
      await repository.logout();
      return ApiResult.success(true);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }
}
