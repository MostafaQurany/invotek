import 'dart:typed_data';

import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';

import '../../core/models/invoice_language.dart';
import '../../core/utils/paper_preset.dart';
import '../templates/tax_invoice_template.dart';

class PosPrinterService {
  const PosPrinterService();

  // دالة مساعدة لتحديد حجم الخط بناءً على عرض الورق
  double _getFontSizeFromWidth(int width) {
    if (width <= 384) return 18; // 58mm
    if (width <= 576) return 20; // 80mm
    return 22; // 80mm wide (712px)
  }

  // --------- ZATCA ----------
  Future<List<Uint8List>> previewZatca({
    required PaperPreset paper,
    required InvoiceModel invoice,
    required InvoiceLanguage invoiceLanguage,
    String fontFamily = 'Cairo',
    int sliceHeight = 900,
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
    final width = paper.width;
    final fontSize = _getFontSizeFromWidth(width);
    return await renderTaxInvoiceToPngChunks(
      data: TaxInvoiceData.fromInvoice(invoice),
      paperWidthPx: width,
      maxSliceHeightPx: sliceHeight,
      style: TaxInvoiceStyleConfig(),
      language: invoiceLanguage,
    );
  }

  Future<void> printZatca({
    required PaperPreset paper,
    required InvoiceModel invoice,
    required InvoiceLanguage invoiceLanguage,
    String fontFamily = 'Cairo',
    int sliceHeight = 900,
    int feedLines = 0, // قطع مباشر بعد QR Code
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
    final chunks = await previewZatca(
      paper: paper,
      invoice: invoice,
      invoiceLanguage: invoiceLanguage,
      fontFamily: fontFamily,
      sliceHeight: sliceHeight,
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
    final esc = EscCommand();
    await esc.cleanCommand();
    for (final img in chunks) {
      await esc.image(image: img);
    }
    await esc.print(feedLines: feedLines);
    final bytes = await esc.getCommand();
    if (bytes != null) await BluetoothPrintPlus.write(bytes);
  }
}
