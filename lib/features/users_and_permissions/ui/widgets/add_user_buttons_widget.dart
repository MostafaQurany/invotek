import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class AddUserButtonsWidget extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onSubmit;
  final VoidCallback onCancel;

  const AddUserButtonsWidget({
    super.key,
    required this.isLoading,
    required this.onSubmit,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Submit Button
        ElevatedButton(
          onPressed: isLoading ? null : onSubmit,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: isLoading
              ? SizedBox(
                  height: 20.h,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  S.of(context).addUser,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        SizedBox(height: 16.h),

        // Cancel Button
        OutlinedButton(
          onPressed: isLoading ? null : onCancel,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primary,
            side: BorderSide(color: AppColors.primary),
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            S.of(context).cancel,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
