// lib/features/invoices/demo/cubit/invoices_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/data/repository/invoice_repository.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/invoices/data/models/requests/get_all_invoices_request.dart';
import 'package:invotek/features/invoices/data/models/requests/create_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/update_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/delete_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/get_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/activating_tax_integration_request.dart';

part 'invoices_state.dart';

part 'invoices_cubit.freezed.dart';

class InvoicesCubit extends Cubit<InvoicesState> {
  final InvoiceRepository _repository;
  static InvoicesCubit get(context) => BlocProvider.of(context);

  // persistent invoices cache used across states
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

  InvoicesCubit(this._repository) : super(const InvoicesState.initial());

  List<InvoiceModel> get invoices => List.unmodifiable(_invoices);
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  bool get hasMore => _currentPage < _totalPages;

  /// Load first page of invoices with optional filters
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

    // Store filter parameters for pagination
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

    final result = await _repository.getAllInvoices(
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
      success: (response) {
        _invoices.addAll(response.data.data ?? []);
        _currentPage = response.data.currentPage?.toInt() ?? 1;
        _totalPages = response.data.lastPage?.toInt() ?? 1;

        emit(
          InvoicesState.loaded(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          InvoicesState.failure(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
          ),
        );
      },
    );

    _isLoadingPage = false;
  }

  /// Load next page of invoices
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

    final result = await _repository.getAllInvoices(
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
      success: (response) {
        _currentPage = nextPage;
        _invoices.addAll(response.data.data ?? []);
        _totalPages = response.data.lastPage?.toInt() ?? 1;

        emit(
          InvoicesState.loaded(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          InvoicesState.failure(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
          ),
        );
      },
    );

    _isLoadingPage = false;
  }

  /// Refresh current filters
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
    );
  }

  /// Create new invoice
  Future<void> createInvoice({
    String? customerId,
    String? customerName,
    String? customerEmail,
    String? customerPhone,
    String? customerAddress,
    required String subtotal,
    required String taxAmount,
    required String discount,
    required String total,
    required String issueDate,
    required String status,
    String? description,
    required String paymentMethodCode,
    required String action,
    List<CreateInvoiceItemRequest>? items,
  }) async {
    emit(
      InvoicesState.loading(
        invoices: _invoices,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'creating',
      ),
    );

    final result = await _repository.createInvoice(
      request: CreateInvoiceRequest(
        customerId: customerId,
        customerName: customerName,
        customerEmail: customerEmail,
        customerPhone: customerPhone,
        customerAddress: customerAddress,
        subtotal: subtotal,
        taxAmount: taxAmount,
        discount: discount,
        total: total,
        issueDate: issueDate,
        status: status,
        description: description,
        paymentMethodCode: paymentMethodCode,
        action: action,
        items: items,
      ),
    );

    result.when(
      success: (response) {
        _invoices.add(response.data);
        emit(
          InvoicesState.createSuccess(
            invoices: _invoices,
            created: response.data,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          InvoicesState.failure(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
          ),
        );
      },
    );
  }

  /// Update existing invoice
  Future<void> updateInvoice({
    required String id,
    String? status,
    String? customerId,
    String? customerName,
    String? customerEmail,
    String? customerPhone,
    String? customerAddress,
    String? subtotal,
    String? taxAmount,
    String? discount,
    String? total,
    String? issueDate,
    String? description,
    String? paymentMethodCode,
    String? action,
    List<UpdateInvoiceItemRequest>? items,
  }) async {
    emit(
      InvoicesState.loading(
        invoices: _invoices,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'updating',
      ),
    );

    final result = await _repository.updateInvoice(
      request: UpdateInvoiceRequest(
        id: id,
        status: status,
        customerId: customerId,
        customerName: customerName,
        customerEmail: customerEmail,
        customerPhone: customerPhone,
        customerAddress: customerAddress,
        subtotal: subtotal,
        taxAmount: taxAmount,
        discount: discount,
        total: total,
        issueDate: issueDate,
        description: description,
        paymentMethodCode: paymentMethodCode,
        action: action,
        items: items,
      ),
    );

    result.when(
      success: (response) {
        for (var i = 0; i < _invoices.length; i++) {
          final invoice = _invoices[i];
          if (invoice.id == id) {
            _invoices[i] = response.data;
            break;
          }
        }
        emit(
          InvoicesState.updateSuccess(
            invoices: _invoices,
            updated: response.data,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          InvoicesState.failure(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
          ),
        );
      },
    );
  }

  /// Delete invoice
  Future<void> deleteInvoice(int id) async {
    emit(
      InvoicesState.loading(
        invoices: _invoices,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'deleting',
      ),
    );

    final result = await _repository.deleteInvoice(
      request: DeleteInvoiceRequest(id: id),
    );

    result.when(
      success: (_) {
        _invoices.removeWhere((invoice) => invoice.id == id);
        emit(
          InvoicesState.deleteSuccess(
            invoices: _invoices,
            deletedId: id,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          InvoicesState.failure(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
          ),
        );
      },
    );
  }

  /// Get invoice by ID
  Future<void> getInvoiceById(String id) async {
    emit(
      InvoicesState.loading(
        invoices: _invoices,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading_invoice',
      ),
    );

    final result = await _repository.getInvoice(request: GetInvoiceRequest(id: id));

    result.when(
      success: (response) {
        emit(
          InvoicesState.loaded(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
            selectedInvoice: response.data,
          ),
        );
      },
      failure: (error) {
        emit(
          InvoicesState.failure(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
          ),
        );
      },
    );
  }

  /// Activate tax integration
  Future<void> activateTaxIntegration({
    required String taxInvoiceType,
    required String taxMerchantCode,
  }) async {
    emit(
      InvoicesState.loading(
        invoices: _invoices,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'activating_tax_integration',
      ),
    );

    final result = await _repository.activateTaxIntegration(
      request: ActivatingTaxIntegrationRequest(
        taxInvoiceType: taxInvoiceType,
        taxMerchantCode: taxMerchantCode,
      ),
    );

    result.when(
      success: (response) {
        emit(
          InvoicesState.loaded(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          InvoicesState.failure(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
          ),
        );
      },
    );
  }

  /// Deactivate tax integration
  Future<void> deactivateTaxIntegration() async {
    emit(
      InvoicesState.loading(
        invoices: _invoices,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'deactivating_tax_integration',
      ),
    );

    final result = await _repository.deactivateTaxIntegration();

    result.when(
      success: (response) {
        emit(
          InvoicesState.loaded(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          InvoicesState.failure(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
          ),
        );
      },
    );
  }

  /// Get tax integration status
  Future<void> getTaxIntegrationStatus() async {
    emit(
      InvoicesState.loading(
        invoices: _invoices,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading_tax_status',
      ),
    );

    final result = await _repository.getTaxIntegrationStatus();

    result.when(
      success: (response) {
        emit(
          InvoicesState.loaded(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          InvoicesState.failure(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
          ),
        );
      },
    );
  }

  /// Clear error state
  void clearError() {
    state.maybeWhen(
      orElse: () => emit(
        InvoicesState.loaded(
          invoices: _invoices,
          currentPage: _currentPage,
          totalPages: _totalPages,
        ),
      ),
      failure: (invoices, selectedInvoice, currentPage, totalPages, error) =>
          emit(
            InvoicesState.loaded(
              invoices: _invoices,
              currentPage: _currentPage,
              totalPages: _totalPages,
            ),
          ),
    );
  }

  /// Clear selected invoice
  void clearSelectedInvoice() {
    emit(
      InvoicesState.loaded(
        invoices: _invoices,
        currentPage: _currentPage,
        totalPages: _totalPages,
        selectedInvoice: null,
      ),
    );
  }

  /// Get current filter parameters
  Map<String, dynamic> getCurrentFilters() {
    return {
      'search': _lastSearch,
      'status': _lastStatus,
      'paymentMethod': _lastPaymentMethod,
      'customerId': _lastCustomerId,
      'dateFrom': _lastDateFrom,
      'dateTo': _lastDateTo,
      'sortBy': _lastSortBy,
      'sortOrder': _lastSortOrder,
      'minAmount': _lastMinAmount,
      'maxAmount': _lastMaxAmount,
    };
  }

  /// Set page size
  void setPageSize(int size) {
    _pageSize = size;
  }

  /// Get page size
  int get pageSize => _pageSize;
}
