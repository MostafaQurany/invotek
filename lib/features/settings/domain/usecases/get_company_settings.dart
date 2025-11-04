import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/settings/data/models/company_settings_response.dart';
import 'package:invotek/features/settings/domain/repositories/settings_repository.dart';

class GetCompanySettings implements UseCase<CompanySettingsResponse, NoParams> {
  final ISettingsRepository repository;

  GetCompanySettings(this.repository);

  @override
  Future<ApiResult<CompanySettingsResponse>> call(NoParams params) {
    return repository.getCompanySettings();
  }
}


