import 'dart:async';

import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:invotek/features/invoices/data/models/invoice_model.dart';

import '../../core/models/invoice_language.dart';
import '../../core/utils/paper_preset.dart';
import '../../core/utils/bluetooth_permissions.dart';
import '../services/pos_printer_service.dart';
import 'ble_printer_controller.dart';

/// متحكم كامل لنظام طباعة POS
/// Full Controller for POS Printing System
///
/// يدعم:
/// - الاتصال التلقائي بالطابعة
/// - البحث عن الأجهزة
/// - الحصول على الأجهزة المقترنة
/// - إعدادات قابلة للتخصيص (عرض الورق، الخط، ارتفاع الشرائح)
/// - المعاينة قبل الطباعة
///
/// Singleton Pattern: يتم استخدام instance واحد فقط في كل التطبيق
class PosPrinterController {
  // Singleton instance
  static PosPrinterController? _instance;

  // Private constructor
  PosPrinterController._internal()
    : _service = const PosPrinterService(),
      _bleController = BlePrinterController();

  // Factory constructor للـ Singleton
  factory PosPrinterController() {
    _instance ??= PosPrinterController._internal();
    return _instance!;
  }

  // Getter للـ instance (اختياري)
  static PosPrinterController get instance {
    _instance ??= PosPrinterController._internal();
    return _instance!;
  }

  final PosPrinterService _service;
  final BlePrinterController _bleController;

  // الإعدادات الحالية (مشتركة بين جميع الاستخدامات)
  PaperPreset _paperWidth = PaperPreset.mm80;
  String _fontFamily = 'Cairo';
  int _sliceHeight = 900;
  InvoiceLanguage _invoiceLanguage = InvoiceLanguage.arabic;

  // Streams
  Stream<List<BluetoothDevice>> get scanResults$ => _bleController.scanResults$;
  final _connectionStateCtrl = StreamController<bool>.broadcast();
  Stream<bool> get connectionState$ => _connectionStateCtrl.stream;
  BluetoothDevice? _connectedDevice;
  StreamSubscription<ConnectState>? _connectStateSub;

  // Callbacks
  Function(BluetoothDevice)? _onConnected;
  Function()? _onDisconnected;

  /// تهيئة المتحكم
  /// Initialize the controller
  Future<void> initialize({
    Function(BluetoothDevice)? onConnected,
    Function()? onDisconnected,
  }) async {
    _onConnected = onConnected;
    _onDisconnected = onDisconnected;

    // إلغاء الـ subscription القديمة إذا كانت موجودة
    _connectStateSub?.cancel();

    // الاستماع مباشرة من BluetoothPrintPlus.connectState
    _connectStateSub = BluetoothPrintPlus.connectState.listen((s) async {
      print('PosPrinterController connectState: $s');
      switch (s) {
        case ConnectState.connected:
          // تحديث _connectedDevice فوراً - قبل أي شيء آخر
          // هذا مهم جداً في Release Mode
          if (_bleController.connectedDevice != null) {
            _connectedDevice = _bleController.connectedDevice;
            print('PosPrinterController: Got device from _bleController');
          } else {
            // إذا لم نجد في _bleController، نستخدم device من connect() method
            // لكن هذا قد لا يكون متاحاً، لذا نحاول _updateConnectedDevice
            await _updateConnectedDevice();
          }

          // تحديث Stream فوراً
          if (!_connectionStateCtrl.isClosed) {
            _connectionStateCtrl.add(true);
          }

          if (_connectedDevice != null) {
            _onConnected?.call(_connectedDevice!);
          } else {
            // إذا لم نجد الطابعة، نحاول البحث مرة أخرى بعد قليل
            Future.delayed(const Duration(seconds: 2), () async {
              await _updateConnectedDevice();
              if (_connectedDevice != null) {
                if (!_connectionStateCtrl.isClosed) {
                  _connectionStateCtrl.add(true);
                }
                _onConnected?.call(_connectedDevice!);
              }
            });
          }
          break;
        case ConnectState.disconnected:
          // التحقق من الحالة الفعلية قبل تحديث Stream
          // هذا مهم لأن Stream قد يرسل disconnected خطأً في Release Mode
          Future.delayed(const Duration(milliseconds: 200), () async {
            try {
              // التحقق من الحالة الفعلية
              final actualState = await BluetoothPrintPlus.connectState.first
                  .timeout(
                    const Duration(milliseconds: 300),
                    onTimeout: () => ConnectState.disconnected,
                  );

              // فقط إذا كانت الحالة disconnected فعلاً، نحدث Stream
              if (actualState == ConnectState.disconnected &&
                  _connectedDevice != null) {
                print(
                  'PosPrinterController: Disconnected confirmed, clearing device',
                );
                _connectedDevice = null;
                if (!_connectionStateCtrl.isClosed) {
                  _connectionStateCtrl.add(false);
                }
                _onDisconnected?.call();
              } else if (actualState == ConnectState.connected) {
                // إذا كانت الحالة connected فعلاً، نؤكد الاتصال
                print(
                  'PosPrinterController: Still connected, ignoring disconnected event',
                );
                if (!_connectionStateCtrl.isClosed &&
                    _connectedDevice != null) {
                  _connectionStateCtrl.add(true);
                }
              }
            } catch (e) {
              print('PosPrinterController: Error checking actual state: $e');
              // في حالة الخطأ، نتحقق من _connectedDevice
              if (_connectedDevice != null) {
                // إذا كان _connectedDevice موجود، نؤكد الاتصال
                if (!_connectionStateCtrl.isClosed) {
                  _connectionStateCtrl.add(true);
                }
              }
            }
          });
          break;
      }
    });

    _bleController.initListeners(
      onConnected: (device) {
        _connectedDevice = device;
        // لا حاجة لإضافة للـ stream هنا لأن connectState listener سيفعل ذلك
      },
      onDisconnected: () {
        _connectedDevice = null;
        // لا حاجة لإضافة للـ stream هنا لأن connectState listener سيفعل ذلك
      },
    );
  }

  /// تحديث الجهاز المتصل
  /// Update connected device
  /// يستخدم MAC address المحفوظ للبحث عن الجهاز (بدون scan!)
  Future<void> _updateConnectedDevice() async {
    if (_connectedDevice != null) {
      return; // الجهاز موجود بالفعل
    }

    try {
      // محاولة الحصول على MAC address المحفوظ
      final prefs = await SharedPreferences.getInstance();
      final savedAddress = prefs.getString('last_connected_printer_address');
      final savedName = prefs.getString('last_connected_printer_name');

      if (savedAddress == null) {
        print('_updateConnectedDevice: No saved address');
        return; // لا يوجد MAC address محفوظ
      }

      print(
        '_updateConnectedDevice: Looking for saved device: $savedName ($savedAddress)',
      );

      // البحث في paired devices فقط (بدون scan!)
      try {
        final pairedDevices = await getPairedDevices(forceRefresh: false);
        try {
          final foundDevice = pairedDevices.firstWhere(
            (d) =>
                d.address == savedAddress ||
                (savedName != null && d.name == savedName),
          );
          _connectedDevice = foundDevice;
          print(
            '_updateConnectedDevice: Found in paired devices ${foundDevice.name} (${foundDevice.address})',
          );
          return; // ✅ وجدنا الجهاز، لا حاجة للبحث
        } catch (e) {
          print('_updateConnectedDevice: Not found in paired devices');
          // ❌ لا نبدأ scan! لأن الاتصال موجود بالفعل
          // فقط نترك _connectedDevice = null
          // لكن الاتصال سيبقى active
        }
      } catch (e) {
        print('_updateConnectedDevice: Error getting paired devices: $e');
      }

      // ❌ إزالة جميع محاولات البحث (scan) من هنا!
      // إذا لم نجد في paired devices، لا نبدأ scan
      // لأن الاتصال موجود بالفعل، فقط الجهاز غير موجود في القائمة
    } catch (e) {
      print('_updateConnectedDevice error: $e');
    }
  }

  /// الحصول على الإعدادات الحالية
  /// Get current settings
  Map<String, dynamic> getSettings() {
    return {
      'paperWidth': _paperWidth,
      'fontFamily': _fontFamily,
      'sliceHeight': _sliceHeight,
      'invoiceLanguage': _invoiceLanguage,
    };
  }

  /// تحديث الإعدادات
  /// Update settings
  void updateSettings({
    PaperPreset? paperWidth,
    String? fontFamily,
    int? sliceHeight,
    InvoiceLanguage? invoiceLanguage,
  }) {
    if (paperWidth != null) _paperWidth = paperWidth;
    if (fontFamily != null) _fontFamily = fontFamily;
    if (sliceHeight != null) _sliceHeight = sliceHeight;
    if (invoiceLanguage != null) _invoiceLanguage = invoiceLanguage;
  }

  /// التحقق من حالة الاتصال الحالية (بسيط - بدون بحث)
  /// Check current connection status (simple - no scanning)
  Future<void> checkCurrentConnection() async {
    try {
      // الحصول على الحالة الحالية من Stream مباشرة
      final currentState = await BluetoothPrintPlus.connectState.first.timeout(
        const Duration(milliseconds: 500),
        onTimeout: () => ConnectState.disconnected,
      );

      print('checkCurrentConnection: currentState = $currentState');

      if (currentState == ConnectState.connected) {
        // إذا كان متصلاً ولكن _connectedDevice == null، نحاول العثور عليه من paired devices فقط (بدون scan)
        if (_connectedDevice == null) {
          print(
            'checkCurrentConnection: Connected but device is null, trying to find from paired devices...',
          );
          // محاولة بسيطة من paired devices فقط (بدون scan!)
          await _updateConnectedDevice(); // هذا يستخدم paired devices فقط
        } else {
          print(
            'checkCurrentConnection: Already have connected device: ${_connectedDevice!.name}',
          );
        }

        // تحديث stream بالحالة الحالية
        _connectionStateCtrl.add(true);
        print('checkCurrentConnection: Connection confirmed');
      } else {
        _connectedDevice = null;
        _connectionStateCtrl.add(false);
        print('checkCurrentConnection: Not connected');
      }
    } catch (e) {
      print('checkCurrentConnection error: $e');
      _connectedDevice = null;
      _connectionStateCtrl.add(false);
    }
  }

  /// الحصول على الأجهزة المقترنة
  /// Get paired devices
  Future<List<BluetoothDevice>> getPairedDevices({
    bool forceRefresh = false,
  }) async {
    return await _bleController.getPairedDevices(forceRefresh: forceRefresh);
  }

  /// البحث عن الأجهزة
  /// Scan for devices
  Future<void> startScan({
    Duration timeout = const Duration(seconds: 10),
  }) async {
    await _bleController.startScan(timeout);
  }

  /// إيقاف البحث
  /// Stop scanning
  void stopScan() {
    _bleController.stopScan();
  }

  /// الاتصال بجهاز
  /// Connect to a device
  Future<bool> connect(BluetoothDevice device) async {
    try {
      print(
        'connect: Attempting to connect to ${device.name} (${device.address})',
      );

      // طلب الأذونات أولاً (Android 12+)
      final hasPermissions =
          await BluetoothPermissions.requestBluetoothPermissions();
      if (!hasPermissions) {
        print('connect: Bluetooth permissions not granted');
        _connectedDevice = null;
        _connectionStateCtrl.add(false);
        return false;
      }

      // الاتصال عبر _bleController
      await _bleController.connect(device);

      // في Release Mode، نحتاج وقت أطول للاتصال
      // نستخدم polling بدلاً من stream للتحكم بشكل أفضل
      bool connected = false;
      const maxAttempts = 20; // 20 محاولة × 500ms = 10 ثواني
      const delayMs = 500;

      for (int i = 0; i < maxAttempts; i++) {
        // التحقق من _connectedDevice قبل الانتظار
        // هذا مهم جداً لأن Stream listener قد يكون قد حدثه
        if (_connectedDevice != null) {
          connected = true;
          print(
            'connect: Connected via stream listener before delay (attempt ${i + 1})',
          );
          break;
        }

        await Future.delayed(Duration(milliseconds: delayMs));

        // التحقق مرة أخرى بعد الانتظار
        if (_connectedDevice != null) {
          connected = true;
          print(
            'connect: Connected via stream listener after delay (attempt ${i + 1})',
          );
          break;
        }

        try {
          final currentState = await BluetoothPrintPlus.connectState.first
              .timeout(
                const Duration(milliseconds: 300),
                onTimeout: () => ConnectState.disconnected,
              );

          if (currentState == ConnectState.connected) {
            connected = true;
            print('connect: Connected after ${(i + 1) * delayMs}ms');
            break;
          }
        } catch (e) {
          print('connect: Error checking state (attempt ${i + 1}): $e');
          // نستمر في المحاولة
        }
      }

      // التحقق النهائي - من _connectedDevice أولاً
      if (!connected) {
        // التحقق من _connectedDevice (Stream listener قد يكون قد حدثه)
        if (_connectedDevice != null) {
          connected = true;
          print('connect: Connected via stream listener on final check');
        } else {
          try {
            final finalState = await BluetoothPrintPlus.connectState.first
                .timeout(
                  const Duration(milliseconds: 1000),
                  onTimeout: () => ConnectState.disconnected,
                );
            connected = finalState == ConnectState.connected;
            if (connected) {
              print('connect: Connected on final check');
            }
          } catch (e) {
            print('connect: Final check error: $e');
          }
        }
      }

      if (connected) {
        // تحديث _connectedDevice أولاً - قبل أي شيء آخر
        _connectedDevice = _bleController.connectedDevice ?? device;

        // حفظ MAC address في SharedPreferences
        if (_connectedDevice != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString(
            'last_connected_printer_address',
            _connectedDevice!.address,
          );
          await prefs.setString(
            'last_connected_printer_name',
            _connectedDevice!.name,
          );
          print(
            'connect: Successfully connected and saved device ${_connectedDevice!.name} (${_connectedDevice!.address})',
          );
        }

        // انتظار قليل للتأكد من تحديث _connectedDevice
        // هذا مهم في Release Mode
        await Future.delayed(const Duration(milliseconds: 100));

        // تحديث Stream بعد التأكد من تحديث _connectedDevice
        if (!_connectionStateCtrl.isClosed) {
          _connectionStateCtrl.add(true);
        }

        // استدعاء callback
        if (_connectedDevice != null) {
          _onConnected?.call(_connectedDevice!);
        }

        // تأكيد إضافي بعد قليل للتأكد من وصول التحديث
        // هذا مهم في Release Mode حيث Stream listeners قد تكون أبطأ
        Future.delayed(const Duration(milliseconds: 300), () {
          if (!_connectionStateCtrl.isClosed && _connectedDevice != null) {
            _connectionStateCtrl.add(true);
            _onConnected?.call(_connectedDevice!);
          }
        });

        return true;
      } else {
        print('connect: Connection failed after all attempts');
        _connectedDevice = null;
        _connectionStateCtrl.add(false);
        return false;
      }
    } catch (e) {
      print('connect error: $e');
      _connectedDevice = null;
      _connectionStateCtrl.add(false);
      return false;
    }
  }

  /// قطع الاتصال
  /// Disconnect
  Future<void> disconnect() async {
    await _bleController.disconnect();
  }

  /// الاتصال التلقائي
  /// Auto connect (يحاول الاتصال بالطابعة المحفوظة أولاً)
  /// Auto connect (tries to connect to saved printer first)
  Future<bool> autoConnect({String? preferredDeviceName}) async {
    try {
      // التحقق من حالة الاتصال الحالية أولاً
      final currentState = await BluetoothPrintPlus.connectState.first.timeout(
        const Duration(seconds: 1),
        onTimeout: () => ConnectState.disconnected,
      );

      if (currentState == ConnectState.connected) {
        print('autoConnect: Already connected');
        // تحديث _connectedDevice إذا كان null
        if (_connectedDevice == null) {
          await _updateConnectedDevice();
        }
        return true;
      }

      // 1. محاولة الاتصال بالطابعة المحفوظة (MAC address) أولاً
      final prefs = await SharedPreferences.getInstance();
      final savedAddress = prefs.getString('last_connected_printer_address');
      final savedName = prefs.getString('last_connected_printer_name');

      if (savedAddress != null) {
        print(
          'autoConnect: Trying to connect to saved printer: $savedName ($savedAddress)',
        );

        // البحث في paired devices أولاً
        final pairedDevices = await getPairedDevices(forceRefresh: false);
        try {
          final savedDevice = pairedDevices.firstWhere(
            (d) =>
                d.address == savedAddress ||
                (savedName != null && d.name == savedName),
          );
          final connected = await connect(savedDevice);
          if (connected) {
            print('autoConnect: Successfully connected to saved printer');
            return true;
          }
        } catch (e) {
          print(
            'autoConnect: Saved printer not found in paired devices, trying scan...',
          );
        }

        // إذا لم نجد في paired devices، نحاول البحث
        await startScan(timeout: const Duration(seconds: 3));
        await Future.delayed(const Duration(milliseconds: 500));

        try {
          final scanDevices = await scanResults$.first.timeout(
            const Duration(seconds: 2),
            onTimeout: () => <BluetoothDevice>[],
          );
          stopScan();

          try {
            final savedDevice = scanDevices.firstWhere(
              (d) =>
                  d.address == savedAddress ||
                  (savedName != null && d.name == savedName),
            );
            final connected = await connect(savedDevice);
            if (connected) {
              print(
                'autoConnect: Successfully connected to saved printer from scan',
              );
              return true;
            }
          } catch (e) {
            print('autoConnect: Saved printer not found in scan results');
          }
        } catch (e) {
          print('autoConnect: Scan failed: $e');
          stopScan();
        }
      }

      // 2. محاولة الاتصال بجهاز محدد إذا تم توفيره
      if (preferredDeviceName != null) {
        final pairedDevices = await getPairedDevices();
        try {
          final preferredDevice = pairedDevices.firstWhere(
            (d) => d.name == preferredDeviceName,
          );
          final connected = await connect(preferredDevice);
          if (connected) return true;
        } catch (e) {
          print('autoConnect: Preferred device not found');
        }
      }

      // 3. محاولة الاتصال بأول جهاز مقترن
      final pairedDevices = await getPairedDevices();
      if (pairedDevices.isNotEmpty) {
        print('autoConnect: Trying to connect to first paired device');
        final connected = await connect(pairedDevices.first);
        if (connected) return true;
      }

      // 4. البحث عن الأجهزة والاتصال بأول جهاز
      print('autoConnect: Scanning for devices...');
      await startScan(timeout: const Duration(seconds: 5));
      await Future.delayed(const Duration(seconds: 2));

      try {
        final devices = await scanResults$.first.timeout(
          const Duration(seconds: 3),
          onTimeout: () => <BluetoothDevice>[],
        );
        stopScan();

        if (devices.isNotEmpty) {
          print('autoConnect: Trying to connect to first scanned device');
          final connected = await connect(devices.first);
          if (connected) return true;
        }
      } catch (e) {
        print('autoConnect: Error getting scan results: $e');
        stopScan();
      }

      print('autoConnect: Failed to connect to any device');
      return false;
    } catch (e) {
      print('autoConnect error: $e');
      return false;
    }
  }

  /// البحث والاتصال
  /// Scan and connect
  Future<bool> scanAndConnect({
    Duration scanTimeout = const Duration(seconds: 10),
  }) async {
    try {
      await startScan(timeout: scanTimeout);

      // انتظار النتائج
      final devices = await scanResults$.first.timeout(
        scanTimeout,
        onTimeout: () => <BluetoothDevice>[],
      );

      if (devices.isNotEmpty) {
        return await connect(devices.first);
      }

      return false;
    } catch (e) {
      print('scanAndConnect error: $e');
      return false;
    }
  }

  /// التحقق من حالة الاتصال
  /// Check connection status
  /// يعتمد على BluetoothPrintPlus.connectState مباشرة
  bool get isConnected {
    // الحصول على الحالة الحالية من Stream (synchronous check)
    try {
      // استخدام last value من Stream إذا كان متاحاً
      // إذا لم يكن متاحاً، نتحقق من _connectedDevice
      // لكن الأفضل هو الاعتماد على connectState listener الذي يحدث _connectionStateCtrl
      // لذلك نستخدم _connectedDevice كـ fallback
      // لكن يجب أن نعتمد على connectState الحالي
      return _connectedDevice != null;
    } catch (e) {
      return false;
    }
  }

  /// التحقق من حالة الاتصال من BluetoothPrintPlus مباشرة (async)
  /// Check connection status directly from BluetoothPrintPlus (async)
  Future<bool> getIsConnectedAsync() async {
    try {
      final currentState = await BluetoothPrintPlus.connectState.first.timeout(
        const Duration(seconds: 1),
        onTimeout: () => ConnectState.disconnected,
      );
      return currentState == ConnectState.connected;
    } catch (e) {
      print('getIsConnectedAsync error: $e');
      return false;
    }
  }

  /// الحصول على الجهاز المتصل
  /// Get connected device
  BluetoothDevice? get connectedDevice => _connectedDevice;

  // ========== طباعة الفواتير الضريبية ==========
  // ========== Tax Invoice Printing ==========

  /// معاينة فاتورة ضريبية
  /// Preview tax invoice
  Future<List<Uint8List>> previewTaxInvoice({
    required InvoiceModel invoice,
    required InvoiceLanguage invoiceLanguage,
    PaperPreset? paperWidth,
    String? fontFamily,
    int? sliceHeight,
    // Seller information (optional)
    String? sellerNameAr,
    String? sellerNameEn,
    String? sellerVat,
    String? sellerAddress,
    // Footer information (optional)
    String? footerAr,
    String? footerEn,
    // ZATCA QR fields (optional)
    String? zatcaSellerName,
    String? zatcaVatNumber,
    String? zatcaTimestampIso8601,
    String? zatcaTotalWithVat,
    String? zatcaVatTotal,
  }) async {
    return await _service.previewZatca(
      paper: paperWidth ?? _paperWidth,
      invoice: invoice,
      invoiceLanguage: invoiceLanguage,
      fontFamily: fontFamily ?? _fontFamily,
      sliceHeight: sliceHeight ?? _sliceHeight,
      sellerNameAr: sellerNameAr,
      sellerNameEn: sellerNameEn,
      sellerVat: sellerVat,
      sellerAddress: sellerAddress,
      footerAr: footerAr,
      footerEn: footerEn,
      zatcaSellerName: zatcaSellerName,
      zatcaVatNumber: zatcaVatNumber,
      zatcaTimestampIso8601: zatcaTimestampIso8601,
      zatcaTotalWithVat: zatcaTotalWithVat,
      zatcaVatTotal: zatcaVatTotal,
    );
  }

  /// طباعة فاتورة ضريبية
  /// Print tax invoice
  Future<bool> printTaxInvoice({
    required InvoiceModel invoice,
    required InvoiceLanguage invoiceLanguage,
    PaperPreset? paperWidth,
    String? fontFamily,
    int? sliceHeight,
    int feedLines = 2, // قطع مباشر بعد QR Code
    // Seller information (optional)
    String? sellerNameAr,
    String? sellerNameEn,
    String? sellerVat,
    String? sellerAddress,
    // Footer information (optional)
    String? footerAr,
    String? footerEn,
    // ZATCA QR fields (optional)
    String? zatcaSellerName,
    String? zatcaVatNumber,
    String? zatcaTimestampIso8601,
    String? zatcaTotalWithVat,
    String? zatcaVatTotal,
  }) async {
    if (!isConnected) {
      print('Not connected to printer');
      return false;
    }

    try {
      await _service.printZatca(
        invoiceLanguage: invoiceLanguage,
        paper: paperWidth ?? _paperWidth,
        invoice: invoice,
        fontFamily: fontFamily ?? _fontFamily,
        sliceHeight: sliceHeight ?? _sliceHeight,
        feedLines: feedLines,
        sellerNameAr: sellerNameAr,
        sellerNameEn: sellerNameEn,
        sellerVat: sellerVat,
        sellerAddress: sellerAddress,
        footerAr: footerAr,
        footerEn: footerEn,
        zatcaSellerName: zatcaSellerName,
        zatcaVatNumber: zatcaVatNumber,
        zatcaTimestampIso8601: zatcaTimestampIso8601,
        zatcaTotalWithVat: zatcaTotalWithVat,
        zatcaVatTotal: zatcaVatTotal,
      );
      return true;
    } catch (e) {
      print('printTaxInvoice error: $e');
      return false;
    }
  }

  /// تنظيف الموارد
  /// Dispose resources
  void dispose() {
    _connectStateSub?.cancel();
    _connectionStateCtrl.close();
    _bleController.dispose();
  }
}
