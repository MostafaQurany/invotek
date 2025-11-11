import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/notifications/domain/entities/notification_entity.dart';
import 'package:invotek/features/notifications/data/models/pagination_result.dart';
import 'package:invotek/features/notifications/data/models/response/get_notification_stats_response.dart';

abstract class NotificationsRepository {
  Future<ApiResult<NotificationsPaginationResult>> getNotifications({
    String? search,
    String? type,
    bool? isRead,
    String? dateFrom,
    String? dateTo,
    int? perPage,
    String? sortBy,
    String? sortOrder,
    int? page,
  });

  Future<ApiResult<GetNotificationStatsResponse>> getNotificationStats();

  Future<ApiResult<NotificationEntity>> getNotificationById(int id);

  Future<ApiResult<bool>> markNotificationAsRead(int id);

  Future<ApiResult<bool>> markAllNotificationsAsRead();

  Future<ApiResult<bool>> deleteNotification(int id);

  Future<ApiResult<bool>> clearReadNotifications();
}


