import 'dart:async';

import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef OnConnected = void Function(BluetoothDevice device);
typedef OnDisconnected = void Function();

class BlePrinterController {
  StreamSubscription<List<BluetoothDevice>>? _scanSub;
  StreamSubscription<bool>? _isScanningSub;
  StreamSubscription<BlueState>? _blueStateSub;
  StreamSubscription<ConnectState>? _connectSub;
  StreamSubscription<Uint8List>? _rxSub;

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

  void initListeners({
    OnConnected? onConnected,
    OnDisconnected? onDisconnected,
  }) {
    // إلغاء الـ subscriptions القديمة إذا كانت موجودة
    _scanSub?.cancel();
    _isScanningSub?.cancel();
    _blueStateSub?.cancel();
    _connectSub?.cancel();
    _rxSub?.cancel();

    _onConnected = onConnected;
    _onDisconnected = onDisconnected;

    _scanSub = BluetoothPrintPlus.scanResults.listen(_scanResultsCtrl.add);
    _isScanningSub = BluetoothPrintPlus.isScanning.listen(
      (v) => print('isScanning: $v'),
    );
    _blueStateSub = BluetoothPrintPlus.blueState.listen(
      (s) => print('blueState: $s'),
    );

    _connectSub = BluetoothPrintPlus.connectState.listen((s) {
      print('connectState: $s');
      switch (s) {
        case ConnectState.connected:
          // محاولة الحصول على الجهاز المتصل من الأجهزة المقترنة
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

    _rxSub = BluetoothPrintPlus.receivedData.listen((d) => print('RX: $d'));
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
  /// يستخدم MAC address المحفوظ للبحث
  Future<void> _getConnectedDevice() async {
    try {
      // محاولة الحصول على MAC address المحفوظ
      final prefs = await SharedPreferences.getInstance();
      final savedAddress = prefs.getString('last_connected_printer_address');
      final savedName = prefs.getString('last_connected_printer_name');

      if (savedAddress != null) {
        print(
          '_getConnectedDevice: Looking for saved device: $savedName ($savedAddress)',
        );

        // 1. البحث في scan results أولاً
        try {
          final scanDevices = await scanResults$.first.timeout(
            const Duration(milliseconds: 500),
            onTimeout: () => <BluetoothDevice>[],
          );

          if (scanDevices.isNotEmpty) {
            try {
              final found = scanDevices.firstWhere(
                (d) =>
                    d.address == savedAddress ||
                    (savedName != null && d.name == savedName),
              );
              _connected = found;
              print(
                '_getConnectedDevice: Found in scan results: ${found.name}',
              );
              return;
            } catch (e) {
              print('_getConnectedDevice: Not found in scan results');
            }
          }
        } catch (e) {
          print('_getConnectedDevice: Error getting scan results: $e');
        }

        // 2. البحث في paired devices
        List<BluetoothDevice> devices;
        if (_cachedPairedDevices != null &&
            _lastScanTime != null &&
            DateTime.now().difference(_lastScanTime!) < _scanCacheDuration) {
          devices = _cachedPairedDevices!;
        } else {
          devices = await getPairedDevices();
        }

        if (devices.isNotEmpty) {
          try {
            final found = devices.firstWhere(
              (d) =>
                  d.address == savedAddress ||
                  (savedName != null && d.name == savedName),
            );
            _connected = found;
            print(
              '_getConnectedDevice: Found in paired devices: ${found.name}',
            );
            return;
          } catch (e) {
            print(
              '_getConnectedDevice: Saved device not found in paired devices',
            );
            // استخدام أول جهاز كبديل
            _connected = devices.first;
            print(
              '_getConnectedDevice: Using first paired device as fallback: ${_connected!.name}',
            );
          }
        }
      } else {
        // إذا لم يكن هناك MAC address محفوظ، استخدم أول جهاز
        List<BluetoothDevice> devices;
        if (_cachedPairedDevices != null &&
            _lastScanTime != null &&
            DateTime.now().difference(_lastScanTime!) < _scanCacheDuration) {
          devices = _cachedPairedDevices!;
        } else {
          devices = await getPairedDevices();
        }

        if (devices.isNotEmpty) {
          _connected = devices.first;
          print(
            '_getConnectedDevice: Using first paired device (no saved address): ${_connected!.name}',
          );
        }
      }
    } catch (e) {
      print('_getConnectedDevice error: $e');
    }
  }

  /// الحصول على الأجهزة المقترنة (من نتائج البحث)
  /// Get paired devices (from scan results)
  /// ملاحظة: bluetooth_print_plus لا يدعم getPairedDevices مباشرة
  /// Note: bluetooth_print_plus doesn't support getPairedDevices directly
  /// يمكن استخدام نتائج البحث للحصول على الأجهزة
  /// You can use scan results to get devices
  Future<List<BluetoothDevice>> getPairedDevices({
    bool forceRefresh = false,
  }) async {
    // منع البحث المتكرر
    if (_isGettingPairedDevices) {
      print('getPairedDevices: already in progress, returning cached');
      return _cachedPairedDevices ?? [];
    }

    // استخدام cache إذا كان موجوداً وحديثاً
    if (!forceRefresh &&
        _cachedPairedDevices != null &&
        _lastScanTime != null &&
        DateTime.now().difference(_lastScanTime!) < _scanCacheDuration) {
      print('getPairedDevices: returning cached devices');
      return _cachedPairedDevices!;
    }

    _isGettingPairedDevices = true;

    try {
      // بدء البحث لفترة قصيرة للحصول على الأجهزة المقترنة
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
      // التحقق من connectState الحالي
      final currentState = await BluetoothPrintPlus.connectState.first.timeout(
        const Duration(seconds: 1),
        onTimeout: () => ConnectState.disconnected,
      );

      if (currentState == ConnectState.connected) {
        // محاولة الحصول على الجهاز المتصل من الأجهزة المقترنة (استخدام cache)
        final pairedDevices = await getPairedDevices(forceRefresh: false);
        if (pairedDevices.isNotEmpty) {
          _connected = pairedDevices.first;
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
    _isScanningSub?.cancel();
    _blueStateSub?.cancel();
    _connectSub?.cancel();
    _rxSub?.cancel();
    _scanResultsCtrl.close();
  }
}
