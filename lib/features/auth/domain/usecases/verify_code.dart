import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/auth/domain/repo/auth_repo.dart';
import 'package:invotek/features/auth/data/models/verify_code_request.dart';
import 'package:invotek/features/auth/data/models/verify_code_response.dart';

class VerifyCode implements UseCase<VerifyCodeResponse, VerifyCodeRequest> {
  final AuthRepo repository;

  VerifyCode(this.repository);

  @override
  Future<ApiResult<VerifyCodeResponse>> call(VerifyCodeRequest params) async {
    return await repository.verifyCode(params);
  }
}
