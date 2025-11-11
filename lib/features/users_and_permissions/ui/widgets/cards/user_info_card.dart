import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/generated/l10n.dart';

class UserInfoCard extends StatelessWidget {
  final User user;
  final Function(String) onCopyToClipboard;

  const UserInfoCard({
    super.key,
    required this.user,
    required this.onCopyToClipboard,
  });

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
                  color: AppColors.info.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  Icons.info_outline,
                  color: AppColors.info,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Text(
                s.userInformation,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          // User Information Items
          _buildInfoItem(
            label: s.fullName,
            value: user.name ?? s.notProvided,
            icon: Icons.person,
          ),
          _buildInfoItem(
            label: s.emailAddress,
            value: user.email ?? s.notProvided,
            icon: Icons.email_outlined,
            isCopyable: true,
          ),
          _buildInfoItem(
            label: s.phoneNumber,
            value: user.phone ?? s.notProvided,
            icon: Icons.phone_outlined,
            isCopyable: true,
          ),
          _buildInfoItem(
            label: s.userId,
            value: user.id?.toString() ?? s.notAvailable,
            icon: Icons.fingerprint,
            isCopyable: true,
          ),
          _buildInfoItem(
            label: s.department,
            value: s.notAssigned,
            icon: Icons.business_outlined,
          ),
          _buildInfoItem(
            label: s.notes,
            value: s.noNotesAvailable,
            icon: Icons.note_outlined,
            isMultiline: true,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required String label,
    required String value,
    required IconData icon,
    bool isCopyable = false,
    bool isMultiline = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: isMultiline
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          // Icon
          Container(
            width: 32.w,
            height: 32.w,
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, size: 16.sp, color: AppColors.grey),
          ),
          SizedBox(width: 12.w),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                    height: isMultiline ? 1.4 : 1.0,
                  ),
                  maxLines: isMultiline ? null : 1,
                  overflow: isMultiline ? null : TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Copy Button
          Builder(
            builder: (context) {
              final s = S.of(context);
              if (isCopyable && value != s.notProvided && value != s.notAvailable) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: IconButton(
                    onPressed: () => onCopyToClipboard(value),
                    icon: Icon(Icons.copy, size: 16.sp, color: AppColors.primary),
                    padding: EdgeInsets.all(4.w),
                    constraints: BoxConstraints(minWidth: 32.w, minHeight: 32.w),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
