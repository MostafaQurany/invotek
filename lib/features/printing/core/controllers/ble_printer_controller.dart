import 'dart:async';

import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef OnConnected = void Function(BluetoothDevice device);
typedef OnDisconnected = void Function();

class BlePrinterController {
  StreamSubscription<List<BluetoothDevice>>? _scanSub;
  StreamSubscription<ConnectState>? _connectSub;

  final _scanResultsCtrl = StreamController<List<BluetoothDevice>>.broadcast();
  Stream<List<BluetoothDevice>> get scanResults$ => _scanResultsCtrl.stream;

  BluetoothDevice? _connected;
  OnConnected? _onConnected;
  OnDisconnected? _onDisconnected;

  // Cache للأجهزة المقترنة لمنع البحث المتكرر
  List<BluetoothDevice>? _cachedPairedDevices;
  DateTime? _lastScanTime;
  static const _scanCacheDuration = Duration(seconds: 10);
  bool _isGettingPairedDevices = false;

  // حالة التهيئة
  bool _isInitialized = false;

  void initListeners({
    OnConnected? onConnected,
    OnDisconnected? onDisconnected,
  }) {
    // تحديث callbacks فقط إذا تم التهيئة بالفعل
    if (_isInitialized) {
      _onConnected = onConnected;
      _onDisconnected = onDisconnected;
      return;
    }

    // إلغاء الـ subscriptions القديمة إذا كانت موجودة
    _scanSub?.cancel();
    _connectSub?.cancel();

    _onConnected = onConnected;
    _onDisconnected = onDisconnected;

    _scanSub = BluetoothPrintPlus.scanResults.listen(_scanResultsCtrl.add);

    _connectSub = BluetoothPrintPlus.connectState.listen((s) {
      switch (s) {
        case ConnectState.connected:
          if (_connected == null) {
            _getConnectedDevice();
          }
          if (_connected != null) {
            _onConnected?.call(_connected!);
          }
          break;
        case ConnectState.disconnected:
          _connected = null;
          _onDisconnected?.call();
          break;
      }
    });

    _isInitialized = true;
  }

  Future<void> startScan(Duration timeout) async {
    try {
      await BluetoothPrintPlus.startScan(timeout: timeout);
    } catch (e) {
      print('startScan error: $e');
    }
  }

  void stopScan() {
    try {
      BluetoothPrintPlus.stopScan();
    } catch (e) {
      print('stopScan error: $e');
    }
  }

  Future<void> connect(BluetoothDevice device) async {
    try {
      _connected = device;
      await BluetoothPrintPlus.connect(device);
    } catch (e) {
      print('connect error: $e');
    }
  }

  Future<void> disconnect() async {
    try {
      await BluetoothPrintPlus.disconnect();
      _connected = null;
      // مسح cache عند قطع الاتصال
      _cachedPairedDevices = null;
      _lastScanTime = null;
    } catch (e) {
      print('disconnect error: $e');
    }
  }

  /// مسح cache للأجهزة المقترنة
  /// Clear cached paired devices
  void clearPairedDevicesCache() {
    _cachedPairedDevices = null;
    _lastScanTime = null;
  }

  /// الحصول على الجهاز المتصل من الأجهزة المقترنة
  /// Get connected device from paired devices
  Future<void> _getConnectedDevice() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedAddress = prefs.getString('last_connected_printer_address');
      final savedName = prefs.getString('last_connected_printer_name');

      if (savedAddress == null) {
        return;
      }

      final devices = await getPairedDevices(forceRefresh: false);
      if (devices.isEmpty) {
        return;
      }

      try {
        final found = devices.firstWhere(
          (d) =>
              d.address == savedAddress ||
              (savedName != null && d.name == savedName),
        );
        _connected = found;
      } catch (e) {
        // الجهاز غير موجود في paired devices
      }
    } catch (e) {
      print('_getConnectedDevice error: $e');
    }
  }

  /// الحصول على الأجهزة المقترنة (من نتائج البحث)
  /// Get paired devices (from scan results)
  Future<List<BluetoothDevice>> getPairedDevices({
    bool forceRefresh = false,
  }) async {
    // منع البحث المتكرر
    if (_isGettingPairedDevices) {
      return _cachedPairedDevices ?? [];
    }

    // استخدام cache إذا كان موجوداً وحديثاً
    if (!forceRefresh &&
        _cachedPairedDevices != null &&
        _lastScanTime != null &&
        DateTime.now().difference(_lastScanTime!) < _scanCacheDuration) {
      return _cachedPairedDevices!;
    }

    _isGettingPairedDevices = true;

    try {
      // بدء البحث لفترة قصيرة
      await startScan(const Duration(seconds: 2));
      await Future.delayed(const Duration(milliseconds: 500));
      stopScan();

      // الحصول على النتائج من Stream
      final devices = await scanResults$.first.timeout(
        const Duration(seconds: 1),
        onTimeout: () => <BluetoothDevice>[],
      );

      // حفظ في cache
      _cachedPairedDevices = devices;
      _lastScanTime = DateTime.now();

      return devices;
    } catch (e) {
      print('getPairedDevices error: $e');
      return _cachedPairedDevices ?? [];
    } finally {
      _isGettingPairedDevices = false;
    }
  }

  /// التحقق من حالة الاتصال الحالية
  /// Check current connection status
  Future<void> checkCurrentConnection() async {
    try {
      final currentState = await BluetoothPrintPlus.connectState.first.timeout(
        const Duration(seconds: 1),
        onTimeout: () => ConnectState.disconnected,
      );

      if (currentState == ConnectState.connected) {
        if (_connected == null) {
          await _getConnectedDevice();
        }
      } else {
        _connected = null;
      }
    } catch (e) {
      print('checkCurrentConnection error: $e');
      _connected = null;
    }
  }

  /// التحقق من حالة الاتصال
  /// Check connection status
  bool get isConnected => _connected != null;

  /// الحصول على الجهاز المتصل
  /// Get connected device
  BluetoothDevice? get connectedDevice => _connected;

  void dispose() {
    _scanSub?.cancel();
    _connectSub?.cancel();
    _scanResultsCtrl.close();
  }
}
