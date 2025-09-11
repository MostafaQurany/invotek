import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class UserDetailsBottomActions extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const UserDetailsBottomActions({
    super.key,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 32.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Delete Button
          Expanded(
            child: OutlinedButton.icon(
              onPressed: onDelete,
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                side: BorderSide(color: AppColors.error.withOpacity(0.3)),
              ),
              icon: Icon(
                Icons.delete_outline,
                size: 20.sp,
                color: AppColors.error,
              ),
              label: Text(
                s.delete,
                style: TextStyle(
                  color: AppColors.error,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // Edit Button
          Expanded(
            flex: 2,
            child: FilledButton.icon(
              onPressed: onEdit,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              icon: Icon(
                Icons.edit_rounded,
                size: 20.sp,
                color: AppColors.white,
              ),
              label: Text(
                'Edit User',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
