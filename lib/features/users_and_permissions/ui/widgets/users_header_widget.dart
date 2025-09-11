import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/generated/l10n.dart';

class UsersHeaderWidget extends StatelessWidget {
  final VoidCallback onPermissionsPressed;

  const UsersHeaderWidget({super.key, required this.onPermissionsPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).usersAndPermissionsManagement,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              Expanded(
                child: Text(
                  S.of(context).usersAndPermissionsDescription,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                ),
              ),
              // ElevatedButton.icon(
              //   onPressed: onPermissionsPressed,
              //   icon: const Icon(Icons.security, color: Colors.white, size: 16),
              //   label: Text(
              //     S.of(context).managePermissions,
              //     style: TextStyle(fontSize: 12.sp),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: AppColors.primary,
              //     padding: EdgeInsets.symmetric(
              //       horizontal: 12.w,
              //       vertical: 8.h,
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
