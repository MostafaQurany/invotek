import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/features/home/data/models/dashboard_models.dart';

class DashboardRepository {
  final ApiClient _apiClient;

  DashboardRepository(this._apiClient);

  Future<DashboardResponse> getDashboard() async {
    try {
      final response = await _apiClient.getDashboard();
      return response;
    } catch (e) {
      throw Exception('Failed to fetch dashboard data: $e');
    }
  }
}





