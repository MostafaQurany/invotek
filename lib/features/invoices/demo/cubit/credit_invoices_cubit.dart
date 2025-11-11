// lib/features/invoices/demo/cubit/credit_invoices_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/invoices/data/models/requests/get_all_invoices_request.dart';
import 'package:invotek/features/invoices/data/repository/invoice_repository.dart';
import 'package:invotek/features/invoices/demo/cubit/invoices_cubit.dart';


/// Cubit مخصص للفواتير الآجلة (Credit Invoices)
/// يعيد استخدام نفس InvoicesState لتوحيد الواجهة
class CreditInvoicesCubit extends Cubit<InvoicesState> {
  final InvoiceRepository _repository;
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


