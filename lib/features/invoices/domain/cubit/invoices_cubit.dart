// lib/features/invoices/domain/cubit/invoices_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/domain/usecases/get_invoices.dart';
import 'package:invotek/features/invoices/domain/usecases/create_invoice.dart';
import 'package:invotek/features/invoices/domain/usecases/update_invoice.dart';
import 'package:invotek/features/invoices/domain/usecases/delete_invoice.dart';
import 'package:invotek/features/invoices/domain/usecases/get_invoice_by_id.dart';
import 'package:invotek/features/invoices/domain/usecases/create_credit_invoice.dart';
import 'package:invotek/features/invoices/domain/usecases/send_invoice.dart';
import 'package:invotek/features/invoices/data/models/requests/activating_tax_integration_request.dart';
import 'package:invotek/features/invoices/data/models/requests/create_credit_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/create_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/delete_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/get_all_invoices_request.dart';
import 'package:invotek/features/invoices/data/models/requests/get_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/update_invoice_request.dart';
import 'package:invotek/features/invoices/domain/repositories/invoice_repository.dart';

part 'invoices_cubit.freezed.dart';
part 'invoices_state.dart';

class InvoicesCubit extends Cubit<InvoicesState> {
  final GetInvoices _getInvoices;
  final CreateInvoice _createInvoice;
  final UpdateInvoice _updateInvoice;
  final DeleteInvoice _deleteInvoice;
  final GetInvoiceById _getInvoiceById;
  final CreateCreditInvoice _createCreditInvoice;
  final SendInvoice _sendInvoice;
  final InvoiceRepository _repository; // For tax integration methods
  static InvoicesCubit get(context) => BlocProvider.of(context);

  // persistent invoices cache used across states
  final List<InvoiceEntity> _invoices = <InvoiceEntity>[];
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

  InvoicesCubit({
    required GetInvoices getInvoices,
    required CreateInvoice createInvoice,
    required UpdateInvoice updateInvoice,
    required DeleteInvoice deleteInvoice,
    required GetInvoiceById getInvoiceById,
    required CreateCreditInvoice createCreditInvoice,
    required SendInvoice sendInvoice,
    required InvoiceRepository repository,
  }) : _getInvoices = getInvoices,
       _createInvoice = createInvoice,
       _updateInvoice = updateInvoice,
       _deleteInvoice = deleteInvoice,
       _getInvoiceById = getInvoiceById,
       _createCreditInvoice = createCreditInvoice,
       _sendInvoice = sendInvoice,
       _repository = repository,
       super(const InvoicesState.initial());

  List<InvoiceEntity> get invoices => List.unmodifiable(_invoices);
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

    final result = await _getInvoices(
      GetAllInvoicesRequest(
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
        _invoices.addAll(paginationResult.invoices);
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

    final result = await _getInvoices(
      GetAllInvoicesRequest(
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
        _invoices.addAll(paginationResult.invoices);
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
      refresh: true,
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

    // إذا كان العميل موجوداً: إرسال customer_id فقط
    // إذا كان عميل جديد: إرسال name, email, phone فقط
    final isExistingCustomer = customerId != null;

    final result = await _createInvoice(
      CreateInvoiceRequest(
        customerId: isExistingCustomer ? customerId : null,
        customerName: isExistingCustomer ? null : customerName,
        customerEmail: isExistingCustomer ? null : customerEmail,
        customerPhone: isExistingCustomer ? null : customerPhone,
        customerAddress: null, // لا يُرسل في أي من الحالتين
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
      success: (invoice) {
        _invoices.add(invoice);
        emit(
          InvoicesState.createSuccess(
            invoices: _invoices,
            created: invoice,
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
  }

  /// Update existing invoice
  Future<void> updateInvoice({
    required String id,
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

    final result = await _updateInvoice(
      UpdateInvoiceRequest(
        id: id,
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
      success: (invoice) {
        for (var i = 0; i < _invoices.length; i++) {
          final inv = _invoices[i];
          if (inv.id?.toString() == id || inv.invoiceId?.toString() == id) {
            _invoices[i] = invoice;
            break;
          }
        }
        emit(
          InvoicesState.updateSuccess(
            invoices: _invoices,
            updated: invoice,
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

    final result = await _deleteInvoice(DeleteInvoiceRequest(id: id));

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

    final result = await _getInvoiceById(GetInvoiceRequest(id: id));

    result.when(
      success: (invoice) {
        emit(
          InvoicesState.loaded(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
            selectedInvoice: invoice,
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
      success: (_) {
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
      success: (_) {
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
      success: (_) {
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

  /// Create credit invoice (return invoice)
  Future<void> createCreditInvoice({
    required int invoiceId,
    required String issueDate,
    required String returnReason,
    String? description,
    required String action,
    required List<CreateInvoiceItemRequest>? items,
    required String subtotal,
    required String taxAmount,
    required String discount,
    required String total,
  }) async {
    emit(
      InvoicesState.loading(
        invoices: _invoices,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'creating_credit_invoice',
      ),
    );

    final result = await _createCreditInvoice(
      CreateCreditInvoiceParams(
        invoiceId: invoiceId,
        request: CreateCreditInvoiceRequest(
          issueDate: issueDate,
          returnReason: returnReason,
          description: description,
          action: action,
          items: items,
          subtotal: subtotal,
          taxAmount: taxAmount,
          discount: discount,
          total: total,
        ),
      ),
    );

    result.when(
      success: (invoice) {
        _invoices.add(invoice);
        emit(
          InvoicesState.createSuccess(
            invoices: _invoices,
            created: invoice,
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
  }

  /// Send invoice
  Future<void> sendInvoice({
    required int invoiceId,
  }) async {
    emit(
      InvoicesState.loading(
        invoices: _invoices,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'sending_invoice',
      ),
    );

    final result = await _sendInvoice(
      SendInvoiceParams(
        invoiceId: invoiceId,
      ),
    );

    result.when(
      success: (invoice) {
        // Update the invoice in the list
        final index = _invoices.indexWhere((inv) => inv.id == invoice.id);
        if (index != -1) {
          _invoices[index] = invoice;
        }
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
  }
}
