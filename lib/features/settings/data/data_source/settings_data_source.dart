import 'dart:io';
import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/features/settings/data/models/change_password_request.dart';
import 'package:invotek/features/settings/data/models/change_password_response.dart';
import 'package:invotek/features/settings/data/models/delete_account_request.dart';
import 'package:invotek/features/settings/data/models/delete_account_response.dart';
import 'package:invotek/features/settings/data/models/profile_models.dart';
import 'package:invotek/features/settings/data/models/update_profile_request.dart';
import 'package:invotek/features/settings/data/models/company_settings_response.dart';
import 'package:invotek/features/settings/data/models/update_company_settings_request.dart';

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

  Future<ApiResult<ProfileResponse>> getProfile() async {
    try {
      final response = await apiClient.getProfile();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<ProfileResponse>> updateProfile(
    UpdateProfileRequest request,
  ) async {
    try {
      final response = await apiClient.updateProfile(request);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<ProfileResponse>> updateProfilePhoto(File photo) async {
    try {
      final response = await apiClient.updateProfilePhoto(photo);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<CompanySettingsResponse>> getCompanySettings() async {
    try {
      final response = await apiClient.getCompanySettings();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<CompanySettingsResponse>> updateCompanySettings(
    UpdateCompanySettingsRequest request,
  ) async {
    try {
      final response = await apiClient.updateCompanySettings(request);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }
}
