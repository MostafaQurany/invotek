import 'dart:io';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/settings/data/models/profile_models.dart';
import 'package:invotek/features/settings/domain/repositories/settings_repository.dart';

class UpdatePhoto implements UseCase<ProfileResponse, File> {
  final ISettingsRepository repository;

  UpdatePhoto(this.repository);

  @override
  Future<ApiResult<ProfileResponse>> call(File params) {
    return repository.updateProfilePhoto(params);
  }
}


