import 'dart:typed_data';

import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
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
  BluetoothDevice? _connectedDevice;

  // Callbacks
  Function(BluetoothDevice)? _onConnected;
  Function()? _onDisconnected;

  // حالة التهيئة
  bool _isInitialized = false;

  /// تهيئة المتحكم
  /// Initialize the controller
  Future<void> initialize({
    Function(BluetoothDevice)? onConnected,
    Function()? onDisconnected,
  }) async {
    // التحقق من التهيئة السابقة - تحديث callbacks فقط إذا تم التهيئة
    if (_isInitialized) {
      // تحديث callbacks فقط بدون إعادة تهيئة الـ listeners
      _onConnected = onConnected;
      _onDisconnected = onDisconnected;
      return;
    }

    _onConnected = onConnected;
    _onDisconnected = onDisconnected;

    _bleController.initListeners(
      onConnected: (device) {
        _connectedDevice = device;
        _onConnected?.call(device);
      },
      onDisconnected: () {
        _connectedDevice = null;
        _onDisconnected?.call();
      },
    );

    _isInitialized = true;
  }

  /// تحديث الجهاز المتصل من الأجهزة المقترنة
  /// Update connected device from paired devices
  Future<void> _updateConnectedDevice() async {
    if (_connectedDevice != null) {
      return;
    }

    try {
      final prefs = await SharedPreferences.getInstance();
      final savedAddress = prefs.getString('last_connected_printer_address');
      final savedName = prefs.getString('last_connected_printer_name');

      if (savedAddress == null) {
        return;
      }

      final pairedDevices = await getPairedDevices(forceRefresh: false);
      try {
        final foundDevice = pairedDevices.firstWhere(
          (d) =>
              d.address == savedAddress ||
              (savedName != null && d.name == savedName),
        );
        _connectedDevice = foundDevice;
      } catch (e) {
        // الجهاز غير موجود في paired devices
      }
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

  /// التحقق من حالة الاتصال الحالية
  /// Check current connection status
  Future<void> checkCurrentConnection() async {
    try {
      final currentState = await BluetoothPrintPlus.connectState
          .firstWhere(
            (s) =>
                s == ConnectState.connected || s == ConnectState.disconnected,
          )
          .timeout(
            const Duration(seconds: 5),
            onTimeout: () => ConnectState.disconnected,
          );

      if (currentState == ConnectState.connected) {
        if (_connectedDevice == null) {
          await _updateConnectedDevice();
        }
      } else {
        _connectedDevice = null;
      }
    } catch (e) {
      print('checkCurrentConnection error: $e');
      _connectedDevice = null;
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
      // طلب الأذونات أولاً (Android 12+)
      final hasPermissions =
          await BluetoothPermissions.requestBluetoothPermissions();
      if (!hasPermissions) {
        print('connect: Bluetooth permissions not granted');
        _connectedDevice = null;
        return false;
      }

      // الاتصال عبر _bleController
      await _bleController.connect(device);

      // انتظار حتى 8 ثواني إن الستريم يدي Connected
      try {
        final isConnected =
            await BluetoothPrintPlus.connectState
                .firstWhere((s) => s == ConnectState.connected)
                .timeout(
                  const Duration(seconds: 8),
                  onTimeout: () => ConnectState.disconnected,
                ) ==
            ConnectState.connected;

        if (isConnected) {
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
          }

          _onConnected?.call(_connectedDevice!);
          return true;
        }
      } catch (e) {
        print('connect: First attempt failed, trying retry: $e');
      }

      // محاولة إعادة مرة واحدة بعد 1-2 ثانية (في حالات flip)
      await Future.delayed(const Duration(seconds: 2));

      try {
        final retryConnected =
            await BluetoothPrintPlus.connectState
                .firstWhere((s) => s == ConnectState.connected)
                .timeout(
                  const Duration(seconds: 5),
                  onTimeout: () => ConnectState.disconnected,
                ) ==
            ConnectState.connected;

        if (retryConnected) {
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
          }

          _onConnected?.call(_connectedDevice!);
          return true;
        }
      } catch (e) {
        print('connect: Retry attempt failed: $e');
      }

      _connectedDevice = null;
      return false;
    } catch (e) {
      print('connect error: $e');
      _connectedDevice = null;
      return false;
    }
  }

  /// قطع الاتصال
  /// Disconnect
  Future<void> disconnect() async {
    await _bleController.disconnect();
  }

  /// الاتصال التلقائي
  /// Auto connect (يحاول الاتصال بالطابعة المحفوظة)
  Future<bool> autoConnect({String? preferredDeviceName}) async {
    try {
      // التحقق من حالة الاتصال الحالية
      try {
        final currentState = await BluetoothPrintPlus.connectState
            .firstWhere(
              (s) =>
                  s == ConnectState.connected || s == ConnectState.disconnected,
            )
            .timeout(
              const Duration(seconds: 5),
              onTimeout: () => ConnectState.disconnected,
            );

        if (currentState == ConnectState.connected) {
          if (_connectedDevice == null) {
            await _updateConnectedDevice();
          }
          return true;
        }
      } catch (e) {
        print('autoConnect: Error checking current state: $e');
      }

      // محاولة الاتصال بالطابعة المحفوظة
      final prefs = await SharedPreferences.getInstance();
      final savedAddress = prefs.getString('last_connected_printer_address');
      final savedName = prefs.getString('last_connected_printer_name');

      if (savedAddress != null) {
        final pairedDevices = await getPairedDevices(forceRefresh: false);
        try {
          final savedDevice = pairedDevices.firstWhere(
            (d) =>
                d.address == savedAddress ||
                (savedName != null && d.name == savedName),
          );
          return await connect(savedDevice);
        } catch (e) {
          // الطابعة غير موجودة في paired devices
        }
      }

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
  bool get isConnected {
    return _connectedDevice != null;
  }

  /// التحقق من حالة الاتصال من BluetoothPrintPlus مباشرة (async)
  /// Check connection status directly from BluetoothPrintPlus (async)
  Future<bool> getIsConnectedAsync() async {
    try {
      final currentState = await BluetoothPrintPlus.connectState
          .firstWhere(
            (s) =>
                s == ConnectState.connected || s == ConnectState.disconnected,
          )
          .timeout(
            const Duration(seconds: 5),
            onTimeout: () => ConnectState.disconnected,
          );
      return currentState == ConnectState.connected;
    } catch (e) {
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
    _bleController.dispose();
  }
}
