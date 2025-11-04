import 'dart:io';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/settings/data/models/change_password_request.dart';
import 'package:invotek/features/settings/data/models/change_password_response.dart';
import 'package:invotek/features/settings/data/models/company_settings_response.dart';
import 'package:invotek/features/settings/data/models/delete_account_request.dart';
import 'package:invotek/features/settings/data/models/delete_account_response.dart';
import 'package:invotek/features/settings/data/models/profile_models.dart';
import 'package:invotek/features/settings/data/models/update_profile_request.dart';

abstract class ISettingsRepository {
  Future<ApiResult<ProfileResponse>> getProfile();
  Future<ApiResult<ProfileResponse>> updateProfile(UpdateProfileRequest request);
  Future<ApiResult<ProfileResponse>> updateProfilePhoto(File photo);
  Future<ApiResult<ChangePasswordResponse>> changePassword(
      ChangePasswordRequest request);
  Future<ApiResult<DeleteAccountResponse>> deleteAccount(
      DeleteAccountRequest request);
  Future<ApiResult<CompanySettingsResponse>> getCompanySettings();
}


