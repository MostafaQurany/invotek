import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class PrintingService {
  static pw.Font? _arabicFont;

  /// تحميل الخط العربي
  static Future<pw.Font> _getArabicFont() async {
    if (_arabicFont != null) {
      print('استخدام الخط العربي المحمل مسبقاً');
      return _arabicFont!;
    }

    try {
      print('محاولة تحميل الخط العربي...');
      // محاولة تحميل خط عربي من assets
      final fontData = await rootBundle.load(
        'assets/fonts/NotoSansArabic/NotoSansArabic-Regular.ttf',
      );
      print(
        'تم تحميل الخط العربي بنجاح، الحجم: ${fontData.lengthInBytes} bytes',
      );
      _arabicFont = pw.Font.ttf(fontData);
      print('تم إنشاء Font object بنجاح');
      return _arabicFont!;
    } catch (e) {
      print('خطأ في تحميل الخط العربي: $e');
      print('استخدام الخط الافتراضي Helvetica');
      // استخدام خط افتراضي
      return pw.Font.helvetica();
    }
  }

  /// الحصول على الخط العربي مع fallback
  static Future<pw.Font> _getArabicFontWithFallback() async {
    try {
      final arabicFont = await _getArabicFont();
      return arabicFont;
    } catch (e) {
      print('خطأ في تحميل الخط العربي، استخدام Helvetica: $e');
      return pw.Font.helvetica();
    }
  }

  /// طباعة PDF مباشرة
  static Future<void> printPDF(Uint8List pdfBytes, String fileName) async {
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfBytes,
      name: fileName,
    );
  }

  /// مشاركة PDF مع التطبيقات الأخرى
  static Future<void> sharePDF(Uint8List pdfBytes, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName.pdf');
    await file.writeAsBytes(pdfBytes);

    await Share.shareXFiles([
      XFile(file.path),
    ], text: 'فاتورة من تطبيق Invotek');
  }

  /// حفظ PDF في الجهاز
  static Future<String> savePDF(Uint8List pdfBytes, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName.pdf');
    await file.writeAsBytes(pdfBytes);
    return file.path;
  }

  /// إنشاء PDF للفاتورة
  static Future<Uint8List> createInvoicePDF({
    required Map<String, dynamic> invoiceData,
    required List<Map<String, dynamic>> items,
    bool isThermal = false,
  }) async {
    print('بدء إنشاء PDF...');
    final pdf = pw.Document();
    print('تم إنشاء Document');
    final arabicFont = await _getArabicFontWithFallback();
    print('تم تحميل الخط العربي: ${arabicFont.fontName}');

    // الخط العربي سيتم استخدامه في كل صفحة
    print('الخط العربي جاهز للاستخدام');

    if (isThermal) {
      // تنسيق للطباعة الحرارية
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat(80 * PdfPageFormat.mm, double.infinity),
          textDirection: pw.TextDirection.rtl,
          build: (pw.Context context) {
            return _buildThermalReceipt(invoiceData, items, arabicFont);
          },
        ),
      );
    } else {
      // تنسيق للطباعة العادية
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          textDirection: pw.TextDirection.rtl,
          build: (pw.Context context) {
            return _buildStandardInvoice(invoiceData, items, arabicFont);
          },
        ),
      );
    }

    print('جاري حفظ PDF...');
    final pdfBytes = await pdf.save();
    print('تم حفظ PDF بنجاح، الحجم: ${pdfBytes.length} bytes');
    return pdfBytes;
  }

  /// بناء الإيصال الحرارية
  static pw.Widget _buildThermalReceipt(
    Map<String, dynamic> invoiceData,
    List<Map<String, dynamic>> items,
    pw.Font arabicFont,
  ) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        // Header
        pw.Text(
          'فاتورة ضريبية',
          style: pw.TextStyle(
            fontSize: 16,
            fontWeight: pw.FontWeight.bold,
            font: arabicFont,
          ),
        ),
        pw.SizedBox(height: 8),
        pw.Text(
          'رقم الفاتورة: ${invoiceData['invoiceNumber'] ?? ''}',
          style: pw.TextStyle(fontSize: 12, font: arabicFont),
        ),
        pw.Text(
          'التاريخ: ${invoiceData['issueDate'] ?? ''}',
          style: pw.TextStyle(fontSize: 10, font: arabicFont),
        ),
        pw.SizedBox(height: 16),
        pw.Divider(),
        pw.SizedBox(height: 8),

        // Customer Info
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            'العميل: ${invoiceData['customerName'] ?? ''}',
            style: pw.TextStyle(fontSize: 12, font: arabicFont),
          ),
        ),
        pw.SizedBox(height: 16),

        // Items
        ...items.map(
          (item) => pw.Padding(
            padding: const pw.EdgeInsets.symmetric(vertical: 2),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Expanded(
                  flex: 3,
                  child: pw.Text(
                    item['name'] ?? '',
                    style: pw.TextStyle(fontSize: 10, font: arabicFont),
                  ),
                ),
                pw.Text(
                  '${item['quantity']} x ${item['price']}',
                  style: pw.TextStyle(fontSize: 10, font: arabicFont),
                ),
                pw.Text(
                  item['total'].toString(),
                  style: pw.TextStyle(fontSize: 10, font: arabicFont),
                ),
              ],
            ),
          ),
        ),

        pw.SizedBox(height: 16),
        pw.Divider(),
        pw.SizedBox(height: 8),

        // Totals
        _buildTotalRow(
          'المجموع الفرعي',
          invoiceData['subtotal'] ?? '0',
          arabicFont,
        ),
        _buildTotalRow('الضريبة', invoiceData['taxAmount'] ?? '0', arabicFont),
        _buildTotalRow('الخصم', invoiceData['discount'] ?? '0', arabicFont),
        pw.SizedBox(height: 8),
        pw.Divider(thickness: 2),
        pw.SizedBox(height: 8),
        _buildTotalRow(
          'المجموع الكلي',
          invoiceData['total'] ?? '0',
          arabicFont,
          isTotal: true,
        ),

        pw.SizedBox(height: 24),
        pw.Text(
          'شكراً لتعاملكم معنا',
          style: pw.TextStyle(fontSize: 10, font: arabicFont),
        ),
      ],
    );
  }

  /// بناء الفاتورة العادية
  static pw.Widget _buildStandardInvoice(
    Map<String, dynamic> invoiceData,
    List<Map<String, dynamic>> items,
    pw.Font arabicFont,
  ) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // Header
        pw.Container(
          width: double.infinity,
          padding: const pw.EdgeInsets.all(20),
          decoration: pw.BoxDecoration(
            color: PdfColors.blue,
            borderRadius: pw.BorderRadius.circular(8),
          ),
          child: pw.Text(
            'فاتورة ضريبية',
            style: pw.TextStyle(
              fontSize: 24,
              color: PdfColors.white,
              fontWeight: pw.FontWeight.bold,
              font: arabicFont,
            ),
          ),
        ),

        pw.SizedBox(height: 20),

        // Invoice Details
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'رقم الفاتورة: ${invoiceData['invoiceNumber'] ?? ''}',
                  style: pw.TextStyle(font: arabicFont, fontSize: 12),
                ),
                pw.Text(
                  'التاريخ: ${invoiceData['issueDate'] ?? ''}',
                  style: pw.TextStyle(font: arabicFont, fontSize: 12),
                ),
                pw.Text(
                  'الحالة: ${invoiceData['status'] ?? ''}',
                  style: pw.TextStyle(font: arabicFont, fontSize: 12),
                ),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text(
                  'المجموع: ${invoiceData['total'] ?? ''}',
                  style: pw.TextStyle(font: arabicFont, fontSize: 12),
                ),
                pw.Text(
                  'الضريبة: ${invoiceData['taxAmount'] ?? ''}',
                  style: pw.TextStyle(font: arabicFont, fontSize: 12),
                ),
              ],
            ),
          ],
        ),

        pw.SizedBox(height: 20),

        // Customer Info
        pw.Text(
          'بيانات العميل',
          style: pw.TextStyle(
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
            font: arabicFont,
          ),
        ),
        pw.SizedBox(height: 10),
        pw.Text(
          'الاسم: ${invoiceData['customerName'] ?? ''}',
          style: pw.TextStyle(font: arabicFont, fontSize: 12),
        ),
        pw.Text(
          'البريد: ${invoiceData['customerEmail'] ?? ''}',
          style: pw.TextStyle(font: arabicFont, fontSize: 12),
        ),
        pw.Text(
          'الهاتف: ${invoiceData['customerPhone'] ?? ''}',
          style: pw.TextStyle(font: arabicFont, fontSize: 12),
        ),

        pw.SizedBox(height: 20),

        // Items Table
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.grey, width: 1),
          children: [
            // Header
            pw.TableRow(
              decoration: const pw.BoxDecoration(
                color: PdfColors.blue,
                borderRadius: pw.BorderRadius.only(
                  topLeft: pw.Radius.circular(8),
                  topRight: pw.Radius.circular(8),
                ),
              ),
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.all(12),
                  child: pw.Text(
                    'المنتج',
                    style: pw.TextStyle(
                      font: arabicFont,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(12),
                  child: pw.Text(
                    'الكمية',
                    style: pw.TextStyle(
                      font: arabicFont,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(12),
                  child: pw.Text(
                    'السعر',
                    style: pw.TextStyle(
                      font: arabicFont,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.all(12),
                  child: pw.Text(
                    'المجموع',
                    style: pw.TextStyle(
                      font: arabicFont,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            // Items
            ...items.map(
              (item) => pw.TableRow(
                decoration: const pw.BoxDecoration(
                  color: PdfColors.white,
                  border: pw.Border(
                    bottom: pw.BorderSide(color: PdfColors.grey, width: 0.5),
                  ),
                ),
                children: [
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(12),
                    child: pw.Text(
                      item['name'] ?? '',
                      style: pw.TextStyle(font: arabicFont, fontSize: 12),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(12),
                    child: pw.Text(
                      item['quantity'].toString(),
                      style: pw.TextStyle(font: arabicFont, fontSize: 12),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(12),
                    child: pw.Text(
                      item['price'].toString(),
                      style: pw.TextStyle(font: arabicFont, fontSize: 12),
                    ),
                  ),
                  pw.Padding(
                    padding: const pw.EdgeInsets.all(12),
                    child: pw.Text(
                      item['total'].toString(),
                      style: pw.TextStyle(font: arabicFont, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        pw.SizedBox(height: 20),

        // Totals
        pw.Container(
          width: double.infinity,
          padding: const pw.EdgeInsets.all(16),
          decoration: pw.BoxDecoration(
            color: PdfColors.grey100,
            borderRadius: pw.BorderRadius.circular(8),
            border: pw.Border.all(color: PdfColors.grey, width: 1),
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'المجموع الفرعي:',
                    style: pw.TextStyle(font: arabicFont, fontSize: 14),
                  ),
                  pw.Text(
                    '${invoiceData['subtotal'] ?? ''}',
                    style: pw.TextStyle(font: arabicFont, fontSize: 14),
                  ),
                ],
              ),
              pw.SizedBox(height: 8),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'الضريبة:',
                    style: pw.TextStyle(font: arabicFont, fontSize: 14),
                  ),
                  pw.Text(
                    '${invoiceData['taxAmount'] ?? ''}',
                    style: pw.TextStyle(font: arabicFont, fontSize: 14),
                  ),
                ],
              ),
              pw.SizedBox(height: 8),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'الخصم:',
                    style: pw.TextStyle(font: arabicFont, fontSize: 14),
                  ),
                  pw.Text(
                    '${invoiceData['discount'] ?? ''}',
                    style: pw.TextStyle(font: arabicFont, fontSize: 14),
                  ),
                ],
              ),
              pw.Divider(color: PdfColors.grey),
              pw.SizedBox(height: 8),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'المجموع الكلي:',
                    style: pw.TextStyle(
                      font: arabicFont,
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.blue,
                    ),
                  ),
                  pw.Text(
                    '${invoiceData['total'] ?? ''}',
                    style: pw.TextStyle(
                      font: arabicFont,
                      fontSize: 16,
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// بناء صف المجموع
  static pw.Widget _buildTotalRow(
    String label,
    String value,
    pw.Font arabicFont, {
    bool isTotal = false,
  }) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 2),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(
            label,
            style: pw.TextStyle(
              fontSize: isTotal ? 12 : 10,
              fontWeight: isTotal ? pw.FontWeight.bold : pw.FontWeight.normal,
              font: arabicFont,
            ),
          ),
          pw.Text(
            value,
            style: pw.TextStyle(
              fontSize: isTotal ? 12 : 10,
              fontWeight: isTotal ? pw.FontWeight.bold : pw.FontWeight.normal,
              font: arabicFont,
            ),
          ),
        ],
      ),
    );
  }
}
