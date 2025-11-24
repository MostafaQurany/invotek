import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/settings/data/models/company_settings_response.dart';
import 'package:invotek/features/settings/data/models/update_company_settings_request.dart';
import 'package:invotek/features/settings/domain/repositories/settings_repository.dart';

class UpdateCompanySettings
    implements UseCase<CompanySettingsResponse, UpdateCompanySettingsRequest> {
  final ISettingsRepository repository;

  UpdateCompanySettings(this.repository);

  @override
  Future<ApiResult<CompanySettingsResponse>> call(
    UpdateCompanySettingsRequest params,
  ) async {
    return await repository.updateCompanySettings(params);
  }
}
