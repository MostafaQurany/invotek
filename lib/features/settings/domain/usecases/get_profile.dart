import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/settings/data/models/profile_models.dart';
import 'package:invotek/features/settings/domain/repositories/settings_repository.dart';

class GetProfile implements UseCase<ProfileResponse, NoParams> {
  final ISettingsRepository repository;

  GetProfile(this.repository);

  @override
  Future<ApiResult<ProfileResponse>> call(NoParams params) {
    return repository.getProfile();
  }
}


