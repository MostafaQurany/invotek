import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/auth/demo/entit/user_model.dart';
import 'package:invotek/generated/l10n.dart';

class UserSummaryCard extends StatelessWidget {
  final User user;

  const UserSummaryCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.person_outline,
                  color: AppColors.primary,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                'User Summary',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          // Summary Grid
          Row(
            children: [
              // Status
              Expanded(
                child: _buildSummaryItem(
                  title: s.status,
                  value: user.status ?? 'Unknown',
                  icon: Icons.circle,
                  color: _getStatusColor(user.status ?? ''),
                ),
              ),
              SizedBox(width: 16.w),

              // Role
              Expanded(
                child: _buildSummaryItem(
                  title: s.role,
                  value: user.role ?? 'Unknown',
                  icon: Icons.work_outline,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),

          SizedBox(height: 16.h),

          Row(
            children: [
              // Created Date
              Expanded(
                child: _buildSummaryItem(
                  title: s.createdDate,
                  value: user.createdAt ?? 'Unknown',
                  icon: Icons.calendar_today_outlined,
                  color: AppColors.info,
                ),
              ),
              SizedBox(width: 16.w),

              // Last Login
              Expanded(
                child: _buildSummaryItem(
                  title: 'Last Login',
                  value: 'Never',
                  icon: Icons.login_outlined,
                  color: AppColors.success,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryItem({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color.withOpacity(0.1), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16.sp, color: color),
              SizedBox(width: 6.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return AppColors.success;
      case 'inactive':
        return AppColors.warning;
      case 'suspended':
        return AppColors.error;
      default:
        return AppColors.grey;
    }
  }
}
