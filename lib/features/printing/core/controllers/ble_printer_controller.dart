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

  // تتبع حالة الاتصال الجارية لمنع dispose أثناء الاتصال
  bool _isConnecting = false;
  Completer<bool>? _connectionCompleter;

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

    try {
      // إلغاء الـ subscriptions القديمة إذا كانت موجودة
      _scanSub?.cancel();
      _connectSub?.cancel();

      _onConnected = onConnected;
      _onDisconnected = onDisconnected;

      // تسجيل listeners مع معالجة الأخطاء
      try {
        _scanSub = BluetoothPrintPlus.scanResults.listen(
          _scanResultsCtrl.add,
          onError: (error) {
            print('BlePrinterController: scanResults stream error: $error');
          },
        );
      } catch (e) {
        print(
          'BlePrinterController: Error registering scanResults listener: $e',
        );
      }

      try {
        _connectSub = BluetoothPrintPlus.connectState.listen(
          (s) {
            try {
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
            } catch (e) {
              print('BlePrinterController: Error in connectState listener: $e');
            }
          },
          onError: (error) {
            print('BlePrinterController: connectState stream error: $error');
          },
        );
      } catch (e) {
        print(
          'BlePrinterController: Error registering connectState listener: $e',
        );
      }

      _isInitialized = true;
    } catch (e) {
      print('BlePrinterController: Error in initListeners: $e');
      // حتى في حالة الخطأ، نضع _isInitialized = true لتجنب محاولات متكررة
      _isInitialized = true;
    }
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
    // منع محاولات اتصال متعددة في نفس الوقت
    if (_isConnecting) {
      print('BlePrinterController: Connection already in progress');
      if (_connectionCompleter != null) {
        await _connectionCompleter!.future;
      }
      return;
    }

    try {
      // التأكد من أن الـ listeners مسجلة قبل محاولة الاتصال
      if (!_isInitialized) {
        print('BlePrinterController: Not initialized, cannot connect');
        return;
      }

      // التأكد من أن الـ connectState listener مسجل
      if (_connectSub == null) {
        print('BlePrinterController: connectState listener not registered');
        return;
      }

      _isConnecting = true;
      _connectionCompleter = Completer<bool>();

      // حفظ الجهاز قبل محاولة الاتصال
      _connected = device;

      // محاولة الاتصال مع timeout لتجنب انتظار طويل
      try {
        await BluetoothPrintPlus.connect(device).timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            print('BlePrinterController: Connection timeout');
            throw TimeoutException(
              'Connection timeout',
              const Duration(seconds: 10),
            );
          },
        );

        // انتظار قليلاً للتأكد من أن الاتصال تم بنجاح
        await Future.delayed(const Duration(milliseconds: 500));

        _connectionCompleter?.complete(true);
      } catch (e) {
        print('connect error: $e');
        _connected = null;
        _connectionCompleter?.complete(false);
        rethrow;
      } finally {
        _isConnecting = false;
        _connectionCompleter = null;
      }
    } catch (e) {
      _isConnecting = false;
      _connectionCompleter?.complete(false);
      _connectionCompleter = null;
      _connected = null;
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
      // التأكد من أن الـ listeners مسجلة قبل محاولة التحقق من الاتصال
      if (!_isInitialized || _connectSub == null) {
        print('BlePrinterController: Not initialized, cannot check connection');
        _connected = null;
        return;
      }

      // استخدام isConnected مباشرة بدلاً من connectState.first لتجنب مشاكل EventSink
      try {
        final isConnected = BluetoothPrintPlus.isConnected;
        if (isConnected) {
          if (_connected == null) {
            await _getConnectedDevice();
          }
        } else {
          _connected = null;
        }
      } catch (e) {
        // إذا فشل isConnected، نحاول استخدام connectState stream مع timeout قصير
        print(
          'BlePrinterController: Error using isConnected, trying connectState: $e',
        );
        try {
          final currentState = await BluetoothPrintPlus.connectState.first
              .timeout(
                const Duration(milliseconds: 500),
                onTimeout: () => ConnectState.disconnected,
              );

          if (currentState == ConnectState.connected) {
            if (_connected == null) {
              await _getConnectedDevice();
            }
          } else {
            _connected = null;
          }
        } catch (e2) {
          print('BlePrinterController: Error using connectState: $e2');
          _connected = null;
        }
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
    print('BlePrinterController: dispose() called');

    // إلغاء الاتصال الجاري قبل dispose لتجنب مشاكل EventSink
    if (_isConnecting) {
      print(
        'BlePrinterController: Disposing while connection in progress - cancelling connection',
      );
      try {
        // محاولة إلغاء الاتصال بشكل آمن
        BluetoothPrintPlus.disconnect().catchError((e) {
          print('BlePrinterController: Error disconnecting during dispose: $e');
        });
      } catch (e) {
        print(
          'BlePrinterController: Exception during disconnect in dispose: $e',
        );
      }

      // إلغاء الـ completer
      _isConnecting = false;
      if (_connectionCompleter != null && !_connectionCompleter!.isCompleted) {
        _connectionCompleter?.complete(false);
      }
      _connectionCompleter = null;

      // انتظار قليلاً للتأكد من أن الـ plugin انتهى من العملية
      // لكن لا نستطيع استخدام await في dispose، لذا نستخدم Future.microtask
      Future.microtask(() async {
        await Future.delayed(const Duration(milliseconds: 200));
      });
    }

    // إلغاء الـ subscriptions بعد التأكد من عدم وجود اتصال جاري
    try {
      _scanSub?.cancel();
      _connectSub?.cancel();
      _scanResultsCtrl.close();
    } catch (e) {
      print('BlePrinterController: Error cancelling subscriptions: $e');
    }
  }
}
