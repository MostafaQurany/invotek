import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/features/notifications/data/models/response/get_notification_stats_response.dart';
import 'package:invotek/features/notifications/domain/entities/notification_entity.dart';

part 'notifications_state.freezed.dart';

@freezed
sealed class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial({
    @Default([]) List<NotificationEntity> notifications,
    NotificationEntity? selectedNotification,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    GetNotificationStatsResponse? stats,
    Failure? error,
  }) = _Initial;

  const factory NotificationsState.loading({
    @Default([]) List<NotificationEntity> notifications,
    NotificationEntity? selectedNotification,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    GetNotificationStatsResponse? stats,
    String? message,
  }) = _LoadingNotifications;

  const factory NotificationsState.loaded({
    required List<NotificationEntity> notifications,
    NotificationEntity? selectedNotification,
    required int currentPage,
    required int totalPages,
    GetNotificationStatsResponse? stats,
  }) = _LoadedNotifications;

  const factory NotificationsState.statsLoaded({
    required List<NotificationEntity> notifications,
    NotificationEntity? selectedNotification,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    required GetNotificationStatsResponse stats,
  }) = _StatsLoadedNotifications;

  const factory NotificationsState.markAsReadSuccess({
    required List<NotificationEntity> notifications,
    required int notificationId,
    NotificationEntity? selectedNotification,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    GetNotificationStatsResponse? stats,
  }) = _MarkAsReadSuccessNotifications;

  const factory NotificationsState.markAllAsReadSuccess({
    required List<NotificationEntity> notifications,
    NotificationEntity? selectedNotification,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    GetNotificationStatsResponse? stats,
  }) = _MarkAllAsReadSuccessNotifications;

  const factory NotificationsState.deleteSuccess({
    required List<NotificationEntity> notifications,
    required int deletedId,
    NotificationEntity? selectedNotification,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    GetNotificationStatsResponse? stats,
  }) = _DeleteSuccessNotifications;

  const factory NotificationsState.clearReadSuccess({
    required List<NotificationEntity> notifications,
    NotificationEntity? selectedNotification,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    GetNotificationStatsResponse? stats,
  }) = _ClearReadSuccessNotifications;

  const factory NotificationsState.failure({
    @Default([]) List<NotificationEntity> notifications,
    NotificationEntity? selectedNotification,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    GetNotificationStatsResponse? stats,
    required Failure failure,
  }) = _FailureNotifications;
}


