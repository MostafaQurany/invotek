import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/features/auth/data/models/permission_models.dart';

class PermissionsDataSource {
  final ApiClient apiClient;

  PermissionsDataSource(this.apiClient);

  Future<ApiResult<UserPermissions>> getRolePermissions(int roleId) async {
    try {
      final response = await apiClient.getRolePermissions(roleId);

      if (!response.success) {
        return ApiResult.failure(Failure.server(message: 'فشل في جلب الصلاحيات'));
      }

      // تحويل الاستجابة إلى UserPermissions
      final userPermissions = UserPermissions(permissions: response.data);

      return ApiResult.success(userPermissions);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }
}
