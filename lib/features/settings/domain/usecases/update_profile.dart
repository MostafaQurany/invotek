import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/settings/data/models/profile_models.dart';
import 'package:invotek/features/settings/data/models/update_profile_request.dart';
import 'package:invotek/features/settings/domain/repositories/settings_repository.dart';

class UpdateProfile implements UseCase<ProfileResponse, UpdateProfileRequest> {
  final ISettingsRepository repository;

  UpdateProfile(this.repository);

  @override
  Future<ApiResult<ProfileResponse>> call(UpdateProfileRequest params) {
    return repository.updateProfile(params);
  }
}


