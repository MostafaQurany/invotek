import 'package:flutter_net_printer/flutter_net_printer.dart';
import 'package:flutter_net_printer/model/network_device.dart';

class ThermalPrinterService {
  static final FlutterNetPrinter _netPrinter = FlutterNetPrinter();

  /// اكتشاف الطابعات على الشبكة
  static Future<List<NetworkDevice>> discoverNetworkPrinters() async {
    try {
      final stream = _netPrinter.discoverPrinters(
        port: 9100,
        timeout: Duration(seconds: 3),
      );

      List<NetworkDevice> printers = [];
      await for (var deviceList in stream) {
        printers = deviceList;
        break; // أخذ أول نتيجة
      }
      return printers;
    } catch (e) {
      print('خطأ في اكتشاف الطابعات: $e');
      return [];
    }
  }

  /// اختبار الاتصال بالطابعة
  static Future<bool> testConnection(String ip, int port) async {
    try {
      // محاكاة اختبار الاتصال
      await Future.delayed(Duration(seconds: 1));
      return true; // للاختبار فقط
    } catch (e) {
      print('خطأ في اختبار الاتصال: $e');
      return false;
    }
  }

  /// طباعة إيصال حراري
  static Future<void> printReceipt({
    required String content,
    required String printerIp,
    int port = 9100,
  }) async {
    try {
      // محاكاة الطباعة
      print('طباعة الإيصال:');
      print(content);
      await Future.delayed(Duration(seconds: 2));
    } catch (e) {
      print('خطأ في طباعة الإيصال: $e');
      throw Exception('فشل في طباعة الإيصال: $e');
    }
  }

  /// تنسيق بيانات الفاتورة للطباعة الحرارية
  static String formatInvoiceForThermalPrint({
    required Map<String, dynamic> invoiceData,
    required List<Map<String, dynamic>> items,
  }) {
    final buffer = StringBuffer();

    // Header
    buffer.writeln('فاتورة ضريبية');
    buffer.writeln('================================');
    buffer.writeln('رقم الفاتورة: ${invoiceData['invoiceNumber'] ?? ''}');
    buffer.writeln('التاريخ: ${invoiceData['issueDate'] ?? ''}');
    buffer.writeln('العميل: ${invoiceData['customerName'] ?? ''}');
    buffer.writeln('================================');

    // Items Header
    buffer.writeln('المنتج                    الكمية   السعر   الإجمالي');
    buffer.writeln('--------------------------------');

    // Items
    for (var item in items) {
      final name = item['name'] ?? '';
      final quantity = item['quantity'] ?? '';
      final price = item['price'] ?? '';
      final total = item['total'] ?? '';

      buffer.writeln('$name                    $quantity   $price   $total');
    }

    buffer.writeln('--------------------------------');
    buffer.writeln('المجموع الفرعي: ${invoiceData['subtotal'] ?? '0'}');
    buffer.writeln('الضريبة: ${invoiceData['taxAmount'] ?? '0'}');
    buffer.writeln('الخصم: ${invoiceData['discount'] ?? '0'}');
    buffer.writeln('================================');
    buffer.writeln('المجموع الكلي: ${invoiceData['total'] ?? '0'}');
    buffer.writeln('================================');
    buffer.writeln('شكراً لتعاملكم معنا');
    buffer.writeln('');
    buffer.writeln('');

    return buffer.toString();
  }
}


