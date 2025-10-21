import 'dart:typed_data';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';

/// خدمة طابعة SUNMI الحقيقية
class SunmiPrinterService {
  static bool _isInitialized = false;
  static bool _isConnected = false;

  /// طلب الصلاحيات المطلوبة
  static Future<bool> requestPermissions() async {
    try {
      // طلب صلاحيات Bluetooth
      final bluetoothConnectStatus = await Permission.bluetoothConnect
          .request();
      final bluetoothScanStatus = await Permission.bluetoothScan.request();

      // طلب صلاحيات التخزين
      final storageStatus = await Permission.storage.request();

      // طلب صلاحيات الكاميرا (لطباعة QR Code)
      final cameraStatus = await Permission.camera.request();

      // طلب صلاحيات الهاتف
      final phoneStatus = await Permission.phone.request();

      print('Bluetooth Connect: $bluetoothConnectStatus');
      print('Bluetooth Scan: $bluetoothScanStatus');
      print('Storage: $storageStatus');
      print('Camera: $cameraStatus');
      print('Phone: $phoneStatus');

      return bluetoothConnectStatus.isGranted &&
          bluetoothScanStatus.isGranted &&
          storageStatus.isGranted;
    } catch (e) {
      print('خطأ في طلب الصلاحيات: $e');
      return false;
    }
  }

  /// تهيئة طابعة SUNMI
  static Future<bool> initializePrinter() async {
    try {
      // طلب الصلاحيات أولاً
      final permissionsGranted = await requestPermissions();
      if (!permissionsGranted) {
        print('الصلاحيات غير ممنوحة لطابعة SUNMI');
        return false;
      }

      await SunmiPrinter.initPrinter();
      _isInitialized = true;
      _isConnected = true;
      return true;
    } catch (e) {
      _isInitialized = false;
      _isConnected = false;
      print('خطأ في تهيئة طابعة SUNMI: $e');
      return false;
    }
  }

  /// فحص حالة الطابعة
  static Future<bool> isPrinterConnected() async {
    try {
      if (!_isInitialized) {
        return await initializePrinter();
      }
      return _isConnected;
    } catch (e) {
      print('خطأ في فحص حالة الطابعة: $e');
      return false;
    }
  }

  /// طباعة نص بسيط
  static Future<bool> printText(String text) async {
    try {
      if (!await isPrinterConnected()) {
        throw Exception('طابعة SUNMI غير متصلة');
      }

      await SunmiPrinter.printText(text);
      return true;
    } catch (e) {
      print('خطأ في طباعة النص: $e');
      return false;
    }
  }

  /// طباعة إيصال حراري كامل
  static Future<bool> printReceipt({
    required String invoiceNumber,
    required String date,
    required String customerName,
    required List<Map<String, dynamic>> items,
    required double subtotal,
    required double tax,
    required double total,
  }) async {
    try {
      if (!await isPrinterConnected()) {
        throw Exception('طابعة SUNMI غير متصلة');
      }

      // بدء المعاملة (إذا كان متوفراً)
      // await SunmiPrinter.startTransaction();

      // ===== رأس الفاتورة الاحترافي =====
      await SunmiPrinter.printText('═══════════════════════════\n');
      await SunmiPrinter.printText('        INVOTEK POS\n');
      await SunmiPrinter.printText('     نظام نقاط البيع\n');
      await SunmiPrinter.printText('═══════════════════════════\n');
      await SunmiPrinter.lineWrap(1);

      // معلومات الشركة
      await SunmiPrinter.printText('شركة Invotek للتكنولوجيا\n');
      await SunmiPrinter.printText('رقم السجل: 123456789\n');
      await SunmiPrinter.printText('الضريبة: 15%\n');
      await SunmiPrinter.printText('─────────────────────────\n');
      await SunmiPrinter.lineWrap(1);

      // معلومات الفاتورة
      await SunmiPrinter.printText('فاتورة ضريبية\n');
      await SunmiPrinter.printText('رقم الفاتورة: $invoiceNumber\n');
      await SunmiPrinter.printText('التاريخ: $date\n');
      await SunmiPrinter.printText(
        'الوقت: ${DateTime.now().toString().split(' ')[1].split('.')[0]}\n',
      );
      await SunmiPrinter.printText('─────────────────────────\n');
      await SunmiPrinter.lineWrap(1);

      // معلومات العميل
      await SunmiPrinter.printText('بيانات العميل:\n');
      await SunmiPrinter.printText('الاسم: $customerName\n');
      await SunmiPrinter.printText('─────────────────────────\n');
      await SunmiPrinter.lineWrap(1);

      // ===== جدول العناصر الاحترافي =====
      await SunmiPrinter.printText('تفاصيل الطلب:\n');
      await SunmiPrinter.printText('─────────────────────────\n');

      for (var item in items) {
        // اسم المنتج
        await SunmiPrinter.printText('${item['name']}\n');

        // تفاصيل الكمية والسعر
        final quantity = item['quantity'].toString();
        final price = item['price'].toString();
        final itemTotal = item['total'].toString();

        await SunmiPrinter.printText(
          '  الكمية: $quantity × $price = $itemTotal\n',
        );
        await SunmiPrinter.lineWrap(1);
      }

      await SunmiPrinter.printText('─────────────────────────\n');
      await SunmiPrinter.lineWrap(1);

      // ===== المجاميع الاحترافية =====
      await SunmiPrinter.printText('المجاميع:\n');
      await SunmiPrinter.printText('المجموع الفرعي: $subtotal ر.س\n');
      await SunmiPrinter.printText('الضريبة (15%): $tax ر.س\n');
      await SunmiPrinter.printText('─────────────────────────\n');
      await SunmiPrinter.printText('المجموع الكلي: $total ر.س\n');
      await SunmiPrinter.printText('═══════════════════════════\n');
      await SunmiPrinter.lineWrap(2);

      // ===== رسالة شكر احترافية =====
      await SunmiPrinter.printText('شكراً لتعاملكم معنا\n');
      await SunmiPrinter.printText('نقدر ثقتكم في خدماتنا\n');
      await SunmiPrinter.printText('─────────────────────────\n');
      await SunmiPrinter.printText('للاستفسارات:\n');
      await SunmiPrinter.printText('📞 +966 50 123 4567\n');
      await SunmiPrinter.printText('📧 info@invotek.com\n');
      await SunmiPrinter.printText('🌐 www.invotek.com\n');
      await SunmiPrinter.printText('═══════════════════════════\n');
      await SunmiPrinter.lineWrap(3);

      // إنهاء المعاملة (إذا كان متوفراً)
      // await SunmiPrinter.commitTransaction();

      return true;
    } catch (e) {
      print('خطأ في طباعة الإيصال: $e');
      return false;
    }
  }

  /// طباعة اختبار
  static Future<bool> printTestPage() async {
    try {
      if (!await isPrinterConnected()) {
        throw Exception('طابعة SUNMI غير متصلة');
      }

      // await SunmiPrinter.startTransaction();

      await SunmiPrinter.printText('اختبار طابعة SUNMI\n');
      await SunmiPrinter.printText('==================\n');
      await SunmiPrinter.lineWrap(1);

      await SunmiPrinter.printText('Invotek POS System\n');
      await SunmiPrinter.printText(
        'تاريخ: ${DateTime.now().toString().split(' ')[0]}\n',
      );
      await SunmiPrinter.printText(
        'وقت: ${DateTime.now().toString().split(' ')[1].split('.')[0]}\n',
      );
      await SunmiPrinter.lineWrap(2);

      await SunmiPrinter.printText('تم اختبار الطابعة بنجاح\n');
      await SunmiPrinter.printText('الطابعة تعمل بشكل صحيح\n');

      // await SunmiPrinter.commitTransaction();

      return true;
    } catch (e) {
      print('خطأ في طباعة صفحة الاختبار: $e');
      return false;
    }
  }

  /// طباعة QR Code
  static Future<bool> printQRCode(String data) async {
    try {
      if (!await isPrinterConnected()) {
        throw Exception('طابعة SUNMI غير متصلة');
      }

      await SunmiPrinter.printQRCode(data);
      return true;
    } catch (e) {
      print('خطأ في طباعة QR Code: $e');
      return false;
    }
  }

  /// طباعة صورة
  static Future<bool> printImage(Uint8List imageBytes) async {
    try {
      if (!await isPrinterConnected()) {
        throw Exception('طابعة SUNMI غير متصلة');
      }

      await SunmiPrinter.printImage(imageBytes);
      return true;
    } catch (e) {
      print('خطأ في طباعة الصورة: $e');
      return false;
    }
  }

  /// قطع الورق
  static Future<bool> cutPaper() async {
    try {
      if (!await isPrinterConnected()) {
        throw Exception('طابعة SUNMI غير متصلة');
      }

      await SunmiPrinter.cutPaper();
      return true;
    } catch (e) {
      print('خطأ في قطع الورق: $e');
      return false;
    }
  }

  /// فتح درج النقود
  static Future<bool> openCashDrawer() async {
    try {
      if (!await isPrinterConnected()) {
        throw Exception('طابعة SUNMI غير متصلة');
      }

      // await SunmiPrinter.openDrawer();
      return true;
    } catch (e) {
      print('خطأ في فتح درج النقود: $e');
      return false;
    }
  }

  /// الحصول على معلومات الطابعة
  static Future<Map<String, dynamic>> getPrinterInfo() async {
    try {
      if (!await isPrinterConnected()) {
        return {'error': 'طابعة SUNMI غير متصلة'};
      }

      // محاولة الحصول على معلومات الطابعة
      return {
        'status': 'connected',
        'type': 'SUNMI',
        'initialized': _isInitialized,
        'timestamp': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      return {
        'error': 'خطأ في الحصول على معلومات الطابعة: $e',
        'status': 'error',
      };
    }
  }

  /// إعادة تعيين الطابعة
  static Future<bool> resetPrinter() async {
    try {
      _isInitialized = false;
      _isConnected = false;
      return await initializePrinter();
    } catch (e) {
      print('خطأ في إعادة تعيين الطابعة: $e');
      return false;
    }
  }

  /// طباعة QR Code
  static Future<bool> printQRCodeData(String data, String label) async {
    try {
      if (!await isPrinterConnected()) {
        throw Exception('طابعة SUNMI غير متصلة');
      }

      await SunmiPrinter.printText('$label\n');
      await SunmiPrinter.printText('==================\n');
      await SunmiPrinter.lineWrap(1);

      // طباعة QR Code (إذا كان متوفراً في API)
      // await SunmiPrinter.printQRCode(data); // قد لا يكون متوفراً في الإصدار الحالي

      // بديل: طباعة النص كـ QR Code
      await SunmiPrinter.printText('QR Code Data: $data\n');
      await SunmiPrinter.lineWrap(2);

      return true;
    } catch (e) {
      print('خطأ في طباعة QR Code: $e');
      return false;
    }
  }
}
