import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/services/local_notification_service.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/notifications/data/models/notification_api_model.dart';
import 'package:invotek/features/notifications/data/models/response/get_notification_stats_response.dart';
import 'package:invotek/features/notifications/domain/entities/notification_entity.dart';
import 'package:invotek/features/notifications/domain/usecases/clear_read_notifications_usecase.dart';
import 'package:invotek/features/notifications/domain/usecases/delete_notification_usecase.dart';
import 'package:invotek/features/notifications/domain/usecases/get_all_notifications_usecase.dart';
import 'package:invotek/features/notifications/domain/usecases/get_notification_stats_usecase.dart';
import 'package:invotek/features/notifications/domain/usecases/get_single_notification_usecase.dart';
import 'package:invotek/features/notifications/domain/usecases/mark_all_notifications_as_read_usecase.dart';
import 'package:invotek/features/notifications/domain/usecases/mark_notification_as_read_usecase.dart';
import 'package:invotek/features/notifications/ui/cubit/notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final GetAllNotificationsUseCase _getAllNotifications;
  final GetNotificationStatsUseCase _getNotificationStats;
  final GetSingleNotificationUseCase _getSingleNotification;
  final MarkNotificationAsReadUseCase _markNotificationAsRead;
  final MarkAllNotificationsAsReadUseCase _markAllNotificationsAsRead;
  final DeleteNotificationUseCase _deleteNotification;
  final ClearReadNotificationsUseCase _clearReadNotifications;

  static NotificationsCubit get(context) => BlocProvider.of(context);

  List<NotificationEntity> _notifications = <NotificationEntity>[];
  int _currentPage = 1;
  int _totalPages = 1;
  String? _lastSearch;
  String? _lastType;
  bool? _lastIsRead;
  String? _lastDateFrom;
  String? _lastDateTo;
  String? _lastSortBy;
  String? _lastSortOrder;
  final int _pageSize = 20;
  bool _isLoadingPage = false;
  GetNotificationStatsResponse? _lastStats;
  Timer? _pollingTimer;
  bool _isLoadingStats = false;
  DateTime? _lastStatsLoadTime;
  static const Duration _statsCacheDuration = Duration(minutes: 1);

  NotificationsCubit({
    required GetAllNotificationsUseCase getAllNotifications,
    required GetNotificationStatsUseCase getNotificationStats,
    required GetSingleNotificationUseCase getSingleNotification,
    required MarkNotificationAsReadUseCase markNotificationAsRead,
    required MarkAllNotificationsAsReadUseCase markAllNotificationsAsRead,
    required DeleteNotificationUseCase deleteNotification,
    required ClearReadNotificationsUseCase clearReadNotifications,
  }) : _getAllNotifications = getAllNotifications,
       _getNotificationStats = getNotificationStats,
       _getSingleNotification = getSingleNotification,
       _markNotificationAsRead = markNotificationAsRead,
       _markAllNotificationsAsRead = markAllNotificationsAsRead,
       _deleteNotification = deleteNotification,
       _clearReadNotifications = clearReadNotifications,
       super(const NotificationsState.initial()) {
    _startPolling();
  }

  void _startPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = Timer.periodic(
      const Duration(minutes: 2),
      (_) => _checkForNewNotifications(),
    );
  }

  Future<void> _checkForNewNotifications() async {
    await loadNotificationStats(forceRefresh: false);
  }

  Future<void> loadNotifications({
    bool isRefresh = false,
    String? search,
    String? type,
    bool? isRead,
    String? dateFrom,
    String? dateTo,
    String? sortBy,
    String? sortOrder,
  }) async {
    if (_isLoadingPage) return;

    if (isRefresh) {
      _currentPage = 1;
      _notifications.clear();
    }

    _isLoadingPage = true;
    _lastSearch = search;
    _lastType = type;
    _lastIsRead = isRead;
    _lastDateFrom = dateFrom;
    _lastDateTo = dateTo;
    _lastSortBy = sortBy ?? 'created_at';
    _lastSortOrder = sortOrder ?? 'desc';

    emit(
      NotificationsState.loading(
        notifications: _notifications,
        currentPage: _currentPage,
        totalPages: _totalPages,
        stats: _lastStats,
      ),
    );

    final result = await _getAllNotifications(
      GetAllNotificationsParams(
        search: search,
        type: type,
        isRead: isRead,
        dateFrom: dateFrom,
        dateTo: dateTo,
        perPage: _pageSize,
        sortBy: _lastSortBy,
        sortOrder: _lastSortOrder,
        page: _currentPage,
      ),
    );

    result.when(
      success: (paginationResult) {
        if (isRefresh) {
          _notifications.clear();
        }
        final newNotifications = paginationResult.notifications
            .map((n) => _convertToEntity(n))
            .toList();
        _notifications.addAll(newNotifications);
        _currentPage = paginationResult.currentPage;
        _totalPages = paginationResult.totalPages;
        _isLoadingPage = false;

        emit(
          NotificationsState.loaded(
            notifications: _notifications,
            currentPage: _currentPage,
            totalPages: _totalPages,
            stats: _lastStats,
          ),
        );
      },
      failure: (failure) {
        _isLoadingPage = false;
        emit(
          NotificationsState.failure(
            notifications: _notifications,
            currentPage: _currentPage,
            totalPages: _totalPages,
            stats: _lastStats,
            failure: failure,
          ),
        );
      },
    );
  }

  Future<void> loadMoreNotifications() async {
    if (_isLoadingPage || _currentPage >= _totalPages) return;

    _currentPage++;
    await loadNotifications(
      search: _lastSearch,
      type: _lastType,
      isRead: _lastIsRead,
      dateFrom: _lastDateFrom,
      dateTo: _lastDateTo,
      sortBy: _lastSortBy,
      sortOrder: _lastSortOrder,
    );
  }

  Future<void> refreshNotifications() async {
    await loadNotifications(
      isRefresh: true,
      search: _lastSearch,
      type: _lastType,
      isRead: _lastIsRead,
      dateFrom: _lastDateFrom,
      dateTo: _lastDateTo,
      sortBy: _lastSortBy,
      sortOrder: _lastSortOrder,
    );
  }

  Future<void> loadNotificationStats({bool forceRefresh = false}) async {
    // منع الاستدعاءات المتكررة
    if (_isLoadingStats) return;

    // استخدام cache إذا لم يمر وقت كافٍ
    if (!forceRefresh &&
        _lastStatsLoadTime != null &&
        DateTime.now().difference(_lastStatsLoadTime!) < _statsCacheDuration) {
      return;
    }

    _isLoadingStats = true;
    final result = await _getNotificationStats(const NoParams());
    _isLoadingStats = false;
    _lastStatsLoadTime = DateTime.now();

    result.when(
      success: (stats) async {
        if (_lastStats != null) {
          final oldUnread = _lastStats!.unread ?? 0;
          final newUnread = stats.unread ?? 0;
          if (newUnread > oldUnread) {
            // New notifications detected
            final newCount = newUnread - oldUnread;
            _lastStats = stats;

            // Show local notification
            try {
              final notificationService = getIt<LocalNotificationService>();
              final localizationCubit = getIt<LocalizationCubit>();
              final locale = localizationCubit.state.locale;
              await notificationService.showNewNotificationsNotification(
                count: newCount,
                locale: locale,
              );
            } catch (e) {
              // Silently fail if notification service is not available
            }
          } else {
            _lastStats = stats;
          }
        } else {
          _lastStats = stats;
        }

        emit(
          NotificationsState.statsLoaded(
            notifications: _notifications,
            currentPage: _currentPage,
            totalPages: _totalPages,
            stats: stats,
          ),
        );
      },
      failure: (failure) {
        emit(
          NotificationsState.failure(
            notifications: _notifications,
            currentPage: _currentPage,
            totalPages: _totalPages,
            stats: _lastStats,
            failure: failure,
          ),
        );
      },
    );
  }

  Future<void> getNotificationById(int id) async {
    final result = await _getSingleNotification(
      GetSingleNotificationParams(id: id),
    );

    result.when(
      success: (notification) {
        emit(
          NotificationsState.loaded(
            notifications: _notifications,
            selectedNotification: notification,
            currentPage: _currentPage,
            totalPages: _totalPages,
            stats: _lastStats,
          ),
        );
      },
      failure: (failure) {
        emit(
          NotificationsState.failure(
            notifications: _notifications,
            currentPage: _currentPage,
            totalPages: _totalPages,
            stats: _lastStats,
            failure: failure,
          ),
        );
      },
    );
  }

  Future<void> markNotificationAsRead(int id) async {
    final result = await _markNotificationAsRead(
      MarkNotificationAsReadParams(id: id),
    );

    result.when(
      success: (_) {
        _notifications = _notifications.map((n) {
          if (n.id == id) {
            return n.copyWith(isRead: true);
          }
          return n;
        }).toList();

        // Update stats
        if (_lastStats != null) {
          final unread = (_lastStats!.unread ?? 0) - 1;
          final read = (_lastStats!.read ?? 0) + 1;
          _lastStats = GetNotificationStatsResponse(
            total: _lastStats!.total,
            read: read > 0 ? read : 0,
            unread: unread > 0 ? unread : 0,
          );
        }

        emit(
          NotificationsState.markAsReadSuccess(
            notifications: _notifications,
            notificationId: id,
            currentPage: _currentPage,
            totalPages: _totalPages,
            stats: _lastStats,
          ),
        );
      },
      failure: (failure) {
        emit(
          NotificationsState.failure(
            notifications: _notifications,
            currentPage: _currentPage,
            totalPages: _totalPages,
            stats: _lastStats,
            failure: failure,
          ),
        );
      },
    );
  }

  Future<void> markAllNotificationsAsRead() async {
    final result = await _markAllNotificationsAsRead(const NoParams());

    result.when(
      success: (_) {
        _notifications = _notifications
            .map((n) => n.copyWith(isRead: true))
            .toList();

        // Update stats
        if (_lastStats != null) {
          final total = _lastStats!.total ?? 0;
          _lastStats = GetNotificationStatsResponse(
            total: total,
            read: total,
            unread: 0,
          );
        }

        emit(
          NotificationsState.markAllAsReadSuccess(
            notifications: _notifications,
            currentPage: _currentPage,
            totalPages: _totalPages,
            stats: _lastStats,
          ),
        );
      },
      failure: (failure) {
        emit(
          NotificationsState.failure(
            notifications: _notifications,
            currentPage: _currentPage,
            totalPages: _totalPages,
            stats: _lastStats,
            failure: failure,
          ),
        );
      },
    );
  }

  Future<void> deleteNotification(int id) async {
    final result = await _deleteNotification(DeleteNotificationParams(id: id));

    result.when(
      success: (_) {
        _notifications.removeWhere((n) => n.id == id);

        // Update stats
        if (_lastStats != null) {
          final total = (_lastStats!.total ?? 0) - 1;
          final unread = _notifications.where((n) => !n.isRead).length;
          final read = total - unread;
          _lastStats = GetNotificationStatsResponse(
            total: total > 0 ? total : 0,
            read: read > 0 ? read : 0,
            unread: unread > 0 ? unread : 0,
          );
        }

        emit(
          NotificationsState.deleteSuccess(
            notifications: _notifications,
            deletedId: id,
            currentPage: _currentPage,
            totalPages: _totalPages,
            stats: _lastStats,
          ),
        );
      },
      failure: (failure) {
        emit(
          NotificationsState.failure(
            notifications: _notifications,
            currentPage: _currentPage,
            totalPages: _totalPages,
            stats: _lastStats,
            failure: failure,
          ),
        );
      },
    );
  }

  Future<void> clearReadNotifications() async {
    final result = await _clearReadNotifications(const NoParams());

    result.when(
      success: (_) {
        _notifications = _notifications.where((n) => !n.isRead).toList();

        // Update stats
        if (_lastStats != null) {
          final unread = _notifications.length;
          _lastStats = GetNotificationStatsResponse(
            total: unread,
            read: 0,
            unread: unread,
          );
        }

        emit(
          NotificationsState.clearReadSuccess(
            notifications: _notifications,
            currentPage: _currentPage,
            totalPages: _totalPages,
            stats: _lastStats,
          ),
        );
      },
      failure: (failure) {
        emit(
          NotificationsState.failure(
            notifications: _notifications,
            currentPage: _currentPage,
            totalPages: _totalPages,
            stats: _lastStats,
            failure: failure,
          ),
        );
      },
    );
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

  bool get hasMorePages => _currentPage < _totalPages;

  @override
  Future<void> close() {
    _pollingTimer?.cancel();
    return super.close();
  }
}
