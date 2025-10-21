import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/core/services/storage_service.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/auth/data/data_source/auth_data_source.dart';
import 'package:invotek/features/auth/data/models/login_request.dart';
import 'package:invotek/features/auth/data/models/register_request.dart';
import 'package:invotek/features/auth/demo/entit/user_model.dart';

class AuthRepo {
  final AuthDataSource dataSource;
  AuthRepo(this.dataSource);

  Future<ApiResult<UserModel>> login(LoginRequest request) async {
    try {
      final startTime = DateTime.now();

      final response = await dataSource.login(request);

      final duration = DateTime.now().difference(startTime);

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

  Future<ApiResult<UserModel>> register(RegisterRequest request) async {
    try {
      final startTime = DateTime.now();

      final response = await dataSource.register(request);

      final duration = DateTime.now().difference(startTime);

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
    } catch (_) {}
  }
}
