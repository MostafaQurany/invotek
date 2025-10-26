import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/services/storage_service.dart';
import 'package:invotek/features/auth/data/data_source/permissions_data_source.dart';
import 'package:invotek/features/auth/data/models/permission_models.dart';

class PermissionsRepo {
  final PermissionsDataSource dataSource;

  PermissionsRepo(this.dataSource);

  Future<ApiResult<UserPermissions>> fetchPermissions(int roleId) async {
    try {
      final response = await dataSource.getRolePermissions(roleId);

      response.when(
        success: (permissions) async {
          // حفظ الصلاحيات محلياً
          await StorageService.savePermissions(permissions);
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

  Future<UserPermissions?> getCachedPermissions() async {
    try {
      final permissions = StorageService.getPermissions();
      return permissions;
    } catch (e) {
      return null;
    }
  }

  Future<void> clearPermissions() async {
    try {
      await StorageService.removePermissions();
    } catch (e) {
      // تجاهل الأخطاء في الحذف
    }
  }

  /// تحميل صلاحيات كاملة للاختبار
  Future<ApiResult<UserPermissions>> loadFullPermissionsForTesting() async {
    try {
      // إنشاء صلاحيات كاملة
      final fullPermissions = UserPermissions.fullAccess();

      // حفظ الصلاحيات محلياً
      await StorageService.savePermissions(fullPermissions);

      return ApiResult.success(fullPermissions);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }
}
