import 'dart:async';

import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/printing/printing.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// خدمة الطباعة الموحدة
/// Unified Printer Service
class PrinterService {
  final PosPrinterController _controller;
  bool _isInitialized = false;

  PrinterService(this._controller);

  /// تهيئة الخدمة
  Future<void> initialize() async {
    if (_isInitialized) {
      print('PrinterService: Already initialized');
      return;
    }

    try {
      print('PrinterService: Initializing...');
      await _controller.initialize(
        onConnected: (device) {
          print('PrinterService: Connected to ${device.name}');
        },
        onDisconnected: () {
          print('PrinterService: Disconnected');
        },
      );

      _isInitialized = true;
      print('PrinterService: Initialization complete');
    } catch (e) {
      print('PrinterService: Initialization error: $e');
      _isInitialized = true; // نضع true حتى لا نحاول مرة أخرى
      rethrow;
    }
  }

  /// Streams
  Stream<List<BluetoothDevice>> get scanResults$ => _controller.scanResults$;

  /// التحقق من حالة الاتصال
  bool get isConnected => _controller.isConnected;

  /// الحصول على الجهاز المتصل
  BluetoothDevice? get connectedDevice => _controller.connectedDevice;

  /// التحقق من حالة الاتصال الحالية (بسيط - بدون بحث)
  Future<bool> checkConnection() async {
    try {
      final currentState = await BluetoothPrintPlus.connectState.first.timeout(
        const Duration(milliseconds: 500),
        onTimeout: () => ConnectState.disconnected,
      );
      return currentState == ConnectState.connected;
    } catch (e) {
      print('checkConnection error: $e');
      return false;
    }
  }

  /// الاتصال بجهاز
  Future<bool> connectDevice(BluetoothDevice device) async {
    try {
      return await _controller.connect(device);
    } catch (e) {
      print('connectDevice error: $e');
      return false;
    }
  }

  /// قطع الاتصال
  Future<void> disconnectDevice() async {
    try {
      await _controller.disconnect();
    } catch (e) {
      print('disconnectDevice error: $e');
    }
  }

  /// بدء البحث عن الأجهزة
  Future<void> startScan({Duration? timeout}) async {
    try {
      await _controller.startScan(
        timeout: timeout ?? const Duration(seconds: 10),
      );
    } catch (e) {
      print('startScan error: $e');
    }
  }

  /// إيقاف البحث
  void stopScan() {
    try {
      _controller.stopScan();
    } catch (e) {
      print('stopScan error: $e');
    }
  }

  /// الحصول على الأجهزة المقترنة
  Future<List<BluetoothDevice>> getPairedDevices({
    bool forceRefresh = false,
  }) async {
    try {
      return await _controller.getPairedDevices(forceRefresh: forceRefresh);
    } catch (e) {
      print('getPairedDevices error: $e');
      return [];
    }
  }

  /// طباعة فاتورة
  Future<bool> printInvoice({
    required InvoiceModel invoice,
    PaperPreset? paperWidth,
    int? sliceHeight,
    InvoiceLanguage? language,
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
      print('printInvoice: Not connected');
      return false;
    }

    try {
      // الحصول على الإعدادات المحفوظة
      final prefs = await SharedPreferences.getInstance();
      final paperWidthStr = prefs.getString('printer_paper_width');
      final savedSliceHeight = prefs.getInt('printer_slice_height') ?? 900;
      final fontFamily = prefs.getString('printer_font_family') ?? 'Cairo';
      final languageStr = prefs.getString('printer_invoice_language');

      PaperPreset finalPaperWidth = paperWidth ?? PaperPreset.mm80;
      if (paperWidth == null && paperWidthStr != null) {
        finalPaperWidth = PaperPreset.values.firstWhere(
          (e) => e.toString() == paperWidthStr,
          orElse: () => PaperPreset.mm80,
        );
      }

      InvoiceLanguage finalLanguage = language ?? InvoiceLanguage.arabic;
      if (language == null && languageStr != null) {
        finalLanguage = InvoiceLanguage.values.firstWhere(
          (e) => e.toString() == languageStr,
          orElse: () => InvoiceLanguage.arabic,
        );
      }

      final finalSliceHeight = sliceHeight ?? savedSliceHeight;

      // الطباعة باستخدام القالب الجديد
      final success = await _controller.printTaxInvoice(
        invoice: invoice,
        invoiceLanguage: finalLanguage,
        paperWidth: finalPaperWidth,
        fontFamily: fontFamily,
        sliceHeight: finalSliceHeight,
        feedLines: 2,
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

      return success;
    } catch (e) {
      print('printInvoice error: $e');
      return false;
    }
  }

  /// معاينة فاتورة
  Future<List<Uint8List>> previewInvoice({
    required InvoiceModel invoice,
    PaperPreset? paperWidth,
    int? sliceHeight,
    InvoiceLanguage? language,
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
    try {
      final prefs = await SharedPreferences.getInstance();
      final paperWidthStr = prefs.getString('printer_paper_width');
      final savedSliceHeight = prefs.getInt('printer_slice_height') ?? 900;
      final fontFamily = prefs.getString('printer_font_family') ?? 'Cairo';
      final languageStr = prefs.getString('printer_invoice_language');

      PaperPreset finalPaperWidth = paperWidth ?? PaperPreset.mm80;
      if (paperWidth == null && paperWidthStr != null) {
        finalPaperWidth = PaperPreset.values.firstWhere(
          (e) => e.toString() == paperWidthStr,
          orElse: () => PaperPreset.mm80,
        );
      }

      InvoiceLanguage finalLanguage = language ?? InvoiceLanguage.arabic;
      if (language == null && languageStr != null) {
        finalLanguage = InvoiceLanguage.values.firstWhere(
          (e) => e.toString() == languageStr,
          orElse: () => InvoiceLanguage.arabic,
        );
      }

      final finalSliceHeight = sliceHeight ?? savedSliceHeight;

      return await _controller.previewTaxInvoice(
        invoice: invoice,
        invoiceLanguage: finalLanguage,
        paperWidth: finalPaperWidth,
        fontFamily: fontFamily,
        sliceHeight: finalSliceHeight,
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
    } catch (e) {
      print('previewInvoice error: $e');
      return [];
    }
  }

  /// تحديث الإعدادات
  void updateSettings({
    PaperPreset? paperWidth,
    String? fontFamily,
    int? sliceHeight,
    InvoiceLanguage? invoiceLanguage,
  }) {
    _controller.updateSettings(
      paperWidth: paperWidth,
      fontFamily: fontFamily,
      sliceHeight: sliceHeight,
      invoiceLanguage: invoiceLanguage,
    );
  }
}
