import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/notifications/data/datasources/notifications_data_source.dart';
import 'package:invotek/features/notifications/data/models/notification_api_model.dart';
import 'package:invotek/features/notifications/data/models/pagination_result.dart';
import 'package:invotek/features/notifications/data/models/response/get_notification_stats_response.dart';
import 'package:invotek/features/notifications/domain/entities/notification_entity.dart';
import 'package:invotek/features/notifications/domain/repositories/notifications_repository.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsDataSource _dataSource;

  NotificationsRepositoryImpl(this._dataSource);

  @override
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
  }) async {
    final result = await _dataSource.getNotifications(
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

    return result.when(
      success: (response) {
        final paginationResult =
            NotificationsPaginationResult.fromResponse(response);
        return ApiResult.success(paginationResult);
      },
      failure: (failure) => ApiResult.failure(failure),
    );
  }

  @override
  Future<ApiResult<GetNotificationStatsResponse>> getNotificationStats() async {
    return await _dataSource.getNotificationStats();
  }

  @override
  Future<ApiResult<NotificationEntity>> getNotificationById(int id) async {
    final result = await _dataSource.getNotificationById(id);

    return result.when(
      success: (notificationApiModel) {
        final entity = _convertToEntity(notificationApiModel);
        return ApiResult.success(entity);
      },
      failure: (failure) => ApiResult.failure(failure),
    );
  }

  @override
  Future<ApiResult<bool>> markNotificationAsRead(int id) async {
    return await _dataSource.markNotificationAsRead(id);
  }

  @override
  Future<ApiResult<bool>> markAllNotificationsAsRead() async {
    return await _dataSource.markAllNotificationsAsRead();
  }

  @override
  Future<ApiResult<bool>> deleteNotification(int id) async {
    return await _dataSource.deleteNotification(id);
  }

  @override
  Future<ApiResult<bool>> clearReadNotifications() async {
    return await _dataSource.clearReadNotifications();
  }

  NotificationEntity _convertToEntity(NotificationApiModel apiModel) {
    return NotificationEntity(
      id: apiModel.id,
      title: apiModel.title ?? '',
      message: apiModel.message ?? '',
      type: apiModel.type ?? 'system',
      isRead: apiModel.isRead ?? false,
      createdAt: apiModel.createdAt,
      updatedAt: apiModel.updatedAt,
      data: apiModel.data,
    );
  }
}

