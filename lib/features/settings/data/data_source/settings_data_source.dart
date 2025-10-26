import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/features/settings/data/models/change_password_request.dart';
import 'package:invotek/features/settings/data/models/change_password_response.dart';
import 'package:invotek/features/settings/data/models/delete_account_request.dart';
import 'package:invotek/features/settings/data/models/delete_account_response.dart';

class SettingsDataSource {
  final ApiClient apiClient;

  SettingsDataSource(this.apiClient);

  Future<ApiResult<ChangePasswordResponse>> changePassword(
    ChangePasswordRequest request,
  ) async {
    try {
      final response = await apiClient.changePassword(request);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<DeleteAccountResponse>> deleteAccount(
    DeleteAccountRequest request,
  ) async {
    try {
      final response = await apiClient.deleteAccount(request);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }
}
