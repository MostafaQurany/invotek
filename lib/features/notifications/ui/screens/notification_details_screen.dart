import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/notifications/domain/entities/notification_entity.dart';
import 'package:invotek/features/notifications/ui/cubit/notifications_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class NotificationDetailsScreen extends StatelessWidget {
  final NotificationEntity notification;

  const NotificationDetailsScreen({
    super.key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    return _NotificationDetailsScreenContent(notification: notification);
  }
}

class _NotificationDetailsScreenContent extends StatelessWidget {
  final NotificationEntity notification;

  const _NotificationDetailsScreenContent({
    required this.notification,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        title: Text(s.notificationsDetails),
        actions: [
          if (!notification.isRead)
            IconButton(
              icon: const Icon(Icons.check_circle_outline),
              onPressed: () {
                context
                    .read<NotificationsCubit>()
                    .markNotificationAsRead(notification.id);
                Navigator.of(context).pop();
              },
              tooltip: s.notificationsMarkAsRead,
            ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              _showDeleteDialog(context);
            },
            tooltip: s.delete,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              notification.title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 16.h),
            // Type and Date
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: _getTypeColor(notification.type).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _getTypeIcon(notification.type),
                        size: 16.sp,
                        color: _getTypeColor(notification.type),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        _getTypeLabel(notification.type, s),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: _getTypeColor(notification.type),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                Icon(
                  Icons.access_time,
                  size: 16.sp,
                  color: AppColors.textSecondary,
                ),
                SizedBox(width: 4.w),
                Text(
                  notification.createdAtString,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            // Message
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                notification.message,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.textPrimary,
                  height: 1.5,
                ),
              ),
            ),
            if (notification.data != null && notification.data!.isNotEmpty) ...[
              SizedBox(height: 24.h),
              Text(
                s.notificationsAdditionalData,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  notification.data.toString(),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textSecondary,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    final s = S.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.delete_outline, color: AppColors.error, size: 24.sp),
            SizedBox(width: 12.w),
            Text(s.notificationsDeleteNotification),
          ],
        ),
        content: Text(s.notificationsDeleteConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(s.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              context
                  .read<NotificationsCubit>()
                  .deleteNotification(notification.id);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: AppColors.white,
            ),
            child: Text(s.delete),
          ),
        ],
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'invoice':
        return AppColors.primary;
      case 'payment':
        return AppColors.success;
      case 'user_created':
        return AppColors.info;
      case 'system':
      default:
        return AppColors.warning;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'invoice':
        return Icons.receipt;
      case 'payment':
        return Icons.payment;
      case 'user_created':
        return Icons.person_add;
      case 'system':
      default:
        return Icons.notifications;
    }
  }

  String _getTypeLabel(String type, S s) {
    switch (type.toLowerCase()) {
      case 'invoice':
        return s.notificationsTypeInvoice;
      case 'payment':
        return s.notificationsTypePayment;
      case 'user_created':
        return s.notificationsTypeUserCreated;
      case 'system':
      default:
        return s.notificationsTypeSystem;
    }
  }
}

