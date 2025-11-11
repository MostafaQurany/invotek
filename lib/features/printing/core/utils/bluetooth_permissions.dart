import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

/// مساعد لإدارة أذونات Bluetooth
/// Helper for managing Bluetooth permissions
class BluetoothPermissions {
  /// طلب أذونات Bluetooth (Android 12+)
  /// Request Bluetooth permissions (Android 12+)
  static Future<bool> requestBluetoothPermissions() async {
    if (!kIsWeb) {
      if (defaultTargetPlatform == TargetPlatform.android) {
        // Android 12+ يحتاج أذونات runtime
        final bluetoothConnect = await Permission.bluetoothConnect.request();
        final bluetoothScan = await Permission.bluetoothScan.request();

        print('Bluetooth Connect: $bluetoothConnect');
        print('Bluetooth Scan: $bluetoothScan');

        return bluetoothConnect.isGranted && bluetoothScan.isGranted;
      }
    }
    return true; // iOS أو Web
  }

  /// التحقق من الأذونات
  /// Check permissions
  static Future<bool> checkBluetoothPermissions() async {
    if (!kIsWeb) {
      if (defaultTargetPlatform == TargetPlatform.android) {
        final bluetoothConnect = await Permission.bluetoothConnect.status;
        final bluetoothScan = await Permission.bluetoothScan.status;

        print('Bluetooth Connect Status: $bluetoothConnect');
        print('Bluetooth Scan Status: $bluetoothScan');

        return bluetoothConnect.isGranted && bluetoothScan.isGranted;
      }
    }
    return true;
  }

  /// فتح إعدادات التطبيق إذا كانت الأذونات مرفوضة بشكل دائم
  /// Open app settings if permissions are permanently denied
  static Future<bool> openSettings() async {
    return await openAppSettings();
  }
}
