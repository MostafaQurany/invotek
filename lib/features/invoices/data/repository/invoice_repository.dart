// lib/features/invoices/data/repository/invoice_repository.dart
import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/features/invoices/domain/repositories/invoice_repository.dart'
    as domain;
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/domain/entities/invoices_pagination_result.dart';

import '../models/requests/create_invoice_request.dart';
import '../models/requests/create_credit_invoice_request.dart';
import '../models/requests/update_invoice_request.dart';
import '../models/requests/delete_invoice_request.dart';
import '../models/requests/get_invoice_request.dart';
import '../models/requests/get_all_invoices_request.dart';
import '../models/requests/activating_tax_integration_request.dart';
import '../models/responses/activating_tax_integration_responses.dart';
import '../models/responses/deactivating_tax_integration_responses.dart';
import '../models/responses/get_tax_integration_status.dart';

class InvoiceRepositoryImpl implements domain.InvoiceRepository {
  final ApiClient _apiClient;

  InvoiceRepositoryImpl({required ApiClient apiClient})
    : _apiClient = apiClient;

  /// الحصول على جميع الفواتير
  @override
  Future<ApiResult<InvoicesPaginationResult>> getAllInvoices({
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
      final invoices =
          response.data.data?.map((e) => e.toEntity()).toList() ?? [];
      final paginationResult = InvoicesPaginationResult(
        invoices: invoices,
        total: response.data.total?.toInt(),
        lastPage: response.data.lastPage?.toInt(),
        currentPage: response.data.currentPage?.toInt(),
      );
      return ApiResult.success(paginationResult);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  /// الحصول على الفواتير الآجلة
  @override
  Future<ApiResult<InvoicesPaginationResult>> getCreditInvoices({
    required GetAllInvoicesRequest request,
  }) async {
    try {
      final response = await _apiClient.getCreditInvoices(
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
      final invoices =
          response.data.data?.map((e) => e.toEntity()).toList() ?? [];
      final paginationResult = InvoicesPaginationResult(
        invoices: invoices,
        total: response.data.total?.toInt(),
        lastPage: response.data.lastPage?.toInt(),
        currentPage: response.data.currentPage?.toInt(),
      );
      return ApiResult.success(paginationResult);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  /// الحصول على فاتورة واحدة
  @override
  Future<ApiResult<InvoiceEntity>> getInvoice({
    required GetInvoiceRequest request,
  }) async {
    try {
      final response = await _apiClient.getInvoiceById(int.parse(request.id));
      return ApiResult.success(response.data.toEntity());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  /// إنشاء فاتورة جديدة
  @override
  Future<ApiResult<InvoiceEntity>> createInvoice({
    required CreateInvoiceRequest request,
  }) async {
    try {
      final response = await _apiClient.createInvoice(request);
      return ApiResult.success(response.data.toEntity());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  /// إنشاء فاتورة مرتجعة
  @override
  Future<ApiResult<InvoiceEntity>> createCreditInvoice({
    required int invoiceId,
    required CreateCreditInvoiceRequest request,
  }) async {
    try {
      final response = await _apiClient.createCreditInvoice(invoiceId, request);
      return ApiResult.success(response.data.toEntity());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  /// تحديث فاتورة موجودة
  @override
  Future<ApiResult<InvoiceEntity>> updateInvoice({
    required UpdateInvoiceRequest request,
  }) async {
    try {
      final response = await _apiClient.updateInvoice(
        int.parse(request.id ?? '0'),
        request,
      );
      return ApiResult.success(response.data.toEntity());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  /// حذف فاتورة
  @override
  Future<ApiResult<bool>> deleteInvoice({
    required DeleteInvoiceRequest request,
  }) async {
    try {
      final response = await _apiClient.deleteInvoice(request.id);
      return ApiResult.success(response.success);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  /// إرسال فاتورة
  @override
  Future<ApiResult<InvoiceEntity>> sendInvoice({
    required int invoiceId,
  }) async {
    try {
      final response = await _apiClient.sendInvoice(invoiceId);
      return ApiResult.success(response.data.toEntity());
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  /// تفعيل التكامل الضريبي
  @override
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
  @override
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
  @override
  Future<ApiResult<GetTaxIntegrationStatus>> getTaxIntegrationStatus() async {
    try {
      final response = await _apiClient.getTaxIntegrationStatus();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }
}
