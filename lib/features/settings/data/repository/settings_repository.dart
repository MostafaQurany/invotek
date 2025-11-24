import 'dart:io';
import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/settings/data/data_source/settings_data_source.dart';
import 'package:invotek/features/settings/data/models/change_password_request.dart';
import 'package:invotek/features/settings/data/models/change_password_response.dart';
import 'package:invotek/features/settings/data/models/delete_account_request.dart';
import 'package:invotek/features/settings/data/models/delete_account_response.dart';
import 'package:invotek/features/settings/data/models/profile_models.dart';
import 'package:invotek/features/settings/data/models/update_profile_request.dart';
import 'package:invotek/features/settings/data/models/company_settings_response.dart';
import 'package:invotek/features/settings/data/models/update_company_settings_request.dart';

import 'package:invotek/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepository implements ISettingsRepository {
  final SettingsDataSource dataSource;

  SettingsRepository(this.dataSource);

  @override
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

  @override
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

  @override
  Future<ApiResult<ProfileResponse>> getProfile() async {
    try {
      final response = await dataSource.getProfile();
      return response;
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> updateProfile(
    UpdateProfileRequest request,
  ) async {
    try {
      final response = await dataSource.updateProfile(request);
      return response;
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  @override
  Future<ApiResult<ProfileResponse>> updateProfilePhoto(File photo) async {
    try {
      final response = await dataSource.updateProfilePhoto(photo);
      return response;
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  @override
  Future<ApiResult<CompanySettingsResponse>> getCompanySettings() async {
    try {
      final response = await dataSource.getCompanySettings();
      return response;
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  @override
  Future<ApiResult<CompanySettingsResponse>> updateCompanySettings(
    UpdateCompanySettingsRequest request,
  ) async {
    try {
      final response = await dataSource.updateCompanySettings(request);
      return response;
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }
}
