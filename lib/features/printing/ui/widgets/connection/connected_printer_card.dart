import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';

class ConnectedPrinterCard extends StatelessWidget {
  final BluetoothDevice connectedDevice;
  final VoidCallback onDisconnect;

  const ConnectedPrinterCard({
    super.key,
    required this.connectedDevice,
    required this.onDisconnect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'الطابعة المتصلة',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Icon(
                Icons.bluetooth_connected,
                color: AppColors.success,
                size: 24.sp,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.print, color: AppColors.primary, size: 32.sp),
            title: Text(
              connectedDevice.name.isEmpty
                  ? '(غير معروف)'
                  : connectedDevice.name,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: Text(
                connectedDevice.address,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            trailing: TextButton.icon(
              onPressed: onDisconnect,
              icon: const Icon(Icons.close),
              label: const Text('قطع الاتصال'),
              style: TextButton.styleFrom(foregroundColor: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }
}

