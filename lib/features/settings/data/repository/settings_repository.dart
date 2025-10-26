import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/settings/data/data_source/settings_data_source.dart';
import 'package:invotek/features/settings/data/models/change_password_request.dart';
import 'package:invotek/features/settings/data/models/change_password_response.dart';
import 'package:invotek/features/settings/data/models/delete_account_request.dart';
import 'package:invotek/features/settings/data/models/delete_account_response.dart';

class SettingsRepository {
  final SettingsDataSource dataSource;

  SettingsRepository(this.dataSource);

  Future<ApiResult<ChangePasswordResponse>> changePassword(
    ChangePasswordRequest request,
  ) async {
    try {
      final response = await dataSource.changePassword(request);
      return response;
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<DeleteAccountResponse>> deleteAccount(
    DeleteAccountRequest request,
  ) async {
    try {
      final response = await dataSource.deleteAccount(request);
      return response;
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }
}
