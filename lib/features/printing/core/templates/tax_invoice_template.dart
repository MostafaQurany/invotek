import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/printing/core/models/invoice_language.dart';
import 'package:invotek/features/printing/core/services/logo_cache_service.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// ===============================================================
/// TAX INVOICE TEMPLATE (ZATCA)
/// Clean, Complete, and Error-Free Version (with proper QR & table)
/// ===============================================================

// ---------------- DATA MODELS ----------------

class TaxInvoiceItem {
  final String? nameAr;
  final String? nameEn;
  final int qty;
  final double unitPrice;
  final double taxPercent;

  TaxInvoiceItem({
    this.nameAr,
    this.nameEn,
    required this.qty,
    required this.unitPrice,
    required this.taxPercent,
  });

  double get taxable => unitPrice * qty;
  double get vatAmount => taxable * (taxPercent / 100.0);
  double get totalWithVat => taxable + vatAmount;
}

class ZatcaQrFields {
  final String sellerName;
  final String vatNumber;
  final String timestampIso8601;
  final String totalWithVat;
  final String vatTotal;

  ZatcaQrFields({
    required this.sellerName,
    required this.vatNumber,
    required this.timestampIso8601,
    required this.totalWithVat,
    required this.vatTotal,
  });
}

class TaxInvoiceData {
  final String invoiceNumber;
  final String issueDateTimeIso;
  final String customerName;

  final String sellerNameAr;
  final String sellerNameEn;
  final String sellerVat;
  final String sellerAddress;

  final List<TaxInvoiceItem> items;

  final double subtotal;
  final double vatTotal;
  final double discount;
  final double grandTotal;
  final String? notes;
  final String? footerAr;
  final String? footerEn;

  final ZatcaQrFields? zatcaQr;

  // New fields
  final String companyName;
  final String? qrCode;
  final String invoiceType; // 'income' or 'general'
  final String currencySymbolAr;
  final String currencySymbolEn;
  final String? companyLogoUrl;

  TaxInvoiceData({
    required this.invoiceNumber,
    required this.issueDateTimeIso,
    required this.customerName,
    required this.sellerNameAr,
    required this.sellerNameEn,
    required this.sellerVat,
    required this.sellerAddress,
    required this.items,
    required this.subtotal,
    required this.vatTotal,
    required this.discount,
    required this.grandTotal,
    this.notes,
    this.footerAr,
    this.footerEn,
    this.zatcaQr,
    required this.companyName,
    this.qrCode,
    required this.invoiceType,
    required this.currencySymbolAr,
    required this.currencySymbolEn,
    this.companyLogoUrl,
  });

  static TaxInvoiceData fromInvoice(
    InvoiceModel invoice, {
    String currencySymbolAr = 'د.أ',
    String currencySymbolEn = 'JOD',
    String? companyLogoUrl,
    String? companyName,
  }) {
    return TaxInvoiceData(
      invoiceNumber: invoice.invoiceNumber.toString(),
      issueDateTimeIso: invoice.issueDate.toString(),
      customerName: invoice.customerName.toString(),
      sellerNameAr: invoice.customer?.name ?? '',
      sellerNameEn: invoice.customer?.name ?? '',
      sellerVat: invoice.customer?.taxNumber ?? '0',
      sellerAddress: invoice.customer?.address ?? '',
      items:
          invoice.items
              ?.where((e) {
                // Parse as double first to handle "1.00" format, then convert to int
                final qtyDouble = double.tryParse(e.quantity ?? '0') ?? 0.0;
                final qty = qtyDouble.toInt();
                return qty > 0; // فلترة العناصر التي كميةها أكبر من 0
              })
              .map((e) {
                // Parse as double first to handle "1.00" format, then convert to int
                final qtyDouble = double.tryParse(e.quantity ?? '0') ?? 0.0;
                final qty = qtyDouble.toInt();
                return TaxInvoiceItem(
                  nameAr: e.name,
                  nameEn: e.name,
                  qty: qty,
                  unitPrice: double.tryParse(e.price ?? '0') ?? 0,
                  taxPercent: double.tryParse(e.taxPercent ?? '0') ?? 0,
                );
              })
              .toList() ??
          [],
      subtotal: double.tryParse(invoice.subtotal ?? '0') ?? 0,
      vatTotal: double.tryParse(invoice.taxAmount ?? '0') ?? 0,
      discount: double.tryParse(invoice.discount ?? '0') ?? 0,
      grandTotal: double.tryParse(invoice.total ?? '0') ?? 0,
      notes: invoice.description,
      companyName: companyName ?? 'Invotek',
      qrCode: invoice.qrCode,
      invoiceType: invoice.invoiceType ?? 'general',
      currencySymbolAr: currencySymbolAr,
      currencySymbolEn: currencySymbolEn,
      companyLogoUrl: companyLogoUrl,
    );
  }
}

class TaxInvoiceStyleConfig {
  final String? fontFamily;
  final double headerSize;
  final double normalSize;

  const TaxInvoiceStyleConfig({
    this.fontFamily,
    this.headerSize = 24,
    this.normalSize = 20,
  });
}

// ---------------- INTERNAL HELPER CLASSES ----------------

class _ColSpec {
  final double frac;
  final TextAlign align;
  final ui.TextDirection dir;
  _ColSpec(this.frac, this.align, this.dir);
}

class _TableStyles {
  final TextStyle header;
  final TextStyle cell;
  final double rowMinHeight;
  final double ruleWidth;
  const _TableStyles({
    required this.header,
    required this.cell,
    required this.rowMinHeight,
    required this.ruleWidth,
  });
}

// ---------------- MAIN RENDERER ----------------

class TaxInvoiceRenderer {
  /// Format price with currency symbol, removing trailing zeros
  static String _formatPriceWithCurrency(double amount, String currencySymbol) {
    // Format number without currency symbol
    final formatted = NumberFormat.currency(
      symbol: '',
      decimalDigits: 2,
      locale: 'en_US', // تحديد locale لضمان التنسيق الصحيح
    ).format(amount);

    // Remove trailing zeros after decimal point
    String cleaned = formatted;
    if (cleaned.contains('.')) {
      // إزالة الأصفار الزائدة بعد الفاصلة العشرية
      cleaned = cleaned.replaceAll(RegExp(r'0+$'), '');
      // إزالة الفاصلة العشرية إذا لم يبق شيء بعدها
      cleaned = cleaned.replaceAll(RegExp(r'\.$'), '');
    }

    // Add currency symbol
    return '$cleaned $currencySymbol';
  }

  /// Load logo image from company URL with caching and fallback to assets
  ///
  /// Features:
  /// - Checks cache first for better performance
  /// - Retries failed URL loads (configurable)
  /// - Falls back to local asset if URL fails
  /// - Provides status updates via callback
  /// - Detailed logging for debugging
  static Future<ui.Image?> loadCompanyLogo(
    String? logoUrl, {
    Function(String message, bool isError)? onStatusUpdate,
    int maxRetries = 2,
  }) async {
    final startTime = DateTime.now();

    // Check cache first
    if (logoUrl != null && logoUrl.isNotEmpty) {
      try {
        // Import cache service at top of file
        final cache = LogoCacheService();
        final cachedLogo = cache.getCachedLogo(logoUrl);

        if (cachedLogo != null) {
          final loadTime = DateTime.now().difference(startTime);
          print('✓ Logo loaded from cache in ${loadTime.inMilliseconds}ms');
          onStatusUpdate?.call('Logo loaded from cache', false);
          return cachedLogo;
        }
      } catch (e) {
        print('⚠ Cache check failed: $e');
        // Continue to URL loading
      }
    }

    // Try to load from URL with retry mechanism
    if (logoUrl != null && logoUrl.isNotEmpty) {
      for (int attempt = 1; attempt <= maxRetries; attempt++) {
        try {
          print(
            '→ Attempting to load logo from URL (attempt $attempt/$maxRetries)',
          );
          print('  URL: $logoUrl');
          onStatusUpdate?.call(
            attempt == 1
                ? 'Loading company logo...'
                : 'Retrying logo load (attempt $attempt)...',
            false,
          );

          final dio = Dio();
          dio.options.connectTimeout = const Duration(seconds: 5);
          dio.options.receiveTimeout = const Duration(seconds: 5);

          final response = await dio.get<Uint8List>(
            logoUrl,
            options: Options(responseType: ResponseType.bytes),
          );

          if (response.data != null && response.data!.isNotEmpty) {
            print('  Response size: ${response.data!.length} bytes');

            // Decode image
            final codec = await ui.instantiateImageCodec(response.data!);
            final frame = await codec.getNextFrame();
            final image = frame.image;

            // Cache the loaded image
            try {
              final cache = LogoCacheService();
              cache.cacheLogo(logoUrl, image);
            } catch (e) {
              print('⚠ Failed to cache logo: $e');
              // Continue anyway, caching is not critical
            }

            final loadTime = DateTime.now().difference(startTime);
            print(
              '✓ Company logo loaded successfully from URL in ${loadTime.inMilliseconds}ms',
            );
            print('  Image size: ${image.width}x${image.height}');
            onStatusUpdate?.call('Company logo loaded successfully', false);

            return image;
          } else {
            print('⚠ Empty response data from URL');
          }
        } catch (e) {
          print(
            '✗ Failed to load logo from URL (attempt $attempt/$maxRetries): $e',
          );

          // If this was the last attempt, notify and fallback
          if (attempt == maxRetries) {
            print(
              '→ All retry attempts exhausted, falling back to default logo',
            );
            onStatusUpdate?.call(
              'Failed to load company logo, using default logo',
              true,
            );
          } else {
            // Wait before retry (exponential backoff)
            final waitTime = Duration(milliseconds: 500 * attempt);
            print('  Waiting ${waitTime.inMilliseconds}ms before retry...');
            await Future.delayed(waitTime);
          }
        }
      }
    } else {
      print('→ No logo URL provided, using default logo');
    }

    // Fallback to default logo from assets
    print('→ Loading default logo from assets');
    onStatusUpdate?.call('Loading default logo', false);
    final defaultLogo = await _loadDefaultLogoImage();

    if (defaultLogo != null) {
      final loadTime = DateTime.now().difference(startTime);
      print(
        '✓ Default logo loaded successfully in ${loadTime.inMilliseconds}ms',
      );
      print('  Image size: ${defaultLogo.width}x${defaultLogo.height}');
    } else {
      print('✗ Failed to load default logo from assets');
      onStatusUpdate?.call('Failed to load any logo', true);
    }

    return defaultLogo;
  }

  /// Load default logo image from assets
  static Future<ui.Image?> _loadDefaultLogoImage() async {
    try {
      final ByteData data = await rootBundle.load(
        'assets/images/Invotek-Logo-Final-01.png',
      );
      final Uint8List bytes = data.buffer.asUint8List();
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();
      return frame.image;
    } catch (e) {
      print('✗ Error loading default logo: $e');
      // Return null if logo cannot be loaded
      return null;
    }
  }

  /// Format date and time from ISO string
  static Map<String, String> _formatDateAndTime(String isoString) {
    try {
      final dateTime = DateTime.parse(isoString);
      final dateFormat = DateFormat('dd/MM/yyyy', 'en_US'); // تحديد locale
      final timeFormat = DateFormat('hh:mm a', 'en_US'); // تحديد locale
      return {
        'date': dateFormat.format(dateTime),
        'time': timeFormat.format(dateTime),
      };
    } catch (e) {
      // Return original string if parsing fails
      return {'date': isoString, 'time': ''};
    }
  }

  static List<double> _xStops(double x, double w, List<_ColSpec> cols) {
    final stops = <double>[x];
    double run = x;
    for (final c in cols) {
      run += w * c.frac;
      stops.add(run);
    }
    stops[stops.length - 1] = x + w;
    return stops;
  }

  static Future<List<Uint8List>> render({
    required int paperWidthPx,
    required TaxInvoiceData data,
    required TaxInvoiceStyleConfig style,
    required InvoiceLanguage language,
    int maxSliceHeightPx = 900,
    Function(double progress)? onProgress,
    ui.Image? logoImage,
  }) async {
    final margin = 12.0;
    final contentWidth = paperWidthPx.toDouble() - margin * 2;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    double y = margin;

    final base = TextStyle(
      fontFamily: style.fontFamily ?? 'Cairo',
      fontSize: style.normalSize,
      color: Colors.black,
      height: 1.15,
    );

    canvas.drawRect(
      Rect.fromLTWH(0, 0, paperWidthPx.toDouble(), 30000),
      Paint()..color = Colors.white,
    );

    // Draw logo (pre-loaded and passed as parameter)
    if (logoImage != null) {
      final logoSize = math.min(120.0, contentWidth * 0.4);
      final logoOffset = Offset(margin + (contentWidth - logoSize) / 2, y);
      canvas.drawImageRect(
        logoImage,
        Rect.fromLTWH(
          0,
          0,
          logoImage.width.toDouble(),
          logoImage.height.toDouble(),
        ),
        Rect.fromLTWH(logoOffset.dx, logoOffset.dy, logoSize, logoSize),
        Paint(),
      );
      y += logoSize + 8;
    }

    // Draw company name
    final bold = base.copyWith(fontWeight: FontWeight.bold);
    y = _text(
      canvas,
      data.companyName,
      margin,
      y,
      contentWidth,
      bold,
      TextAlign.center,
      ui.TextDirection.ltr,
    );
    y += 8;

    _rule(canvas, margin, y, margin + contentWidth, y, 1);
    y += 8;

    // Format date and time
    final dateTimeMap = _formatDateAndTime(data.issueDateTimeIso);
    final formattedDate = dateTimeMap['date'] ?? data.issueDateTimeIso;
    final formattedTime = dateTimeMap['time'] ?? '';

    // Invoice details
    y = (language == InvoiceLanguage.english)
        ? _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            (language == InvoiceLanguage.english)
                ? 'Invoice No'
                : 'رقم الفاتورة',
            data.invoiceNumber,
            base,
          )
        : _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            data.invoiceNumber,
            (language == InvoiceLanguage.english)
                ? 'Invoice No'
                : 'رقم الفاتورة',
            base,
          );
    y = (language == InvoiceLanguage.english)
        ? _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            (language == InvoiceLanguage.english) ? 'Date' : 'التاريخ',
            formattedDate,
            base,
          )
        : _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            formattedDate,
            (language == InvoiceLanguage.english) ? 'Date' : 'التاريخ',
            base,
          );
    if (formattedTime.isNotEmpty) {
      y = (language == InvoiceLanguage.english)
          ? _labelValue(
              canvas,
              margin,
              y,
              contentWidth,
              (language == InvoiceLanguage.english) ? 'Time' : 'الوقت',
              formattedTime,
              base,
            )
          : _labelValue(
              canvas,
              margin,
              y,
              contentWidth,
              formattedTime,
              (language == InvoiceLanguage.english) ? 'Time' : 'الوقت',
              base,
            );
    }
    y = (language == InvoiceLanguage.english)
        ? _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            (language == InvoiceLanguage.english) ? 'Customer' : 'العميل',
            data.customerName,
            base,
          )
        : _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            data.customerName,
            (language == InvoiceLanguage.english) ? 'Customer' : 'العميل',
            base,
          );
    y += 8;

    // _rule(canvas, margin, y, margin + contentWidth, y, 1);
    // y += 8;

    final headerStyle = TextStyle(
      fontFamily: style.fontFamily ?? 'Cairo',
      fontSize: paperWidthPx <= 400 ? 18 : 20, // زيادة حجم الخط
      fontWeight: FontWeight.bold,
      color: Colors.black,
      height: 1.3, // زيادة الارتفاع
    );

    // Determine columns and headers based on invoice type
    final isIncome = data.invoiceType == 'income';
    final currencySymbol = language == InvoiceLanguage.arabic
        ? data.currencySymbolAr
        : data.currencySymbolEn;

    final cols = (language == InvoiceLanguage.english)
        ? isIncome
              ? <_ColSpec>[
                  _ColSpec(0.40, TextAlign.center, ui.TextDirection.rtl),
                  _ColSpec(0.12, TextAlign.center, ui.TextDirection.ltr),
                  _ColSpec(0.24, TextAlign.center, ui.TextDirection.ltr),
                  _ColSpec(0.24, TextAlign.center, ui.TextDirection.ltr),
                ]
              : <_ColSpec>[
                  _ColSpec(0.36, TextAlign.center, ui.TextDirection.rtl),
                  _ColSpec(0.10, TextAlign.center, ui.TextDirection.ltr),
                  _ColSpec(0.22, TextAlign.center, ui.TextDirection.ltr),
                  _ColSpec(0.15, TextAlign.center, ui.TextDirection.ltr),
                  _ColSpec(0.23, TextAlign.center, ui.TextDirection.ltr),
                ]
        : isIncome
        ? <_ColSpec>[
            _ColSpec(0.24, TextAlign.center, ui.TextDirection.ltr),
            _ColSpec(0.24, TextAlign.center, ui.TextDirection.ltr),
            _ColSpec(0.12, TextAlign.center, ui.TextDirection.ltr),
            _ColSpec(0.40, TextAlign.center, ui.TextDirection.rtl),
          ]
        : <_ColSpec>[
            _ColSpec(0.23, TextAlign.center, ui.TextDirection.ltr),
            _ColSpec(0.15, TextAlign.center, ui.TextDirection.ltr),
            _ColSpec(0.22, TextAlign.center, ui.TextDirection.ltr),
            _ColSpec(0.10, TextAlign.center, ui.TextDirection.ltr),
            _ColSpec(0.36, TextAlign.center, ui.TextDirection.rtl),
          ];

    final headers = (language == InvoiceLanguage.english)
        ? isIncome
              ? ['Item', 'Qty', 'Price', 'Total']
              : ['Item', 'Qty', 'Price', '%Tax', 'Total']
        : isIncome
        ? ['المجموع', 'السعر', 'الكم', 'العنصر']
        : ['المجموع', '%Tax', 'السعر', 'الكم', 'العنصر'];

    y = _drawGridTable(
      c: canvas,
      x: margin,
      y: y,
      contentW: contentWidth,
      cols: cols,
      headers: headers,
      items: data.items,
      language: language,
      invoiceType: data.invoiceType,
      currencySymbol: currencySymbol,
      styles: _TableStyles(
        header: headerStyle,
        cell: base,
        rowMinHeight: style.normalSize * 2.55,
        ruleWidth: 1,
      ),
    );
    y += 8;

    y = (language == InvoiceLanguage.english)
        ? _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            (language == InvoiceLanguage.english)
                ? 'Subtotal'
                : 'الإجمالي قبل الضريبة',
            _formatPriceWithCurrency(data.subtotal, currencySymbol),
            base,
          )
        : _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            _formatPriceWithCurrency(data.subtotal, currencySymbol),
            (language == InvoiceLanguage.english)
                ? 'Subtotal'
                : 'الإجمالي قبل الضريبة',
            base,
          );
    // Only show VAT Total if not income type
    if (!isIncome) {
      y = (language == InvoiceLanguage.english)
          ? _labelValue(
              canvas,
              margin,
              y,
              contentWidth,
              (language == InvoiceLanguage.english)
                  ? 'VAT Total'
                  : 'إجمالي الضريبة',
              _formatPriceWithCurrency(data.vatTotal, currencySymbol),
              base,
            )
          : _labelValue(
              canvas,
              margin,
              y,
              contentWidth,
              _formatPriceWithCurrency(data.vatTotal, currencySymbol),
              (language == InvoiceLanguage.english)
                  ? 'VAT Total'
                  : 'إجمالي الضريبة',
              base,
            );
    }
    y = (language == InvoiceLanguage.english)
        ? _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            (language == InvoiceLanguage.english) ? 'Discount' : 'الخصم',
            _formatPriceWithCurrency(data.discount, currencySymbol),
            base,
          )
        : _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            _formatPriceWithCurrency(data.discount, currencySymbol),
            (language == InvoiceLanguage.english) ? 'Discount' : 'الخصم',
            base,
          );
    final grand = base.copyWith(fontWeight: FontWeight.bold);
    y = (language == InvoiceLanguage.english)
        ? _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            (language == InvoiceLanguage.english)
                ? 'Grand Total'
                : 'الإجمالي شامل الضريبة',
            _formatPriceWithCurrency(data.grandTotal, currencySymbol),
            grand,
          )
        : _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            _formatPriceWithCurrency(data.grandTotal, currencySymbol),
            (language == InvoiceLanguage.english)
                ? 'Grand Total'
                : 'الإجمالي شامل الضريبة',
            grand,
          );
    y += 8;

    if ((data.notes ?? '').isNotEmpty) {
      _rule(canvas, margin, y, margin + contentWidth, y, 1);
      y += 6;
      y = _text(
        canvas,
        (language == InvoiceLanguage.english) ? 'Notes' : 'ملاحظات',
        margin,
        y,
        contentWidth,
        grand,
        TextAlign.center,
        ui.TextDirection.ltr,
      );
      y = _text(
        canvas,
        data.notes!,
        margin,
        y,
        contentWidth,
        base,
        TextAlign.center,
        ui.TextDirection.rtl,
      );
      y += 8;
    }

    if ((data.footerAr ?? '').isNotEmpty || (data.footerEn ?? '').isNotEmpty) {
      _rule(canvas, margin, y, margin + contentWidth, y, 1);
      y += 6;
      if ((data.footerAr ?? '').isNotEmpty) {
        y = _text(
          canvas,
          data.footerAr!,
          margin,
          y,
          contentWidth,
          base,
          TextAlign.center,
          ui.TextDirection.rtl,
        );
      }
      if ((data.footerEn ?? '').isNotEmpty) {
        y = _text(
          canvas,
          data.footerEn!,
          margin,
          y,
          contentWidth,
          base,
          TextAlign.center,
          ui.TextDirection.ltr,
        );
      }
      y += 8;
    }

    // QR Code section
    if (data.qrCode != null && data.qrCode!.isNotEmpty) {
      y += 8;

      // حساب حجم QR Code بشكل نسبي لحجم الورق
      // للورق الصغير (58mm/384px): استخدام 90% من عرض المحتوى لضمان حجم كافٍ
      // للورق الكبير (80mm/576px): استخدام 70% من عرض المحتوى
      // مع حد أدنى 300px لضمان قابلية المسح في الورق الصغير
      final paperWidth = paperWidthPx.toDouble();
      final qrSizeRatio = paperWidth <= 400
          ? 0.90
          : 0.7; // نسبة أكبر للورق الصغير
      final minQrSize = 300.0; // حد أدنى لضمان قابلية المسح
      final calculatedQrSize = contentWidth * qrSizeRatio;
      // للورق الصغير: استخدام الحجم المحسوب أو الحد الأدنى (أيهما أكبر)
      // للورق الكبير: استخدام الحد الأقصى 350px
      final qrSize = paperWidth <= 400
          ? math.max(minQrSize, calculatedQrSize) // للورق الصغير: لا حد أقصى
          : math.min(350.0, calculatedQrSize); // للورق الكبير: حد أقصى 350px

      final qrOffsetX = margin + (contentWidth - qrSize) / 2;
      final qrOffsetY = y;

      // استخدام QrPainter مباشرة على Canvas للحصول على أفضل جودة
      // بدون تحويل إلى صورة مما يحافظ على الحواف الحادة
      final qrPainter = QrPainter(
        data: data.qrCode!,
        version: QrVersions.auto,
        gapless: true,
        color: Colors.black,
        emptyColor: Colors.white,
        errorCorrectionLevel: QrErrorCorrectLevel.H,
      );

      // حفظ حالة Canvas
      canvas.save();

      // نقل Canvas إلى موضع QR Code
      canvas.translate(qrOffsetX, qrOffsetY);

      // رسم QR Code مباشرة على Canvas بحجم محدد
      // استخدام Size لتحديد الحجم بدقة
      qrPainter.paint(canvas, Size(qrSize, qrSize));

      // استعادة حالة Canvas
      canvas.restore();

      // إضافة مسافة أكبر بعد QR Code لتجنب القطع
      y += qrSize + 20;
    }

    // Thank you section
    y += 8;
    y = _text(
      canvas,
      language == InvoiceLanguage.arabic ? 'شكراً لكم' : 'Thank you',
      margin,
      y,
      contentWidth,
      bold,
      TextAlign.center,
      language == InvoiceLanguage.arabic
          ? ui.TextDirection.rtl
          : ui.TextDirection.ltr,
    );

    final image = await recorder.endRecording().toImage(
      paperWidthPx,
      y.ceil() + 4, // تقليل المسافة الإضافية في النهاية
    );
    return _sliceToChunksWithProgress(
      image,
      paperWidthPx,
      maxSliceHeightPx,
      onProgress,
    );
  }

  static double _drawGridTable({
    required Canvas c,
    required double x,
    required double y,
    required double contentW,
    required InvoiceLanguage language,
    required List<_ColSpec> cols,
    required List<String> headers,
    required List<TaxInvoiceItem> items,
    required _TableStyles styles,
    required String invoiceType,
    required String currencySymbol,
  }) {
    final xs = _xStops(x, contentW, cols);
    final hPainters = <TextPainter>[];
    for (var i = 0; i < headers.length; i++) {
      final w = xs[i + 1] - xs[i];
      hPainters.add(
        _tp(headers[i], styles.header, cols[i].dir, cols[i].align, w),
      );
    }
    final headerH =
        hPainters.fold<double>(0, (m, tp) => tp.height > m ? tp.height : m) +
        12; // إضافة padding إضافي لزيادة ارتفاع الرأس

    _rule(c, x, y, x + contentW, y, styles.ruleWidth);
    for (var i = 0; i < hPainters.length; i++) {
      final tp = hPainters[i];
      final colWidth = xs[i + 1] - xs[i];
      // التأكد من أن النص لا يخرج خارج حدود العمود
      final textWidth = math.min(tp.width, colWidth);
      // حساب الموضع مع التأكد من أنه داخل الحدود
      final dx = xs[i] + math.max(0, (colWidth - textWidth) / 2);
      final dy = y + (headerH - tp.height) / 2;
      // التأكد من أن الموضع داخل حدود العمود
      final safeDx = math.max(xs[i], math.min(dx, xs[i + 1] - textWidth));
      final safeDy = math.max(y, dy);
      tp.paint(c, Offset(safeDx, safeDy));
    }
    y += headerH;
    _rule(c, x, y, x + contentW, y, styles.ruleWidth);
    for (final stop in xs) {
      _rule(c, stop, y - headerH, stop, y, styles.ruleWidth);
    }

    final isIncome = invoiceType == 'income';
    for (final it in items) {
      // التأكد من أن القيم ليست فارغة
      final itemName = (it.nameAr ?? it.nameEn ?? '').trim();
      final qtyStr = it.qty > 0 ? it.qty.toString() : '0';
      final priceStr = _formatPriceWithCurrency(it.unitPrice, currencySymbol);
      final totalStr = _formatPriceWithCurrency(
        it.totalWithVat,
        currencySymbol,
      );
      final taxPercentStr = '${it.taxPercent.toStringAsFixed(0)}%';

      final values = (language == InvoiceLanguage.english)
          ? isIncome
                ? [itemName, qtyStr, priceStr, totalStr]
                : [itemName, qtyStr, priceStr, taxPercentStr, totalStr]
          : isIncome
          ? [totalStr, priceStr, qtyStr, itemName]
          : [totalStr, taxPercentStr, priceStr, qtyStr, itemName];
      final tps = <TextPainter>[];
      for (var i = 0; i < cols.length; i++) {
        final w = xs[i + 1] - xs[i];
        tps.add(_tp(values[i], styles.cell, cols[i].dir, cols[i].align, w));
      }
      final rowH = tps.fold<double>(
        styles.rowMinHeight,
        (m, tp) => tp.height > m ? tp.height : m,
      );
      for (var i = 0; i < tps.length; i++) {
        final tp = tps[i];
        final colWidth = xs[i + 1] - xs[i];
        // التأكد من أن النص لا يخرج خارج حدود العمود
        final textWidth = math.min(tp.width, colWidth);
        // حساب الموضع مع التأكد من أنه داخل الحدود
        final dx = xs[i] + math.max(0, (colWidth - textWidth) / 2);
        final dy = y + (rowH - tp.height) / 2;
        // التأكد من أن الموضع داخل حدود العمود
        final safeDx = math.max(xs[i], math.min(dx, xs[i + 1] - textWidth));
        final safeDy = math.max(y, dy);
        tp.paint(c, Offset(safeDx, safeDy));
      }
      y += rowH;
      _rule(c, x, y, x + contentW, y, 0.6);
      for (final stop in xs) {
        _rule(c, stop, y - rowH, stop, y, 0.6);
      }
    }

    _rule(c, x, y, x + contentW, y, styles.ruleWidth);
    return y;
  }

  static double _text(
    Canvas c,
    String t,
    double x,
    double y,
    double w,
    TextStyle s,
    TextAlign a,
    ui.TextDirection d,
  ) {
    final tp = _tp(t, s, d, a, w);
    // حساب موضع المنتصف يدوياً عندما يكون TextAlign.center
    final dx = (a == TextAlign.center) ? x + (w - tp.width) / 2 : x;
    tp.paint(c, Offset(dx, y));
    return y + tp.height;
  }

  static TextPainter _tp(
    String t,
    TextStyle s,
    ui.TextDirection d,
    TextAlign a,
    double maxW,
  ) {
    // التأكد من أن النص ليس فارغاً
    final text = t.isEmpty ? ' ' : t;
    final tp = TextPainter(
      text: TextSpan(text: text, style: s),
      textAlign: a,
      textDirection: d,
      maxLines: null,
      ellipsis: null, // عدم قص النص
    )..layout(maxWidth: maxW > 0 ? maxW : double.infinity);
    return tp;
  }

  static void _rule(
    Canvas c,
    double x1,
    double y1,
    double x2,
    double y2,
    double w,
  ) {
    c.drawLine(
      Offset(x1, y1),
      Offset(x2, y2),
      Paint()
        ..color = Colors.black
        ..strokeWidth = w,
    );
  }

  static double _labelValue(
    Canvas c,
    double x,
    double y,
    double w,
    String label,
    String val,
    TextStyle s,
  ) {
    // تقسيم العرض: 45% للنص، 10% للمسافة، 45% للقيمة
    final labelWidth = w * 0.45;
    final valueWidth = w * 0.45;
    final spacing = w * 0.10;

    final tpL = _tp(
      label,
      s,
      ui.TextDirection.rtl,
      TextAlign.center,
      labelWidth,
    );
    final tpV = _tp(val, s, ui.TextDirection.ltr, TextAlign.center, valueWidth);

    // حساب موضع المنتصف لكل جزء
    final labelX = x + (labelWidth - tpL.width) / 2;
    final valueX = x + labelWidth + spacing + (valueWidth - tpV.width) / 2;

    tpL.paint(c, Offset(labelX, y));
    tpV.paint(c, Offset(valueX, y));
    return y + math.max(tpL.height, tpV.height);
  }

  static Future<List<Uint8List>> _sliceToChunks(
    ui.Image img,
    int width,
    int maxH,
  ) async {
    return _sliceToChunksWithProgress(img, width, maxH, null);
  }

  static Future<List<Uint8List>> _sliceToChunksWithProgress(
    ui.Image img,
    int width,
    int maxH,
    Function(double progress)? onProgress,
  ) async {
    final list = <Uint8List>[];
    int y = 0;
    final totalHeight = img.height;

    while (y < totalHeight) {
      // Yield قبل كل عملية ثقيلة
      await Future.microtask(() {});
      await SchedulerBinding.instance.endOfFrame;

      final h = (y + maxH <= totalHeight) ? maxH : (totalHeight - y);
      final rec = ui.PictureRecorder();
      final c = Canvas(rec);
      final dst = Rect.fromLTWH(0, 0, width.toDouble(), h.toDouble());
      final src = Rect.fromLTWH(
        0,
        y.toDouble(),
        width.toDouble(),
        h.toDouble(),
      );
      c.drawRect(dst, Paint()..color = Colors.white);
      c.drawImageRect(img, src, dst, Paint());

      // Yield قبل toImage
      await Future.microtask(() {});
      await SchedulerBinding.instance.endOfFrame;

      final part = await rec.endRecording().toImage(width, h);

      // Yield قبل toByteData
      await Future.microtask(() {});
      await SchedulerBinding.instance.endOfFrame;

      final png = await part.toByteData(format: ui.ImageByteFormat.png);
      list.add(png!.buffer.asUint8List());

      y += h;

      // تحديث التقدم
      onProgress?.call(y / totalHeight);

      // Yield بعد كل شريحة
      await Future.microtask(() {});
    }

    return list;
  }
}

// ---------------- PUBLIC WRAPPER ----------------

Future<List<Uint8List>> renderTaxInvoiceToPngChunks({
  required int paperWidthPx,
  required TaxInvoiceData data,
  required TaxInvoiceStyleConfig style,
  required InvoiceLanguage language,
  int maxSliceHeightPx = 900,
  Function(double progress)? onProgress,
  ui.Image? logoImage,
}) {
  return TaxInvoiceRenderer.render(
    paperWidthPx: paperWidthPx,
    data: data,
    style: style,
    maxSliceHeightPx: maxSliceHeightPx,
    language: language,
    onProgress: onProgress,
    logoImage: logoImage,
  );
}
