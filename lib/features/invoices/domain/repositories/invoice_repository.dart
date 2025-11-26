import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/domain/entities/invoices_pagination_result.dart';
import 'package:invotek/features/invoices/data/models/requests/create_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/create_credit_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/update_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/delete_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/get_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/get_all_invoices_request.dart';
import 'package:invotek/features/invoices/data/models/requests/activating_tax_integration_request.dart';
import 'package:invotek/features/invoices/data/models/responses/activating_tax_integration_responses.dart';
import 'package:invotek/features/invoices/data/models/responses/deactivating_tax_integration_responses.dart';
import 'package:invotek/features/invoices/data/models/responses/get_tax_integration_status.dart';

abstract class InvoiceRepository {
  /// الحصول على جميع الفواتير
  Future<ApiResult<InvoicesPaginationResult>> getAllInvoices({
    required GetAllInvoicesRequest request,
  });

  /// الحصول على الفواتير الآجلة
  Future<ApiResult<InvoicesPaginationResult>> getCreditInvoices({
    required GetAllInvoicesRequest request,
  });

  /// الحصول على فاتورة واحدة
  Future<ApiResult<InvoiceEntity>> getInvoice({
    required GetInvoiceRequest request,
  });

  /// إنشاء فاتورة جديدة
  Future<ApiResult<InvoiceEntity>> createInvoice({
    required CreateInvoiceRequest request,
  });

  /// إنشاء فاتورة مرتجعة
  Future<ApiResult<InvoiceEntity>> createCreditInvoice({
    required int invoiceId,
    required CreateCreditInvoiceRequest request,
  });

  /// تحديث فاتورة موجودة
  Future<ApiResult<InvoiceEntity>> updateInvoice({
    required UpdateInvoiceRequest request,
  });

  /// حذف فاتورة
  Future<ApiResult<bool>> deleteInvoice({
    required DeleteInvoiceRequest request,
  });

  /// تفعيل التكامل الضريبي
  Future<ApiResult<ActivatingTaxIntegrationResponses>> activateTaxIntegration({
    required ActivatingTaxIntegrationRequest request,
  });

  /// إلغاء التكامل الضريبي
  Future<ApiResult<DeactivatingTaxIntegrationResponses>>
  deactivateTaxIntegration();

  /// الحصول على حالة التكامل الضريبي
  Future<ApiResult<GetTaxIntegrationStatus>> getTaxIntegrationStatus();
}
