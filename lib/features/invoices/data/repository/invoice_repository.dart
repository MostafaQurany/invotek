// lib/features/invoices/data/repository/invoice_repository.dart
import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/server/api_client.dart';

import '../models/requests/create_invoice_request.dart';
import '../models/requests/update_invoice_request.dart';
import '../models/requests/delete_invoice_request.dart';
import '../models/requests/get_invoice_request.dart';
import '../models/requests/get_all_invoices_request.dart';
import '../models/requests/activating_tax_integration_request.dart';
import '../models/responses/get_all_invoices_response.dart';
import '../models/responses/get_invoice_response.dart';
import '../models/responses/create_invoice_response.dart';
import '../models/responses/update_invoice_response.dart';
import '../models/responses/delete_invoice_response.dart';
import '../models/responses/activating_tax_integration_responses.dart';
import '../models/responses/deactivating_tax_integration_responses.dart';
import '../models/responses/get_tax_integration_status.dart';

class InvoiceRepository {
  final ApiClient _apiClient;

  InvoiceRepository({required ApiClient apiClient}) : _apiClient = apiClient;

  /// الحصول على جميع الفواتير
  Future<ApiResult<GetAllInvoicesResponse>> getAllInvoices({
    required GetAllInvoicesRequest request,
  }) async {
    try {
      final response = await _apiClient.getAllInvoices(
        search: request.search,
        status: request.status,
        customerId: (request.customerId == null)
            ? null
            : int.parse(request.customerId!),
        paymentMethod: request.paymentMethod,
        dateFrom: request.dateFrom,
        dateTo: request.dateTo,
        page: (request.page == null) ? null : int.parse(request.page!),
        limit: (request.limit == null) ? null : int.parse(request.limit!),
        sortBy: request.sortBy,
        sortOrder: request.sortOrder,
        minAmount: (request.minAmount == null)
            ? null
            : double.parse(request.minAmount!),
        maxAmount: (request.maxAmount == null)
            ? null
            : double.parse(request.maxAmount!),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  /// الحصول على فاتورة واحدة
  Future<ApiResult<GetInvoiceResponse>> getInvoice({
    required GetInvoiceRequest request,
  }) async {
    try {
      final response = await _apiClient.getInvoiceById(int.parse(request.id));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  /// إنشاء فاتورة جديدة
  Future<ApiResult<CreateInvoiceResponse>> createInvoice({
    required CreateInvoiceRequest request,
  }) async {
    try {
      final response = await _apiClient.createInvoice(request);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  /// تحديث فاتورة موجودة
  Future<ApiResult<UpdateInvoiceResponse>> updateInvoice({
    required UpdateInvoiceRequest request,
  }) async {
    try {
      final response = await _apiClient.updateInvoice(
        int.parse(request.id ?? '0'),
        request,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  /// حذف فاتورة
  Future<ApiResult<DeleteInvoiceResponse>> deleteInvoice({
    required DeleteInvoiceRequest request,
  }) async {
    try {
      final response = await _apiClient.deleteInvoice(int.parse(request.id));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  /// تفعيل التكامل الضريبي
  Future<ApiResult<ActivatingTaxIntegrationResponses>> activateTaxIntegration({
    required ActivatingTaxIntegrationRequest request,
  }) async {
    try {
      final response = await _apiClient.activateTaxIntegration(request);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  /// إلغاء التكامل الضريبي
  Future<ApiResult<DeactivatingTaxIntegrationResponses>>
  deactivateTaxIntegration() async {
    try {
      final response = await _apiClient.deactivateTaxIntegration();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  /// الحصول على حالة التكامل الضريبي
  Future<ApiResult<GetTaxIntegrationStatus>> getTaxIntegrationStatus() async {
    try {
      final response = await _apiClient.getTaxIntegrationStatus();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }
}
