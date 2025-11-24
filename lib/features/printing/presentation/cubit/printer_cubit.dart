import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter/scheduler.dart';
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
  bool _isPrintCancelled = false;
  Completer<void>? _cancelCompleter;

  PrinterCubit(this._printerService) : super(const PrinterState.initial()) {
    // لا نبدأ التهيئة تلقائياً - ننتظر حتى نحتاجها فعلاً
    // هذا يمنع مشاكل EventSink null عند إغلاق الشاشة
  }

  /// تهيئة الـ Cubit (يتم استدعاؤها عند الحاجة فقط)
  Future<void> _init() async {
    if (_isInitialized) {
      // إذا تم التهيئة بالفعل، لا حاجة لفعل شيء
      return;
    }

    // التحقق من أن الـ Cubit لم يتم إغلاقه
    if (isClosed) {
      print('PrinterCubit: Cannot initialize, cubit is closed');
      return;
    }

    try {
      await _printerService.initialize();

      // التحقق مرة أخرى من أن الـ Cubit لم يتم إغلاقه
      if (isClosed) {
        print('PrinterCubit: Cubit closed during initialization');
        return;
      }

      _listenToConnection();
      _listenToScanResults();

      // لا حاجة للتحقق من الاتصال هنا - سيتم التحقق عند الحاجة
      // checkConnection() نفسها تستدعي _ensureInitialized() إذا لزم الأمر

      _isInitialized = true; // وضع علامة التهيئة
    } catch (e) {
      if (!isClosed) {
        emit(PrinterState.error('خطأ في التهيئة: $e'));
      }
      _isInitialized = true; // حتى في حالة الخطأ
    }
  }

  /// التأكد من التهيئة قبل استخدام الخدمة
  Future<void> _ensureInitialized() async {
    if (!_isInitialized) {
      await _init();
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
    // التحقق من أن الـ Cubit لم يتم إغلاقه
    if (isClosed) {
      return;
    }

    try {
      // التأكد من التهيئة قبل التحقق من الاتصال
      await _ensureInitialized();

      // التحقق مرة أخرى من أن الـ Cubit لم يتم إغلاقه
      if (isClosed) {
        return;
      }

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
      // معالجة الأخطاء بشكل آمن - لا نريد إغلاق التطبيق
      print('PrinterCubit.checkConnection error: $e');
      if (!isClosed) {
        emit(const PrinterState.disconnected());
      }
    }
  }

  /// الاتصال بجهاز
  Future<void> connect(BluetoothDevice device) async {
    // التحقق من أن الـ Cubit لم يتم إغلاقه
    if (isClosed) {
      print('PrinterCubit: Cannot connect, cubit is closed');
      return;
    }

    try {
      // التأكد من التهيئة قبل الاتصال
      await _ensureInitialized();

      // التحقق مرة أخرى من أن الـ Cubit لم يتم إغلاقه
      if (isClosed) {
        return;
      }

      // إرسال حالة connecting لمنع إغلاق الشاشة
      emit(PrinterState.connecting(device));

      final success = await _printerService.connectDevice(device);

      // التحقق مرة أخرى من أن الـ Cubit لم يتم إغلاقه
      if (isClosed) {
        print('PrinterCubit: Cubit closed during connection, aborting');
        return;
      }

      // التحقق من حالة الاتصال بعد محاولة الاتصال
      await Future.delayed(const Duration(milliseconds: 500));

      // التحقق مرة أخرى من أن الـ Cubit لم يتم إغلاقه
      if (isClosed) {
        print('PrinterCubit: Cubit closed after delay, aborting');
        return;
      }

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
      // التحقق من أن الـ Cubit لم يتم إغلاقه قبل emit
      if (!isClosed) {
        emit(PrinterState.error('خطأ في الاتصال: $e'));
      } else {
        print('PrinterCubit: Error during connection but cubit is closed: $e');
      }
    }
  }

  /// قطع الاتصال
  Future<void> disconnect() async {
    if (isClosed) {
      return;
    }

    try {
      await _printerService.disconnectDevice();
      if (!isClosed) {
        emit(const PrinterState.disconnected());
      }
    } catch (e) {
      if (!isClosed) {
        emit(PrinterState.error('خطأ في قطع الاتصال: $e'));
      }
    }
  }

  /// بدء البحث عن الأجهزة
  Future<void> startScan({Duration? timeout}) async {
    // التحقق من أن الـ Cubit لم يتم إغلاقه
    if (isClosed) {
      return;
    }

    try {
      // التأكد من التهيئة قبل البحث
      await _ensureInitialized();

      // التحقق مرة أخرى من أن الـ Cubit لم يتم إغلاقه
      if (isClosed) {
        return;
      }

      emit(const PrinterState.scanning([]));
      await _printerService.startScan(timeout: timeout);
    } catch (e) {
      if (!isClosed) {
        emit(PrinterState.error('خطأ في البحث: $e'));
      }
    }
  }

  /// إيقاف البحث
  void stopScan() {
    if (isClosed) {
      return;
    }

    try {
      _printerService.stopScan();
      // إذا كان في حالة scanning، نعود للحالة السابقة
      if (!isClosed) {
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
    } catch (e) {
      print('PrinterCubit.stopScan error: $e');
    }
  }

  /// طباعة فاتورة
  Future<bool> printInvoice(
    InvoiceModel invoice, {
    PaperPreset? paperWidth,
    int? sliceHeight,
    InvoiceLanguage? language,
  }) async {
    _isPrintCancelled = false;
    _cancelCompleter = Completer<void>();

    try {
      if (!_printerService.isConnected) {
        emit(const PrinterState.error('الطابعة غير متصلة'));
        return false;
      }

      // التحقق من الإلغاء
      if (_isPrintCancelled) {
        emit(const PrinterState.cancelling());
        return false;
      }

      // المرحلة 1: تجهيز القالب
      emit(const PrinterState.processingTemplate());
      await _yieldToUI();

      if (_isPrintCancelled) {
        emit(const PrinterState.cancelling());
        return false;
      }

      // المرحلة 2: الرسم مع التقدم
      emit(const PrinterState.renderingProgress(0.0));
      await _yieldToUI();

      // المرحلة 3: الإرسال مع التقدم
      emit(const PrinterState.sendingToPrinter());
      await _yieldToUI();

      // Timeout للرسم: 30 ثانية، للإرسال: 60 ثانية
      final success = await _printerService
          .printInvoice(
            invoice: invoice,
            paperWidth: paperWidth,
            sliceHeight: sliceHeight,
            language: language,
            onRenderingProgress: (progress) {
              if (!isClosed && !_isPrintCancelled) {
                emit(PrinterState.renderingProgress(progress));
              }
            },
            onSendingProgress: (progress) {
              if (!isClosed && !_isPrintCancelled) {
                emit(PrinterState.sendingProgress(progress));
              }
            },
            shouldCancel: () => _isPrintCancelled,
          )
          .timeout(
            const Duration(seconds: 90), // إجمالي 90 ثانية للرسم والإرسال
            onTimeout: () {
              throw TimeoutException(
                'انتهت مهلة العملية',
                const Duration(seconds: 90),
              );
            },
          );

      if (_isPrintCancelled) {
        emit(const PrinterState.cancelling());
        return false;
      }

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
    } on TimeoutException catch (e) {
      if (!isClosed) {
        if (_isPrintCancelled) {
          emit(const PrinterState.cancelling());
        } else {
          emit(PrinterState.error('انتهت مهلة العملية: ${e.message}'));
        }
      }
      return false;
    } catch (e) {
      if (!isClosed) {
        if (_isPrintCancelled) {
          emit(const PrinterState.cancelling());
        } else {
          emit(PrinterState.error('خطأ في الطباعة: $e'));
        }
      }
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

  /// إلغاء عملية الطباعة
  void cancelPrint() {
    _isPrintCancelled = true;
    _cancelCompleter?.complete();
    if (!isClosed) {
      emit(const PrinterState.cancelling());
    }
  }

  /// إعطاء UI فرصة للتنفس
  Future<void> _yieldToUI() async {
    await Future.microtask(() {});
    await SchedulerBinding.instance.endOfFrame;
  }

  @override
  Future<void> close() {
    _scanSubscription?.cancel();
    _connectionSubscription?.cancel();
    _cancelCompleter?.complete();
    return super.close();
  }

  /*?==================================================*/

  // Save the last device connected to the local
}
