import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/printing/core/models/invoice_language.dart';
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
  final String paymentMethod;

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

  TaxInvoiceData({
    required this.invoiceNumber,
    required this.issueDateTimeIso,
    required this.customerName,
    required this.paymentMethod,
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
  });

  static TaxInvoiceData fromInvoice(InvoiceModel invoice) {
    return TaxInvoiceData(
      invoiceNumber: invoice.invoiceNumber.toString(),
      issueDateTimeIso: invoice.issueDate.toString(),
      customerName: invoice.customerName.toString(),
      paymentMethod: invoice.paymentMethodCode.toString(),
      sellerNameAr: invoice.customer?.name ?? '',
      sellerNameEn: invoice.customer?.name ?? '',
      sellerVat: invoice.customer?.taxNumber ?? '0',
      sellerAddress: invoice.customer?.address ?? '',
      items:
          invoice.items
              ?.map(
                (e) => TaxInvoiceItem(
                  nameAr: e.name,
                  nameEn: e.name,
                  qty: int.tryParse(e.quantity ?? '0') ?? 0,
                  unitPrice: double.tryParse(e.price ?? '0') ?? 0,
                  taxPercent: double.tryParse(e.taxPercent ?? '0') ?? 0,
                ),
              )
              .toList() ??
          [],
      subtotal: double.tryParse(invoice.subtotal ?? '0') ?? 0,
      vatTotal: double.tryParse(invoice.taxAmount ?? '0') ?? 0,
      discount: double.tryParse(invoice.discount ?? '0') ?? 0,
      grandTotal: double.tryParse(invoice.total ?? '0') ?? 0,
      notes: invoice.description,
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
  final TextDirection dir;
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
    final h1 = base.copyWith(
      fontSize: style.headerSize,
      fontWeight: FontWeight.bold,
    );

    canvas.drawRect(
      Rect.fromLTWH(0, 0, paperWidthPx.toDouble(), 30000),
      Paint()..color = Colors.white,
    );
    if (language == InvoiceLanguage.arabic)
      y = _text(
        canvas,
        'فاتورة ضريبية',
        margin,
        y,
        contentWidth,
        h1,
        TextAlign.center,
        TextDirection.rtl,
      );
    if (language == InvoiceLanguage.english)
      y = _text(
        canvas,
        'Tax Invoice',
        margin,
        y,
        contentWidth,
        h1,
        TextAlign.center,
        TextDirection.ltr,
      );
    y += 8;

    final bold = base.copyWith(fontWeight: FontWeight.bold);
    y = _text(
      canvas,
      data.sellerNameAr,
      margin,
      y,
      contentWidth,
      bold,
      TextAlign.center,
      TextDirection.rtl,
    );

    y = _text(
      canvas,
      'VAT: ${data.sellerVat}',
      margin,
      y,
      contentWidth,
      base,
      TextAlign.center,
      TextDirection.ltr,
    );
    y = _text(
      canvas,
      data.sellerAddress,
      margin,
      y,
      contentWidth,
      base,
      TextAlign.center,
      TextDirection.rtl,
    );
    y += 8;

    _rule(canvas, margin, y, margin + contentWidth, y, 1);
    y += 8;

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
            data.issueDateTimeIso,
            base,
          )
        : _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            data.issueDateTimeIso,

            (language == InvoiceLanguage.english) ? 'Date' : 'التاريخ',
            base,
          );
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
    y = (language == InvoiceLanguage.english)
        ? _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            (language == InvoiceLanguage.english) ? 'Payment' : 'طريقة الدفع',
            data.paymentMethod,
            base,
          )
        : _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            data.paymentMethod,

            (language == InvoiceLanguage.english) ? 'Payment' : 'طريقة الدفع',
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

    final cols = (language == InvoiceLanguage.english)
        ? <_ColSpec>[
            _ColSpec(0.36, TextAlign.center, TextDirection.rtl),
            _ColSpec(0.10, TextAlign.center, TextDirection.ltr),
            _ColSpec(0.22, TextAlign.center, TextDirection.ltr),
            _ColSpec(0.15, TextAlign.center, TextDirection.ltr),
            //_ColSpec(0.10, TextAlign.center, TextDirection.ltr),
            _ColSpec(0.23, TextAlign.center, TextDirection.ltr),
          ]
        : <_ColSpec>[
            _ColSpec(0.23, TextAlign.center, TextDirection.ltr),
            _ColSpec(0.15, TextAlign.center, TextDirection.ltr),
            _ColSpec(0.22, TextAlign.center, TextDirection.ltr),
            _ColSpec(0.10, TextAlign.center, TextDirection.ltr),

            _ColSpec(0.36, TextAlign.center, TextDirection.rtl),
            //_ColSpec(0.10, TextAlign.center, TextDirection.ltr),
          ];

    final headers = (language == InvoiceLanguage.english)
        ? ['Item', 'Qty', 'Price', '%Tax', /* 'VAT',*/ 'Total']
        : ['المجموع', '%Tax', 'السعر', 'الكم', 'العنصر' /* 'VAT',*/];

    y = _drawGridTable(
      c: canvas,
      x: margin,
      y: y,
      contentW: contentWidth,
      cols: cols,
      headers: headers,
      items: data.items,
      language: language,
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
            data.subtotal.toStringAsFixed(2),
            base,
          )
        : _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            data.subtotal.toStringAsFixed(2),

            (language == InvoiceLanguage.english)
                ? 'Subtotal'
                : 'الإجمالي قبل الضريبة',
            base,
          );
    y = (language == InvoiceLanguage.english)
        ? _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            (language == InvoiceLanguage.english)
                ? 'VAT Total'
                : 'إجمالي الضريبة',
            data.vatTotal.toStringAsFixed(2),
            base,
          )
        : _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            data.vatTotal.toStringAsFixed(2),

            (language == InvoiceLanguage.english)
                ? 'VAT Total'
                : 'إجمالي الضريبة',
            base,
          );
    y = (language == InvoiceLanguage.english)
        ? _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            (language == InvoiceLanguage.english) ? 'Discount' : 'الخصم',
            data.discount.toStringAsFixed(2),
            base,
          )
        : _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            data.discount.toStringAsFixed(2),

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
            data.grandTotal.toStringAsFixed(2),
            grand,
          )
        : _labelValue(
            canvas,
            margin,
            y,
            contentWidth,
            data.grandTotal.toStringAsFixed(2),

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
        TextDirection.ltr,
      );
      y = _text(
        canvas,
        data.notes!,
        margin,
        y,
        contentWidth,
        base,
        TextAlign.center,
        TextDirection.rtl,
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
          TextDirection.rtl,
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
          TextDirection.ltr,
        );
      }
      y += 8;
    }

    // ✅ FIXED QR CODE SECTION
    if (data.zatcaQr != null) {
      final qrData = _zatcaTLV(
        seller: data.zatcaQr!.sellerName,
        vatNo: data.zatcaQr!.vatNumber,
        timestamp: data.zatcaQr!.timestampIso8601,
        total: data.zatcaQr!.totalWithVat,
        vat: data.zatcaQr!.vatTotal,
      );
      final qrSize = math.min(220.0, contentWidth);
      final offset = Offset(margin + (contentWidth - qrSize) / 2, y);

      final qrPainter = QrPainter(
        data: qrData,
        version: QrVersions.auto,
        gapless: true,
        color: Colors.black,
        emptyColor: Colors.white,
      );
      final qrPic = await qrPainter.toImageData(qrSize);
      if (qrPic != null) {
        final codec = await ui.instantiateImageCodec(
          qrPic.buffer.asUint8List(),
        );
        final frame = await codec.getNextFrame();
        canvas.drawImage(frame.image, offset, Paint());
      }
      y += qrSize + 4; // تقليل المسافة بعد QR Code
    }

    final image = await recorder.endRecording().toImage(
      paperWidthPx,
      y.ceil() + 4, // تقليل المسافة الإضافية في النهاية
    );
    return _sliceToChunks(image, paperWidthPx, maxSliceHeightPx);
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
      final dx = xs[i] + (colWidth - tp.width) / 2; // حساب المنتصف يدوياً
      final dy = y + (headerH - tp.height) / 2;
      tp.paint(c, Offset(dx, dy));
    }
    y += headerH;
    _rule(c, x, y, x + contentW, y, styles.ruleWidth);
    for (final stop in xs) {
      _rule(c, stop, y - headerH, stop, y, styles.ruleWidth);
    }

    for (final it in items) {
      final values = (language == InvoiceLanguage.english)
          ? [
              (it.nameAr ?? it.nameEn ?? '').trim(),
              it.qty.toString(),
              it.unitPrice.toStringAsFixed(2),
              '${it.taxPercent.toStringAsFixed(0)}%',
              //   it.vatAmount.toStringAsFixed(2),
              it.totalWithVat.toStringAsFixed(2),
            ]
          : [
              //   it.vatAmount.toStringAsFixed(2),
              it.totalWithVat.toStringAsFixed(2),
              '${it.taxPercent.toStringAsFixed(0)}%',

              it.unitPrice.toStringAsFixed(2),

              it.qty.toString(),

              (it.nameAr ?? it.nameEn ?? '').trim(),
            ];
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
        final dx = xs[i] + (colWidth - tp.width) / 2; // حساب المنتصف يدوياً
        final dy = y + (rowH - tp.height) / 2;
        tp.paint(c, Offset(dx, dy));
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
    TextDirection d,
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
    TextDirection d,
    TextAlign a,
    double maxW,
  ) {
    final tp = TextPainter(
      text: TextSpan(text: t, style: s),
      textAlign: a,
      textDirection: d,
      maxLines: null,
    )..layout(maxWidth: maxW);
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

    final tpL = _tp(label, s, TextDirection.rtl, TextAlign.center, labelWidth);
    final tpV = _tp(val, s, TextDirection.ltr, TextAlign.center, valueWidth);

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
    final list = <Uint8List>[];
    int y = 0;
    while (y < img.height) {
      final h = (y + maxH <= img.height) ? maxH : (img.height - y);
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
      final part = await rec.endRecording().toImage(width, h);
      final png = await part.toByteData(format: ui.ImageByteFormat.png);
      list.add(png!.buffer.asUint8List());
      y += h;
    }
    return list;
  }

  static String _zatcaTLV({
    required String seller,
    required String vatNo,
    required String timestamp,
    required String total,
    required String vat,
  }) {
    Uint8List enc(int tag, String value) {
      final v = Uint8List.fromList(value.codeUnits);
      return Uint8List.fromList([tag, v.length, ...v]);
    }

    final tlv = Uint8List.fromList([
      ...enc(1, seller),
      ...enc(2, vatNo),
      ...enc(3, timestamp),
      ...enc(4, total),
      ...enc(5, vat),
    ]);
    return String.fromCharCodes(tlv);
  }
}

// ---------------- PUBLIC WRAPPER ----------------

Future<List<Uint8List>> renderTaxInvoiceToPngChunks({
  required int paperWidthPx,
  required TaxInvoiceData data,
  required TaxInvoiceStyleConfig style,
  required InvoiceLanguage language,
  int maxSliceHeightPx = 900,
}) {
  return TaxInvoiceRenderer.render(
    paperWidthPx: paperWidthPx,
    data: data,
    style: style,
    maxSliceHeightPx: maxSliceHeightPx,
    language: language,
  );
}
