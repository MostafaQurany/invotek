import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:invotek/features/printing/data/models/print_settings_model.dart';
import 'package:invotek/features/printing/services/printing_service.dart';
import 'package:invotek/features/printing/services/thermal_printer_service.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';

class PrintingController extends ChangeNotifier {
  PrintSettingsModel _settings = PrintSettingsModel();
  bool _isLoading = false;
  String _error = '';
  bool _isPrinting = false;
  String _printStatus = '';
  List<Map<String, dynamic>> _discoveredPrinters = [];

  // Getters
  PrintSettingsModel get settings => _settings;
  bool get isLoading => _isLoading;
  String get error => _error;
  bool get isPrinting => _isPrinting;
  String get printStatus => _printStatus;
  List<Map<String, dynamic>> get discoveredPrinters => _discoveredPrinters;

  /// تحميل الإعدادات المحفوظة
  Future<void> loadSettings() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final settingsJson = prefs.getString('print_settings');

      if (settingsJson != null) {
        final settingsMap = json.decode(settingsJson) as Map<String, dynamic>;
        _settings = PrintSettingsModel.fromJson(settingsMap);
      }
      _error = '';
    } catch (e) {
      _error = 'خطأ في تحميل الإعدادات: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  /// حفظ الإعدادات
  Future<void> saveSettings(PrintSettingsModel newSettings) async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        'print_settings',
        json.encode(newSettings.toJson()),
      );
      _settings = newSettings;
      _error = '';
    } catch (e) {
      _error = 'خطأ في حفظ الإعدادات: $e';
    }

    _isLoading = false;
    notifyListeners();
  }

  /// تحديث إعداد واحد
  Future<void> updateSetting(String key, dynamic value) async {
    final newSettings = _settings.copyWith();
    final settingsMap = newSettings.toJson();
    settingsMap[key] = value;

    final updatedSettings = PrintSettingsModel.fromJson(settingsMap);
    await saveSettings(updatedSettings);
  }

  /// مسح الخطأ
  void clearError() {
    _error = '';
    notifyListeners();
  }

  /// اكتشاف الطابعات
  Future<void> discoverPrinters() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final printers = await ThermalPrinterService.discoverNetworkPrinters();
      _discoveredPrinters = printers
          .map(
            (printer) => {
              'name': (printer as dynamic)?.name ?? 'طابعة غير معروفة',
              'address': (printer as dynamic)?.address ?? '',
              'port': (printer as dynamic)?.port ?? 9100,
              'type': 'network',
            },
          )
          .toList();
    } catch (e) {
      _error = 'خطأ في اكتشاف الطابعات: $e';
      _discoveredPrinters = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  /// اختبار الطابعة
  Future<bool> testPrinter() async {
    if (!_settings.isValid) {
      _error = 'إعدادات الطابعة غير صحيحة';
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      bool isConnected = false;

      if (_settings.connectionType == 'network') {
        isConnected = await ThermalPrinterService.testConnection(
          _settings.printerIp!,
          _settings.printerPort,
        );
      }
      // يمكن إضافة اختبارات أخرى للبلوتوث والـ USB

      if (isConnected) {
        _printStatus = 'الطابعة متاحة';
      } else {
        _error = 'الطابعة غير متاحة';
      }

      return isConnected;
    } catch (e) {
      _error = 'خطأ في اختبار الطابعة: $e';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// طباعة الفاتورة
  Future<bool> printInvoice(InvoiceModel invoice) async {
    if (!_settings.isValid) {
      _error = 'إعدادات الطابعة غير صحيحة';
      notifyListeners();
      return false;
    }

    _isPrinting = true;
    _printStatus = 'جاري الطباعة...';
    _error = '';
    notifyListeners();

    try {
      // تحضير بيانات الفاتورة
      final invoiceData = {
        'invoiceNumber': invoice.invoiceNumber,
        'issueDate': invoice.issueDate,
        'status': invoice.status,
        'customerName': invoice.customerName,
        'customerEmail': invoice.customer?.email,
        'customerPhone': invoice.customer?.phone,
        'subtotal': invoice.subtotal,
        'taxAmount': invoice.taxAmount,
        'discount': invoice.discount,
        'total': invoice.total,
      };

      final items =
          invoice.items
              ?.map(
                (item) => {
                  'name': item.name,
                  'quantity': item.quantity,
                  'price': item.price,
                  'total': item.total,
                },
              )
              .toList() ??
          [];

      if (_settings.isThermalPrinter) {
        // طباعة حرارية
        final content = ThermalPrinterService.formatInvoiceForThermalPrint(
          invoiceData: invoiceData,
          items: items,
        );

        await ThermalPrinterService.printReceipt(
          content: content,
          printerIp: _settings.printerIp!,
          port: _settings.printerPort,
        );
      } else {
        // طباعة PDF
        final pdfBytes = await PrintingService.createInvoicePDF(
          invoiceData: invoiceData,
          items: items,
          isThermal: false,
        );

        await PrintingService.printPDF(
          pdfBytes,
          'فاتورة_${invoice.invoiceNumber}',
        );
      }

      _printStatus = 'تمت الطباعة بنجاح';
      return true;
    } catch (e) {
      _error = 'خطأ في الطباعة: $e';
      _printStatus = 'فشلت الطباعة';
      return false;
    } finally {
      _isPrinting = false;
      notifyListeners();
    }
  }

  /// إنشاء وحفظ PDF
  Future<String?> createAndSavePDF(InvoiceModel invoice) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      // تحضير بيانات الفاتورة
      final invoiceData = {
        'invoiceNumber': invoice.invoiceNumber,
        'issueDate': invoice.issueDate,
        'status': invoice.status,
        'customerName': invoice.customerName,
        'customerEmail': invoice.customer?.email,
        'customerPhone': invoice.customer?.phone,
        'subtotal': invoice.subtotal,
        'taxAmount': invoice.taxAmount,
        'discount': invoice.discount,
        'total': invoice.total,
      };

      final items =
          invoice.items
              ?.map(
                (item) => {
                  'name': item.name,
                  'quantity': item.quantity,
                  'price': item.price,
                  'total': item.total,
                },
              )
              .toList() ??
          [];

      final pdfBytes = await PrintingService.createInvoicePDF(
        invoiceData: invoiceData,
        items: items,
        isThermal: false,
      );

      final filePath = await PrintingService.savePDF(
        pdfBytes,
        'فاتورة_${invoice.invoiceNumber}',
      );

      return filePath;
    } catch (e) {
      _error = 'خطأ في إنشاء PDF: $e';
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// مشاركة PDF
  Future<void> sharePDF(InvoiceModel invoice) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      // تحضير بيانات الفاتورة
      final invoiceData = {
        'invoiceNumber': invoice.invoiceNumber,
        'issueDate': invoice.issueDate,
        'status': invoice.status,
        'customerName': invoice.customerName,
        'customerEmail': invoice.customer?.email,
        'customerPhone': invoice.customer?.phone,
        'subtotal': invoice.subtotal,
        'taxAmount': invoice.taxAmount,
        'discount': invoice.discount,
        'total': invoice.total,
      };

      final items =
          invoice.items
              ?.map(
                (item) => {
                  'name': item.name,
                  'quantity': item.quantity,
                  'price': item.price,
                  'total': item.total,
                },
              )
              .toList() ??
          [];

      final pdfBytes = await PrintingService.createInvoicePDF(
        invoiceData: invoiceData,
        items: items,
        isThermal: false,
      );

      await PrintingService.sharePDF(
        pdfBytes,
        'فاتورة_${invoice.invoiceNumber}',
      );
    } catch (e) {
      _error = 'خطأ في مشاركة PDF: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// إعادة تعيين الإعدادات
  Future<void> resetSettings() async {
    _settings = PrintSettingsModel();
    await saveSettings(_settings);
  }

  /// الحصول على حالة الطابعة
  String getPrinterStatus() {
    if (_isPrinting) return _printStatus;
    if (_error.isNotEmpty) return _error;
    if (!_settings.isValid) return 'إعدادات الطابعة غير صحيحة';
    return 'جاهز للطباعة';
  }
}
