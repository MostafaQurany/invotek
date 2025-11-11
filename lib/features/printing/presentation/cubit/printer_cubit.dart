import 'dart:async';
import 'dart:typed_data';

import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';

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
  Timer? _connectionPollingTimer;
  bool _isInitialized = false;
  bool _isPollingActive = false; // لتتبع حالة polling

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
  void _listenToConnection() {
    _connectionSubscription?.cancel();
    _connectionSubscription = _printerService.connectionState$.listen((
      isConnected,
    ) {
      if (isConnected) {
        print(
          "The connected device is ====================================================$isConnected",
        );
        final device = _printerService.connectedDevice;
        if (device != null) {
          print(
            "The connected device Name is ====================================================${device.name}",
          );
          emit(PrinterState.connected(device));
        }
      } else {
        emit(const PrinterState.disconnected());
      }
    });
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

  /// بدء polling ذكي للتحقق من حالة الاتصال
  /// Polling فقط عندما يكون هناك اتصال نشط
  void _startConnectionPolling() {
    _connectionPollingTimer?.cancel();

    // Polling كل 3 ثواني (أقل استهلاكاً للبطارية)
    _connectionPollingTimer = Timer.periodic(
      const Duration(seconds: 3),
      (_) => _pollConnectionState(),
    );
  }

  /// التحقق من حالة الاتصال بشكل دوري
  Future<void> _pollConnectionState() async {
    try {
      final isConnected = await _printerService.checkConnection();
      final device = _printerService.connectedDevice;

      final currentState = state;

      if (isConnected && device != null) {
        // إذا كان متصلاً، نتحقق من أن الحالة الحالية connected
        if (!currentState.maybeWhen(
          connected: (_) => true,
          orElse: () => false,
        )) {
          emit(PrinterState.connected(device));
        }
        _isPollingActive = true;
      } else {
        // إذا لم يكن متصلاً، نتحقق من أن الحالة الحالية disconnected
        if (!currentState.maybeWhen(
          disconnected: () => true,
          orElse: () => false,
        )) {
          emit(const PrinterState.disconnected());
        }

        // إذا لم يكن هناك اتصال، نوقف polling مؤقتاً
        // ونعيد تشغيله بعد 10 ثواني للتحقق مرة أخرى
        if (_isPollingActive) {
          _isPollingActive = false;
          _connectionPollingTimer?.cancel();

          // إعادة تشغيل polling بعد 10 ثواني
          Future.delayed(const Duration(seconds: 10), () {
            if (!_isPollingActive) {
              _startConnectionPolling();
            }
          });
        }
      }
    } catch (e) {
      // تجاهل الأخطاء في polling
    }
  }

  /// الاتصال بجهاز
  Future<void> connect(BluetoothDevice device) async {
    try {
      final success = await _printerService.connectDevice(device);
      await Future.delayed(const Duration(milliseconds: 500));

      final isCurrentlyConnected = await _printerService.checkConnection();
      final currentDevice = _printerService.connectedDevice;

      if (isCurrentlyConnected && currentDevice != null) {
        emit(PrinterState.connected(currentDevice));
        // إعادة تشغيل polling عند الاتصال
        if (!_isPollingActive) {
          _startConnectionPolling();
        }
      } else if (success) {
        emit(PrinterState.connected(device));
        if (!_isPollingActive) {
          _startConnectionPolling();
        }
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
    _connectionPollingTimer?.cancel();
    _scanSubscription?.cancel();
    _connectionSubscription?.cancel();
    return super.close();
  }
}
