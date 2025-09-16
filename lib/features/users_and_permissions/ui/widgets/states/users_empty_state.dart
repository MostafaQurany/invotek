import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class UsersEmptyState extends StatelessWidget {
  final VoidCallback onAddUser;

  const UsersEmptyState({super.key, required this.onAddUser});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      height: 0.75.sh,
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(32.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Empty State Icon
              Container(
                width: 120.w,
                height: 120.w,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(60.r),
                ),
                child: Icon(
                  Icons.people_outline,
                  size: 60.sp,
                  color: AppColors.primary.withOpacity(0.6),
                ),
              ),

              SizedBox(height: 32.h),

              // Empty State Title
              Text(
                s.noUsersFound,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 12.h),

              // Empty State Description
              Text(
                'Start by adding your first user to the system',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.grey,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 32.h),

              // Add User Button
              FilledButton.icon(
                onPressed: onAddUser,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.w,
                    vertical: 16.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                icon: Icon(Icons.add, size: 20.sp),
                label: Text(
                  'Add First User',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
