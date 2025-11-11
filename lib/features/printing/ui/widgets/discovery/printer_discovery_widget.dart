import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:invotek/core/theme/app_colors.dart';

class PrinterDiscoveryWidget extends StatelessWidget {
  final Stream<List<BluetoothDevice>> scanResults$;
  final bool isScanning;
  final BluetoothDevice? connectedDevice;
  final bool isConnected;
  final VoidCallback onStartScan;
  final VoidCallback onStopScan;
  final ValueChanged<BluetoothDevice> onConnectToDevice;

  const PrinterDiscoveryWidget({
    super.key,
    required this.scanResults$,
    required this.isScanning,
    this.connectedDevice,
    required this.isConnected,
    required this.onStartScan,
    required this.onStopScan,
    required this.onConnectToDevice,
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
                'الطابعات',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              if (isScanning)
                TextButton.icon(
                  onPressed: onStopScan,
                  icon: const Icon(Icons.stop),
                  label: const Text('إيقاف'),
                )
              else
                TextButton.icon(
                  onPressed: onStartScan,
                  icon: const Icon(Icons.search),
                  label: const Text('بحث'),
                ),
            ],
          ),
          SizedBox(height: 16.h),
          StreamBuilder<List<BluetoothDevice>>(
            stream: scanResults$,
            initialData: const [],
            builder: (context, snapshot) {
              final allDevices = snapshot.data ?? [];

              // تصفية الطابعة المتصلة من القائمة
              final devices = allDevices.where((device) {
                return connectedDevice?.address != device.address;
              }).toList();

              if (devices.isEmpty) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.w),
                    child: Text(
                      isScanning
                          ? 'جاري البحث عن الطابعات...'
                          : isConnected
                          ? 'الطابعة المتصلة تظهر في الأعلى'
                          : 'لا توجد طابعات. اضغط على "بحث" للبحث',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: devices.length,
                separatorBuilder: (_, __) => SizedBox(height: 8.h),
                itemBuilder: (context, index) {
                  final device = devices[index];
                  return ListTile(
                    leading: Icon(Icons.bluetooth, color: AppColors.primary),
                    title: Text(
                      device.name.isEmpty ? '(غير معروف)' : device.name,
                    ),
                    subtitle: Text(device.address),
                    trailing: ElevatedButton(
                      onPressed: () => onConnectToDevice(device),
                      child: const Text('اتصال'),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

