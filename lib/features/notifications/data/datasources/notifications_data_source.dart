import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/notifications/data/models/notification_api_model.dart';
import 'package:invotek/features/notifications/data/models/response/get_all_notifications_response.dart';
import 'package:invotek/features/notifications/data/models/response/get_notification_stats_response.dart';
import 'package:invotek/features/notifications/data/models/response/get_single_notification_response.dart';

class NotificationsDataSource {
  final ApiClient _apiClient;

  NotificationsDataSource(this._apiClient);

  Future<ApiResult<GetAllNotificationsResponse>> getNotifications({
    String? search,
    String? type,
    bool? isRead,
    String? dateFrom,
    String? dateTo,
    int? perPage,
    String? sortBy,
    String? sortOrder,
    int? page,
  }) async {
    try {
      final response = await _apiClient.getNotifications(
        search: search,
        type: type,
        isRead: isRead,
        dateFrom: dateFrom,
        dateTo: dateTo,
        perPage: perPage,
        sortBy: sortBy,
        sortOrder: sortOrder,
        page: page,
      );

      if (response is Map<String, dynamic>) {
        final notificationsResponse =
            GetAllNotificationsResponse.fromJson(response);
        return ApiResult.success(notificationsResponse);
      }

      return ApiResult.failure(
        ApiErrorHandler.handleError('Invalid response format'),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<GetNotificationStatsResponse>> getNotificationStats() async {
    try {
      final response = await _apiClient.getNotificationStats();

      if (response is Map<String, dynamic>) {
        // Handle both direct data and wrapped in 'data' key
        final data = response['data'] ?? response;
        final statsResponse = GetNotificationStatsResponse.fromJson(
          data is Map<String, dynamic> ? data : {},
        );
        return ApiResult.success(statsResponse);
      }

      return ApiResult.failure(
        ApiErrorHandler.handleError('Invalid response format'),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<NotificationApiModel>> getNotificationById(int id) async {
    try {
      final response = await _apiClient.getNotificationById(id);

      if (response is Map<String, dynamic>) {
        // Handle both direct data and wrapped in 'data' key
        final data = response['data'] ?? response;
        final notificationResponse = GetSingleNotificationResponse.fromJson(
          data is Map<String, dynamic> ? data : response,
        );

        if (notificationResponse.data != null) {
          return ApiResult.success(notificationResponse.data!);
        }

        // If data is null, try to parse directly as NotificationApiModel
        final notification = NotificationApiModel.fromJson(
          data is Map<String, dynamic> ? data : response,
        );
        return ApiResult.success(notification);
      }

      return ApiResult.failure(
        ApiErrorHandler.handleError('Invalid response format'),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<bool>> markNotificationAsRead(int id) async {
    try {
      await _apiClient.markNotificationAsRead(id);
      return const ApiResult.success(true);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<bool>> markAllNotificationsAsRead() async {
    try {
      await _apiClient.markAllNotificationsAsRead();
      return const ApiResult.success(true);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<bool>> deleteNotification(int id) async {
    try {
      await _apiClient.deleteNotification(id);
      return const ApiResult.success(true);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<bool>> clearReadNotifications() async {
    try {
      await _apiClient.clearReadNotifications();
      return const ApiResult.success(true);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }
}


