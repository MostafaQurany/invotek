import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class CustomerFormBottomButtons extends StatelessWidget {
  final VoidCallback? onCancel;
  final VoidCallback? onSave;
  final String? cancelText;
  final String? saveText;
  final bool isSaveEnabled;
  final bool isLoading;

  const CustomerFormBottomButtons({
    super.key,
    this.onCancel,
    this.onSave,
    this.cancelText,
    this.saveText,
    this.isSaveEnabled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 16.w,
        bottom: 16.w + MediaQuery.of(context).padding.bottom,
      ),
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
          // Cancel Button
          if (onCancel != null) ...[
            Expanded(
              child: OutlinedButton(
                onPressed: isLoading ? null : onCancel,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  side: BorderSide(color: AppColors.grey.withOpacity(0.3)),
                ),
                child: Text(
                  cancelText ?? s.cancel,
                  style: TextStyle(
                    color: AppColors.greyDark,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
          ],

          // Save Button
          Expanded(
            flex: onCancel != null ? 2 : 1,
            child: FilledButton(
              onPressed: isLoading || !isSaveEnabled ? null : onSave,
              style: FilledButton.styleFrom(
                backgroundColor: isSaveEnabled && !isLoading
                    ? AppColors.primary
                    : AppColors.grey.withOpacity(0.3),
                foregroundColor: isSaveEnabled && !isLoading
                    ? AppColors.white
                    : AppColors.greyDark,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                elevation: 0,
              ),
              child: isLoading
                  ? SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          isSaveEnabled ? AppColors.white : AppColors.greyDark,
                        ),
                      ),
                    )
                  : Text(
                      saveText ?? s.save,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
