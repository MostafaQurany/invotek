import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/settings/data/models/change_password_request.dart';
import 'package:invotek/features/settings/data/models/change_password_response.dart';
import 'package:invotek/features/settings/domain/repositories/settings_repository.dart';

class ChangePassword implements UseCase<ChangePasswordResponse, ChangePasswordRequest> {
  final ISettingsRepository repository;

  ChangePassword(this.repository);

  @override
  Future<ApiResult<ChangePasswordResponse>> call(ChangePasswordRequest params) {
    return repository.changePassword(params);
  }
}


