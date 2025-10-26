import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/features/home/data/models/dashboard_models.dart';

class DashboardRepository {
  final ApiClient _apiClient;

  DashboardRepository(this._apiClient);

  Future<ApiResult<DashboardData>> getDashboard() async {
    try {
      final response = await _apiClient.getDashboard();
      
      if (response.success) {
        return ApiResult.success(response.data);
      } else {
        return ApiResult.failure(
          ApiErrorHandler.handleError(Exception('Failed to load dashboard data')),
        );
      }
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }
}





