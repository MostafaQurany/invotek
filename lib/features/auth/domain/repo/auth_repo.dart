import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/core/services/storage_service.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/auth/data/data_source/auth_data_source.dart';
import 'package:invotek/features/auth/data/models/login_request.dart';
import 'package:invotek/features/auth/data/models/register_request.dart';
import 'package:invotek/features/auth/data/models/google_login_request.dart';
import 'package:invotek/features/auth/data/models/forget_password_request.dart';
import 'package:invotek/features/auth/data/models/forget_password_respond.dart';
import 'package:invotek/features/auth/data/models/verify_code_request.dart';
import 'package:invotek/features/auth/data/models/verify_code_response.dart';
import 'package:invotek/features/auth/data/models/reset_password_request.dart';
import 'package:invotek/features/auth/data/models/reset_password_response.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/auth/domain/repo/permissions_repo.dart';

class AuthRepo {
  final AuthDataSource dataSource;
  final PermissionsRepo permissionsRepo;

  AuthRepo(this.dataSource, this.permissionsRepo);

  Future<ApiResult<UserModel>> login(LoginRequest request) async {
    try {
      final response = await dataSource.login(request);

      response.when(
        success: (userModel) async {
          // حفظ بيانات المستخدم محلياً
          StorageService.saveUserData(userModel);
          StorageService.saveToken(userModel.token!);
          StorageService.saveBool('is_logged_in', true);
          StorageService.saveString(
            'last_sync',
            DateTime.now().toIso8601String(),
          );

          // جلب الصلاحيات إذا كان roleId متوفر
          if (userModel.roleId != null) {
            await _loadUserPermissions(userModel.roleId!);
          }
        },
        failure: (errorHandler) {
          return ApiResult.failure(errorHandler);
        },
      );
      return response;
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<UserModel>> register(RegisterRequest request) async {
    try {
      final response = await dataSource.register(request);

      response.when(
        success: (userModel) async {
          // حفظ بيانات المستخدم محلياً
          StorageService.saveUserData(userModel);
          StorageService.saveToken(userModel.token!);

          StorageService.saveBool('is_logged_in', true);
          StorageService.saveString(
            'last_sync',
            DateTime.now().toIso8601String(),
          );

          // جلب الصلاحيات إذا كان roleId متوفر
          if (userModel.roleId != null) {
            await _loadUserPermissions(userModel.roleId!);
          }
        },
        failure: (errorHandler) {},
      );

      return response;
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<UserModel?> getCachedUser() async {
    try {
      final userData = StorageService.getUserData();
      if (userData != null) {
        return userData;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> isUserLoggedIn() async {
    return StorageService.getBool('is_logged_in') ?? false;
  }

  Future<void> logout() async {
    try {
      // Inform server (ignore failures, still clear local state)
      await dataSource.apiClient.logout();
    } catch (_) {}

    try {
      StorageService.removeUserData();
      StorageService.removeToken();
      StorageService.removeString('is_logged_in');
      StorageService.removePermissions();
    } catch (_) {}
  }

  /// جلب صلاحيات المستخدم
  Future<void> _loadUserPermissions(int roleId) async {
    try {
      await permissionsRepo.fetchPermissions(roleId);
    } catch (e) {
      // تجاهل الأخطاء في جلب الصلاحيات
      print('خطأ في جلب الصلاحيات: $e');
    }
  }

  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest request,
  ) async {
    try {
      final response = await dataSource.forgetPassword(request);
      return response;
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<VerifyCodeResponse>> verifyCode(
    VerifyCodeRequest request,
  ) async {
    try {
      final response = await dataSource.verifyCode(request);
      return response;
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest request,
  ) async {
    try {
      final response = await dataSource.resetPassword(request);
      return response;
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<UserModel>> googleLogin(GoogleLoginRequest request) async {
    try {
      final response = await dataSource.googleLogin(request);

      response.when(
        success: (userModel) async {
          // حفظ بيانات المستخدم محلياً
          StorageService.saveUserData(userModel);
          StorageService.saveToken(userModel.token!);
          StorageService.saveBool('is_logged_in', true);
          StorageService.saveString(
            'last_sync',
            DateTime.now().toIso8601String(),
          );
        },
        failure: (errorHandler) {
          return ApiResult.failure(errorHandler);
        },
      );
      return response;
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }
}
