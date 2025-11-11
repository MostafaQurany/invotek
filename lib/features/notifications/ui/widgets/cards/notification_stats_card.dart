import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/notifications/data/models/response/get_notification_stats_response.dart';
import 'package:invotek/generated/l10n.dart';

class NotificationStatsCard extends StatelessWidget {
  final GetNotificationStatsResponse? stats;

  const NotificationStatsCard({
    super.key,
    this.stats,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final total = stats?.total ?? 0;
    final read = stats?.read ?? 0;
    final unread = stats?.unread ?? 0;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildStatItem(
              context,
              s.notificationsTotal,
              total.toString(),
              AppColors.primary,
              Icons.notifications,
            ),
          ),
          Container(
            width: 1,
            height: 40.h,
            color: AppColors.grey.withOpacity(0.3),
          ),
          Expanded(
            child: _buildStatItem(
              context,
              s.notificationsRead,
              read.toString(),
              AppColors.success,
              Icons.check_circle,
            ),
          ),
          Container(
            width: 1,
            height: 40.h,
            color: AppColors.grey.withOpacity(0.3),
          ),
          Expanded(
            child: _buildStatItem(
              context,
              s.notificationsUnread,
              unread.toString(),
              AppColors.warning,
              Icons.notifications_active,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    Color color,
    IconData icon,
  ) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 24.sp,
        ),
        SizedBox(height: 8.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}


