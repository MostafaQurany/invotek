import 'dart:typed_data';

import 'package:bluetooth_print_plus/bluetooth_print_plus.dart';
import 'package:flutter/scheduler.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/services/storage_service.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/settings/cubit/company_cubit.dart';
import 'package:invotek/features/settings/domain/usecases/get_company_settings.dart';

import '../../core/models/invoice_language.dart';
import '../../core/utils/paper_preset.dart';
import '../templates/tax_invoice_template.dart';

/// بيانات الشركة (اسم و logoUrl)
/// Company data (name and logoUrl)
class _CompanyData {
  final String? logoUrl;
  final String? name;

  _CompanyData({this.logoUrl, this.name});
}

class PosPrinterService {
  const PosPrinterService();

  // دالة مساعدة لتحديد حجم الخط بناءً على عرض الورق
  double _getFontSizeFromWidth(int width) {
    if (width <= 384) return 18; // 58mm
    if (width <= 576) return 20; // 80mm
    return 22; // 80mm wide (712px)
  }

  /// الحصول على بيانات الشركة من CompanyCubit مع fallback إلى GetCompanySettings ثم StorageService
  /// Get company data from CompanyCubit with fallback to GetCompanySettings then StorageService
  Future<_CompanyData> _getCompanyData() async {
    // محاولة 1: الحصول على بيانات الشركة من CompanyCubit إذا كان محملاً
    try {
      final companyCubit = getIt<CompanyCubit>();
      final companyState = companyCubit.state;

      if (companyState is CompanyLoaded) {
        final company = companyState.company;
        final logoUrl = company.logoUrl;
        final name = company.name;
        if ((logoUrl != null && logoUrl.isNotEmpty) ||
            (name != null && name.isNotEmpty)) {
          print(
            'Company data obtained from CompanyCubit: name=$name, logoUrl=$logoUrl',
          );
          return _CompanyData(logoUrl: logoUrl, name: name);
        }
      }
    } catch (e) {
      print('Error getting company data from CompanyCubit: $e');
      // Continue to next attempt
    }

    // محاولة 2: تحميل البيانات من API مباشرة باستخدام GetCompanySettings
    try {
      final getCompanySettings = getIt<GetCompanySettings>();
      final result = await getCompanySettings(const NoParams());

      String? logoUrlFromApi;
      String? nameFromApi;
      result.when(
        success: (companyData) {
          logoUrlFromApi = companyData.logoUrl;
          nameFromApi = companyData.name;
          print(
            'Company data obtained from GetCompanySettings: name=$nameFromApi, logoUrl=$logoUrlFromApi',
          );
        },
        failure: (error) {
          print('Error getting company settings from API: ${error.message}');
        },
      );

      if (logoUrlFromApi != null || nameFromApi != null) {
        return _CompanyData(logoUrl: logoUrlFromApi, name: nameFromApi);
      }
    } catch (e) {
      print('Error calling GetCompanySettings: $e');
      // Continue to fallback
    }

    // محاولة 3: Fallback إلى StorageService
    try {
      final userData = StorageService.getUserData();
      final company = userData?.user?.company;
      final logoUrl = company?.logo?.toString();
      final name = company?.name;
      if (logoUrl != null || name != null) {
        print(
          'Company data obtained from StorageService: name=$name, logoUrl=$logoUrl',
        );
        return _CompanyData(logoUrl: logoUrl, name: name);
      }
    } catch (e) {
      print('Error getting company data from StorageService: $e');
    }

    print(
      'No company data found in CompanyCubit, GetCompanySettings, or StorageService',
    );
    return _CompanyData();
  }

  /// الحصول على logoUrl الشركة من CompanyCubit مع fallback إلى GetCompanySettings ثم StorageService
  /// Get company logoUrl from CompanyCubit with fallback to GetCompanySettings then StorageService
  Future<String?> _getCompanyLogoUrl() async {
    // محاولة 1: الحصول على logoUrl من CompanyCubit إذا كان محملاً
    try {
      final companyCubit = getIt<CompanyCubit>();
      final companyState = companyCubit.state;

      if (companyState is CompanyLoaded) {
        final company = companyState.company;
        final logoUrl = company.logoUrl;
        if (logoUrl != null && logoUrl.isNotEmpty) {
          print('Company logoUrl obtained from CompanyCubit: $logoUrl');
          return logoUrl;
        }
      }
    } catch (e) {
      print('Error getting company logoUrl from CompanyCubit: $e');
      // Continue to next attempt
    }

    // محاولة 2: تحميل البيانات من API مباشرة باستخدام GetCompanySettings
    try {
      final getCompanySettings = getIt<GetCompanySettings>();
      final result = await getCompanySettings(const NoParams());

      String? logoUrlFromApi;
      result.when(
        success: (companyData) {
          logoUrlFromApi = companyData.logoUrl;
          print(
            'Company logoUrl obtained from GetCompanySettings: $logoUrlFromApi',
          );
        },
        failure: (error) {
          print('Error getting company settings from API: ${error.message}');
        },
      );

      if (logoUrlFromApi?.isNotEmpty ?? false) {
        return logoUrlFromApi;
      }
    } catch (e) {
      print('Error calling GetCompanySettings: $e');
      // Continue to fallback
    }

    // محاولة 3: Fallback إلى StorageService
    try {
      final userData = StorageService.getUserData();
      final company = userData?.user?.company;
      final logoUrl = company?.logo?.toString();
      if (logoUrl != null && logoUrl.isNotEmpty) {
        print('Company logoUrl obtained from StorageService: $logoUrl');
        return logoUrl;
      }
    } catch (e) {
      print('Error getting company logoUrl from StorageService: $e');
    }

    print(
      'No company logoUrl found in CompanyCubit, GetCompanySettings, or StorageService',
    );
    return null;
  }

  // --------- ZATCA ----------
  Future<List<Uint8List>> previewZatca({
    required PaperPreset paper,
    required InvoiceModel invoice,
    required InvoiceLanguage invoiceLanguage,
    String fontFamily = 'Cairo',
    int sliceHeight = 900,
    Function(double progress)? onProgress,
    Function(String message, bool isError)? onLogoStatusUpdate,
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

    // Get company logoUrl with fallback mechanism
    final logoUrl = await _getCompanyLogoUrl();

    // Get company name from CompanyCubit with fallback
    final companyData = await _getCompanyData();

    // Pre-load company logo before rendering to prevent thread blocking
    final invoiceData = TaxInvoiceData.fromInvoice(
      invoice,
      companyLogoUrl: logoUrl,
      companyName: companyData.name ?? 'Invotek',
    );
    final logoImage = await TaxInvoiceRenderer.loadCompanyLogo(
      invoiceData.companyLogoUrl,
      onStatusUpdate: onLogoStatusUpdate,
    );

    return await renderTaxInvoiceToPngChunks(
      data: invoiceData,
      paperWidthPx: width,
      maxSliceHeightPx: sliceHeight,
      style: TaxInvoiceStyleConfig(),
      language: invoiceLanguage,
      onProgress: onProgress,
      logoImage: logoImage,
    );
  }

  Future<void> printZatca({
    required PaperPreset paper,
    required InvoiceModel invoice,
    required InvoiceLanguage invoiceLanguage,
    String fontFamily = 'Cairo',
    int sliceHeight = 900,
    int feedLines = 0, // قطع مباشر بعد QR Code
    Function(double progress)? onRenderingProgress,
    Function(double progress)? onProgress,
    Function(String message, bool isError)? onLogoStatusUpdate,
    bool Function()? shouldCancel,
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
      onProgress: onRenderingProgress,
      onLogoStatusUpdate: onLogoStatusUpdate,
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

    if (shouldCancel?.call() ?? false) {
      return;
    }

    final esc = EscCommand();
    await esc.cleanCommand();

    for (int i = 0; i < chunks.length; i++) {
      // التحقق من الإلغاء
      if (shouldCancel?.call() ?? false) {
        return;
      }

      // Yield قبل كل صورة
      await Future.microtask(() {});
      await SchedulerBinding.instance.endOfFrame;

      await esc.image(image: chunks[i]);

      // تحديث التقدم
      onProgress?.call((i + 1) / chunks.length);

      // Yield بعد كل صورة
      await Future.microtask(() {});
    }

    await esc.print(feedLines: feedLines);
    final bytes = await esc.getCommand();

    if (bytes != null) {
      // Yield قبل الإرسال
      await Future.microtask(() {});
      await SchedulerBinding.instance.endOfFrame;

      await BluetoothPrintPlus.write(bytes);

      // Yield بعد الإرسال
      await Future.microtask(() {});
    }
  }
}
