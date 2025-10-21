import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/generated/l10n.dart';

class PrinterStatusWidget extends StatelessWidget {
  final bool isConnected;
  final bool isLoading;
  final String status;
  final String? error;
  final VoidCallback? onRetry;
  final VoidCallback? onSettings;

  const PrinterStatusWidget({
    super.key,
    required this.isConnected,
    required this.isLoading,
    required this.status,
    this.error,
    this.onRetry,
    this.onSettings,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: _getStatusColor().withOpacity(0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: _getStatusColor().withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: _getStatusColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Icon(
                  _getStatusIcon(),
                  color: _getStatusColor(),
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.printerStatus,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: _getStatusColor(),
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoading)
                SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(_getStatusColor()),
                  ),
                ),
            ],
          ),
          
          if (error != null) ...[
            SizedBox(height: 12.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: AppColors.error.withOpacity(0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.error_outline,
                    color: AppColors.error,
                    size: 16.sp,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      error!,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.error,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          
          if (!isConnected && !isLoading) ...[
            SizedBox(height: 12.h),
            Row(
              children: [
                if (onRetry != null) ...[
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: onRetry,
                      icon: Icon(Icons.refresh, size: 16.sp),
                      label: Text(s.retryConnection),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: BorderSide(color: AppColors.primary),
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                ],
                if (onSettings != null)
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: onSettings,
                      icon: Icon(Icons.settings, size: 16.sp),
                      label: Text(s.printerSettings),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.warning,
                        foregroundColor: AppColors.white,
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Color _getStatusColor() {
    if (isLoading) return AppColors.info;
    if (error != null) return AppColors.error;
    if (isConnected) return AppColors.success;
    return AppColors.warning;
  }

  IconData _getStatusIcon() {
    if (isLoading) return Icons.search;
    if (error != null) return Icons.error;
    if (isConnected) return Icons.check_circle;
    return Icons.warning;
  }
}

class PrinterStatusIndicator extends StatelessWidget {
  final bool isConnected;
  final bool isLoading;
  final String status;

  const PrinterStatusIndicator({
    super.key,
    required this.isConnected,
    required this.isLoading,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: _getStatusColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: _getStatusColor().withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLoading)
            SizedBox(
              width: 12.w,
              height: 12.w,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(_getStatusColor()),
              ),
            )
          else
            Container(
              width: 8.w,
              height: 8.w,
              decoration: BoxDecoration(
                color: _getStatusColor(),
                shape: BoxShape.circle,
              ),
            ),
          SizedBox(width: 6.w),
          Text(
            status,
            style: TextStyle(
              fontSize: 10.sp,
              color: _getStatusColor(),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor() {
    if (isLoading) return AppColors.info;
    if (isConnected) return AppColors.success;
    return AppColors.warning;
  }
}
