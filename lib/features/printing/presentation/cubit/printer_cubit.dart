import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/models/invoice_language.dart';
import '../../core/services/printer_service.dart';
import '../../core/utils/paper_preset.dart';
import 'printer_state.dart';

/// Cubit لإدارة حالة الطباعة
/// Printer Cubit for managing printing state
class PrinterCubit extends Cubit<PrinterState> {
  final PrinterService _printerService;
  StreamSubscription<List<BluetoothDevice>>? _scanSubscription;
  StreamSubscription<bool>? _connectionSubscription;
  bool _isInitialized = false;

  PrinterCubit(this._printerService) : super(const PrinterState.initial()) {
    _init();
  }

  /// تهيئة الـ Cubit
  Future<void> _init() async {
    if (_isInitialized) {
      // إذا تم التهيئة بالفعل، فقط نتحقق من الاتصال
      await checkConnection();
      return;
    }

    try {
      await _printerService.initialize();
      _listenToConnection();
      _listenToScanResults();

      // التحقق من حالة الاتصال الحالية
      await checkConnection();

      _isInitialized = true; // وضع علامة التهيئة
    } catch (e) {
      emit(PrinterState.error('خطأ في التهيئة: $e'));
      _isInitialized = true; // حتى في حالة الخطأ
    }
  }

  /// الاستماع لتحديثات حالة الاتصال
  /// تم تبسيطه - لا يستخدم stream الآن
  void _listenToConnection() {
    // لا حاجة لـ stream listener - يتم التحقق من الاتصال عند الحاجة
    _connectionSubscription?.cancel();
  }

  /// الاستماع لنتائج البحث
  void _listenToScanResults() {
    _scanSubscription?.cancel();
    _scanSubscription = _printerService.scanResults$.listen((devices) {
      if (state.maybeWhen(scanning: (_) => true, orElse: () => false)) {
        emit(PrinterState.scanning(devices));
      }
    });
  }

  /// التحقق من حالة الاتصال الحالية
  Future<void> checkConnection() async {
    try {
      final isConnected = await _printerService.checkConnection();
      if (isConnected) {
        final device = _printerService.connectedDevice;
        if (device != null) {
          emit(PrinterState.connected(device));
        } else {
          emit(const PrinterState.disconnected());
        }
      } else {
        emit(const PrinterState.disconnected());
      }
    } catch (e) {
      emit(PrinterState.error('خطأ في التحقق من الاتصال: $e'));
    }
  }

  /// الاتصال بجهاز
  Future<void> connect(BluetoothDevice device) async {
    try {
      final success = await _printerService.connectDevice(device);
      
      // التحقق من حالة الاتصال بعد محاولة الاتصال
      await Future.delayed(const Duration(milliseconds: 500));
      final isCurrentlyConnected = await _printerService.checkConnection();
      final currentDevice = _printerService.connectedDevice;

      if (isCurrentlyConnected && currentDevice != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(
          "BlUE_DEVICE",
          jsonEncode(currentDevice.toJson()),
        );
        emit(PrinterState.connected(currentDevice));
      } else if (success) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("BlUE_DEVICE", jsonEncode(device.toJson()));
        emit(PrinterState.connected(device));
      } else {
        emit(const PrinterState.error('فشل الاتصال بالطابعة'));
      }
    } catch (e) {
      emit(PrinterState.error('خطأ في الاتصال: $e'));
    }
  }

  /// قطع الاتصال
  Future<void> disconnect() async {
    try {
      await _printerService.disconnectDevice();
      emit(const PrinterState.disconnected());
    } catch (e) {
      emit(PrinterState.error('خطأ في قطع الاتصال: $e'));
    }
  }

  /// بدء البحث عن الأجهزة
  Future<void> startScan({Duration? timeout}) async {
    try {
      emit(const PrinterState.scanning([]));
      await _printerService.startScan(timeout: timeout);
    } catch (e) {
      emit(PrinterState.error('خطأ في البحث: $e'));
    }
  }

  /// إيقاف البحث
  void stopScan() {
    _printerService.stopScan();
    // إذا كان في حالة scanning، نعود للحالة السابقة
    state.maybeWhen(
      scanning: (_) {
        final isConnected = _printerService.isConnected;
        if (isConnected) {
          final device = _printerService.connectedDevice;
          if (device != null) {
            emit(PrinterState.connected(device));
          } else {
            emit(const PrinterState.disconnected());
          }
        } else {
          emit(const PrinterState.disconnected());
        }
      },
      orElse: () {},
    );
  }

  /// طباعة فاتورة
  Future<bool> printInvoice(
    InvoiceModel invoice, {
    PaperPreset? paperWidth,
    int? sliceHeight,
    InvoiceLanguage? language,
  }) async {
    try {
      if (!_printerService.isConnected) {
        emit(const PrinterState.error('الطابعة غير متصلة'));
        return false;
      }

      emit(const PrinterState.printing());

      final success = await _printerService.printInvoice(
        invoice: invoice,
        paperWidth: paperWidth,
        sliceHeight: sliceHeight,
        language: language,
      );

      if (success) {
        // العودة للحالة السابقة بعد الطباعة
        final device = _printerService.connectedDevice;
        if (device != null) {
          emit(PrinterState.connected(device));
        } else {
          emit(const PrinterState.disconnected());
        }
        return true;
      } else {
        emit(const PrinterState.error('فشلت عملية الطباعة'));
        return false;
      }
    } catch (e) {
      emit(PrinterState.error('خطأ في الطباعة: $e'));
      return false;
    }
  }

  /// معاينة فاتورة
  Future<List<Uint8List>> previewInvoice(
    InvoiceModel invoice, {
    PaperPreset? paperWidth,
    int? sliceHeight,
    InvoiceLanguage? language,
  }) async {
    try {
      return await _printerService.previewInvoice(
        invoice: invoice,
        paperWidth: paperWidth,
        sliceHeight: sliceHeight,
        language: language,
      );
    } catch (e) {
      emit(PrinterState.error('خطأ في المعاينة: $e'));
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
    _printerService.updateSettings(
      paperWidth: paperWidth,
      fontFamily: fontFamily,
      sliceHeight: sliceHeight,
      invoiceLanguage: invoiceLanguage,
    );
  }

  /// الحصول على الأجهزة المقترنة
  Future<List<BluetoothDevice>> getPairedDevices({
    bool forceRefresh = false,
  }) async {
    return await _printerService.getPairedDevices(forceRefresh: forceRefresh);
  }

  /// Stream لنتائج البحث
  Stream<List<BluetoothDevice>> get scanResults$ =>
      _printerService.scanResults$;

  /// الحصول على حالة الاتصال
  bool get isConnected => _printerService.isConnected;

  /// الحصول على الجهاز المتصل
  BluetoothDevice? get connectedDevice => _printerService.connectedDevice;

  @override
  Future<void> close() {
    _scanSubscription?.cancel();
    _connectionSubscription?.cancel();
    return super.close();
  }

  /*?==================================================*/

  // Save the last device connected to the local
}
