import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/failure_widget.dart';
import 'package:invotek/features/notifications/domain/entities/notification_entity.dart';
import 'package:invotek/features/notifications/ui/cubit/notifications_cubit.dart';
import 'package:invotek/features/notifications/ui/cubit/notifications_state.dart';
import 'package:invotek/features/notifications/ui/widgets/cards/notification_card.dart';
import 'package:invotek/generated/l10n.dart';

class NotificationsListBuilder extends StatelessWidget {
  final String? tabType; // 'all', 'read', 'unread'
  final Function(NotificationEntity)? onNotificationTap;
  final Function(NotificationEntity)? onDelete;
  final Function(NotificationEntity)? onMarkAsRead;
  final ScrollController? scrollController;

  const NotificationsListBuilder({
    super.key,
    this.tabType,
    this.onNotificationTap,
    this.onDelete,
    this.onMarkAsRead,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: (notifications, selectedNotification, currentPage, totalPages,
              stats, error) {
            return _buildEmptyState(context);
          },
          loading: (notifications, selectedNotification, currentPage, totalPages,
              stats, message) {
            if (notifications.isEmpty) {
              return _buildLoadingState(context);
            }
            return _buildList(context, notifications, isLoading: true);
          },
          loaded: (notifications, selectedNotification, currentPage, totalPages,
              stats) {
            return _buildList(context, notifications);
          },
          statsLoaded: (notifications, selectedNotification, currentPage,
              totalPages, stats) {
            return _buildList(context, notifications);
          },
          markAsReadSuccess: (notifications, notificationId, selectedNotification,
              currentPage, totalPages, stats) {
            return _buildList(context, notifications);
          },
          markAllAsReadSuccess: (notifications, selectedNotification,
              currentPage, totalPages, stats) {
            return _buildList(context, notifications);
          },
          deleteSuccess: (notifications, deletedId, selectedNotification,
              currentPage, totalPages, stats) {
            return _buildList(context, notifications);
          },
          clearReadSuccess: (notifications, selectedNotification, currentPage,
              totalPages, stats) {
            return _buildList(context, notifications);
          },
          failure: (notifications, selectedNotification, currentPage, totalPages,
              stats, failure) {
            if (notifications.isEmpty) {
              return FailureWidget(
                failure: failure,
                onRetry: () {
                  context.read<NotificationsCubit>().refreshNotifications();
                },
              );
            }
            return _buildList(context, notifications);
          },
          orElse: () => _buildEmptyState(context),
        );
      },
    );
  }

  Widget _buildList(
    BuildContext context,
    List<NotificationEntity> notifications, {
    bool isLoading = false,
  }) {
    final filteredNotifications = _filterNotifications(notifications);

    if (filteredNotifications.isEmpty && !isLoading) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      controller: scrollController,
      padding: EdgeInsets.symmetric(vertical: 8.h),
      itemCount: filteredNotifications.length + (isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == filteredNotifications.length) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          );
        }

        final notification = filteredNotifications[index];
        return NotificationCard(
          notification: notification,
          onTap: () => onNotificationTap?.call(notification),
          onDelete: () => onDelete?.call(notification),
          onMarkAsRead: () => onMarkAsRead?.call(notification),
        );
      },
    );
  }

  List<NotificationEntity> _filterNotifications(
    List<NotificationEntity> notifications,
  ) {
    if (tabType == null || tabType == 'all') {
      return notifications;
    } else if (tabType == 'read') {
      return notifications.where((n) => n.isRead).toList();
    } else if (tabType == 'unread') {
      return notifications.where((n) => !n.isRead).toList();
    }
    return notifications;
  }

  Widget _buildLoadingState(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final s = S.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none,
              size: 64.sp,
              color: AppColors.textSecondary,
            ),
            SizedBox(height: 16.h),
            Text(
              s.notificationsNoNotifications,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

