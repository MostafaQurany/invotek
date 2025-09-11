import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/auth/demo/entit/user_model.dart';

class UserDetailsHeader extends StatelessWidget {
  final User user;
  final VoidCallback onBack;
  final VoidCallback onEdit;

  const UserDetailsHeader({
    super.key,
    required this.user,
    required this.onBack,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary, AppColors.primary.withOpacity(0.8)],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar with Back Button and Actions
              Row(
                children: [
                  // Back Button
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: IconButton(
                      onPressed: onBack,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: AppColors.white,
                        size: 24.sp,
                      ),
                      padding: EdgeInsets.all(8.w),
                    ),
                  ),
                  SizedBox(width: 16.w),

                  // Title
                  Expanded(
                    child: Text(
                      'User Details',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  // Edit Button
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: IconButton(
                      onPressed: onEdit,
                      icon: Icon(
                        Icons.edit_rounded,
                        color: AppColors.white,
                        size: 24.sp,
                      ),
                      padding: EdgeInsets.all(8.w),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // User Info Section
              Row(
                children: [
                  // User Avatar
                  Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: AppColors.white.withOpacity(0.3),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        _getInitials(user.name ?? ''),
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 20.w),

                  // User Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name ?? 'Unknown User',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          user.email ?? 'No email',
                          style: TextStyle(
                            color: AppColors.white.withOpacity(0.8),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (user.role != null) ...[
                          SizedBox(height: 12.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Text(
                              user.role!.toUpperCase(),
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getInitials(String name) {
    if (name.isEmpty) return 'U';
    final words = name.split(' ');
    if (words.length >= 2) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }
}
