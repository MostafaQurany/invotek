// lib/features/invoices/demo/cubit/credit_invoices_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/invoices/data/models/invoice_item.dart';
import 'package:invotek/features/invoices/data/models/invoice_customer_model.dart';
import 'package:invotek/features/invoices/data/models/requests/get_all_invoices_request.dart';
import 'package:invotek/features/invoices/domain/repositories/invoice_repository.dart' as domain;
import 'package:invotek/features/invoices/demo/cubit/invoices_cubit.dart';


/// Cubit مخصص للفواتير الآجلة (Credit Invoices)
/// يعيد استخدام نفس InvoicesState لتوحيد الواجهة
class CreditInvoicesCubit extends Cubit<InvoicesState> {
  final domain.InvoiceRepository _repository;
  static CreditInvoicesCubit get(context) => BlocProvider.of(context);

  final List<InvoiceModel> _invoices = <InvoiceModel>[];
  int _currentPage = 1;
  int _totalPages = 1;
  String? _lastSearch;
  String? _lastStatus;
  String? _lastPaymentMethod;
  String? _lastCustomerId;
  String? _lastDateFrom;
  String? _lastDateTo;
  String? _lastSortBy;
  String? _lastSortOrder;
  double? _lastMinAmount;
  double? _lastMaxAmount;
  int _pageSize = 20;
  bool _isLoadingPage = false;

  CreditInvoicesCubit(this._repository) : super(const InvoicesState.initial());

  List<InvoiceModel> get invoices => List.unmodifiable(_invoices);
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  bool get hasMore => _currentPage < _totalPages;

  Future<void> loadFirstPage({
    bool refresh = false,
    String? search,
    String? status,
    String? paymentMethod,
    String? customerId,
    String? dateFrom,
    String? dateTo,
    String? sortBy,
    String? sortOrder,
    double? minAmount,
    double? maxAmount,
    int? limit,
  }) async {
    if (_isLoadingPage) return;
    if (_invoices.isNotEmpty && !refresh) return;
    _isLoadingPage = true;

    _lastSearch = search;
    _lastStatus = status;
    _lastPaymentMethod = paymentMethod;
    _lastCustomerId = customerId;
    _lastDateFrom = dateFrom;
    _lastDateTo = dateTo;
    _lastSortBy = sortBy;
    _lastSortOrder = sortOrder;
    _lastMinAmount = minAmount;
    _lastMaxAmount = maxAmount;
    _pageSize = limit ?? _pageSize;

    _invoices.clear();
    _currentPage = 1;
    _totalPages = 1;

    emit(
      InvoicesState.loading(
        invoices: _invoices,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading',
      ),
    );

    final result = await _repository.getCreditInvoices(
      request: GetAllInvoicesRequest(
        search: _lastSearch,
        status: _lastStatus,
        paymentMethod: _lastPaymentMethod,
        customerId: _lastCustomerId,
        dateFrom: _lastDateFrom,
        dateTo: _lastDateTo,
        sortBy: _lastSortBy,
        sortOrder: _lastSortOrder,
        minAmount: _lastMinAmount?.toString(),
        maxAmount: _lastMaxAmount?.toString(),
        page: _currentPage.toString(),
        limit: _pageSize.toString(),
      ),
    );

    result.when(
      success: (paginationResult) {
        // Convert InvoiceEntity to InvoiceModel
        final invoiceModels = paginationResult.invoices.map((entity) {
          return InvoiceModel(
            id: entity.id,
            invoiceId: entity.invoiceId,
            invoiceNumber: entity.invoiceNumber,
            taxUid: entity.taxUid,
            qrCode: entity.qrCode,
            invoiceType: entity.invoiceType,
            documentType: entity.documentType,
            status: entity.status,
            errorMessage: entity.errorMessage,
            issueDate: entity.issueDate,
            customerName: entity.customerName,
            paymentMethodCode: entity.paymentMethodCode,
            subtotal: entity.subtotal,
            taxAmount: entity.taxAmount,
            discount: entity.discount,
            total: entity.total,
            description: entity.description,
            sentAt: entity.sentAt,
            createdAt: entity.createdAt,
            updatedAt: entity.updatedAt,
            companyId: entity.companyId,
            customerId: entity.customerId,
            items: entity.items?.map((item) {
              return InvoiceItem(
                id: item.id ?? 0,
                taxInvoiceId: item.taxInvoiceId ?? 0,
                name: item.name ?? '',
                description: item.description ?? '',
                quantity: item.quantity ?? '0',
                price: item.price ?? '0.00',
                discount: item.discount ?? '0.00',
                taxPercent: item.taxPercent ?? '0.00',
                taxAmount: item.taxAmount ?? '0.00',
                total: item.total ?? '0.00',
                createdAt: item.createdAt ?? '',
                updatedAt: item.updatedAt ?? '',
                productId: item.productId ?? 0,
              );
            }).toList(),
            customer: entity.customer != null
                ? InvoiceCustomerModel(
                    id: entity.customer!.id,
                    companyId: entity.customer!.companyId,
                    name: entity.customer!.name,
                    email: entity.customer!.email,
                    phone: entity.customer!.phone,
                    taxNumber: entity.customer!.taxNumber,
                    address: entity.customer!.address,
                    notes: entity.customer!.notes,
                    status: entity.customer!.status,
                    createdAt: entity.customer!.createdAt,
                    updatedAt: entity.customer!.updatedAt,
                  )
                : null,
            apiRequest: null,
          );
        }).toList();
        _invoices.addAll(invoiceModels);
        _currentPage = paginationResult.currentPage ?? 1;
        _totalPages = paginationResult.lastPage ?? 1;

        emit(
          InvoicesState.loaded(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          InvoicesState.failure(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
            failure: failure,
          ),
        );
      },
    );

    _isLoadingPage = false;
  }

  Future<void> loadNextPage() async {
    if (_isLoadingPage || !hasMore) return;
    _isLoadingPage = true;
    final nextPage = _currentPage + 1;

    emit(
      InvoicesState.loading(
        invoices: _invoices,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading_next',
      ),
    );

    final result = await _repository.getCreditInvoices(
      request: GetAllInvoicesRequest(
        search: _lastSearch,
        status: _lastStatus,
        paymentMethod: _lastPaymentMethod,
        customerId: _lastCustomerId,
        dateFrom: _lastDateFrom,
        dateTo: _lastDateTo,
        sortBy: _lastSortBy,
        sortOrder: _lastSortOrder,
        minAmount: _lastMinAmount?.toString(),
        maxAmount: _lastMaxAmount?.toString(),
        page: nextPage.toString(),
        limit: _pageSize.toString(),
      ),
    );

    result.when(
      success: (paginationResult) {
        _currentPage = nextPage;
        // Convert InvoiceEntity to InvoiceModel
        final invoiceModels = paginationResult.invoices.map((entity) {
          return InvoiceModel(
            id: entity.id,
            invoiceId: entity.invoiceId,
            invoiceNumber: entity.invoiceNumber,
            taxUid: entity.taxUid,
            qrCode: entity.qrCode,
            invoiceType: entity.invoiceType,
            documentType: entity.documentType,
            status: entity.status,
            errorMessage: entity.errorMessage,
            issueDate: entity.issueDate,
            customerName: entity.customerName,
            paymentMethodCode: entity.paymentMethodCode,
            subtotal: entity.subtotal,
            taxAmount: entity.taxAmount,
            discount: entity.discount,
            total: entity.total,
            description: entity.description,
            sentAt: entity.sentAt,
            createdAt: entity.createdAt,
            updatedAt: entity.updatedAt,
            companyId: entity.companyId,
            customerId: entity.customerId,
            items: entity.items?.map((item) {
              return InvoiceItem(
                id: item.id ?? 0,
                taxInvoiceId: item.taxInvoiceId ?? 0,
                name: item.name ?? '',
                description: item.description ?? '',
                quantity: item.quantity ?? '0',
                price: item.price ?? '0.00',
                discount: item.discount ?? '0.00',
                taxPercent: item.taxPercent ?? '0.00',
                taxAmount: item.taxAmount ?? '0.00',
                total: item.total ?? '0.00',
                createdAt: item.createdAt ?? '',
                updatedAt: item.updatedAt ?? '',
                productId: item.productId ?? 0,
              );
            }).toList(),
            customer: entity.customer != null
                ? InvoiceCustomerModel(
                    id: entity.customer!.id,
                    companyId: entity.customer!.companyId,
                    name: entity.customer!.name,
                    email: entity.customer!.email,
                    phone: entity.customer!.phone,
                    taxNumber: entity.customer!.taxNumber,
                    address: entity.customer!.address,
                    notes: entity.customer!.notes,
                    status: entity.customer!.status,
                    createdAt: entity.customer!.createdAt,
                    updatedAt: entity.customer!.updatedAt,
                  )
                : null,
            apiRequest: null,
          );
        }).toList();
        _invoices.addAll(invoiceModels);
        _totalPages = paginationResult.lastPage ?? 1;
        emit(
          InvoicesState.loaded(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          InvoicesState.failure(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
            failure: failure,
          ),
        );
      },
    );

    _isLoadingPage = false;
  }

  Future<void> refreshCurrentFilters() async {
    await loadFirstPage(
      search: _lastSearch,
      status: _lastStatus,
      paymentMethod: _lastPaymentMethod,
      customerId: _lastCustomerId,
      dateFrom: _lastDateFrom,
      dateTo: _lastDateTo,
      sortBy: _lastSortBy,
      sortOrder: _lastSortOrder,
      minAmount: _lastMinAmount,
      maxAmount: _lastMaxAmount,
      limit: _pageSize,
      refresh: true,
    );
  }
}


