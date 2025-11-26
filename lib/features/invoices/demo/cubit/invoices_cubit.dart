// lib/features/invoices/demo/cubit/invoices_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/invoices/data/models/invoice_item.dart';
import 'package:invotek/features/invoices/data/models/invoice_customer_model.dart';
import 'package:invotek/features/invoices/data/models/requests/activating_tax_integration_request.dart';
import 'package:invotek/features/invoices/data/models/requests/create_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/delete_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/get_all_invoices_request.dart';
import 'package:invotek/features/invoices/data/models/requests/get_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/update_invoice_request.dart';
import 'package:invotek/features/invoices/domain/repositories/invoice_repository.dart' as domain;

part 'invoices_cubit.freezed.dart';
part 'invoices_state.dart';

class InvoicesCubit extends Cubit<InvoicesState> {
  final domain.InvoiceRepository _repository;
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

    final result = await _repository.createInvoice(
      request: CreateInvoiceRequest(
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
      success: (invoiceEntity) {
        // Convert InvoiceEntity to InvoiceModel
        final invoiceModel = InvoiceModel(
          id: invoiceEntity.id,
          invoiceId: invoiceEntity.invoiceId,
          invoiceNumber: invoiceEntity.invoiceNumber,
          taxUid: invoiceEntity.taxUid,
          qrCode: invoiceEntity.qrCode,
          invoiceType: invoiceEntity.invoiceType,
          documentType: invoiceEntity.documentType,
          status: invoiceEntity.status,
          errorMessage: invoiceEntity.errorMessage,
          issueDate: invoiceEntity.issueDate,
          customerName: invoiceEntity.customerName,
          paymentMethodCode: invoiceEntity.paymentMethodCode,
          subtotal: invoiceEntity.subtotal,
          taxAmount: invoiceEntity.taxAmount,
          discount: invoiceEntity.discount,
          total: invoiceEntity.total,
          description: invoiceEntity.description,
          sentAt: invoiceEntity.sentAt,
          createdAt: invoiceEntity.createdAt,
          updatedAt: invoiceEntity.updatedAt,
          companyId: invoiceEntity.companyId,
          customerId: invoiceEntity.customerId,
          items: invoiceEntity.items?.map((item) {
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
          customer: invoiceEntity.customer != null
              ? InvoiceCustomerModel(
                  id: invoiceEntity.customer!.id,
                  companyId: invoiceEntity.customer!.companyId,
                  name: invoiceEntity.customer!.name,
                  email: invoiceEntity.customer!.email,
                  phone: invoiceEntity.customer!.phone,
                  taxNumber: invoiceEntity.customer!.taxNumber,
                  address: invoiceEntity.customer!.address,
                  notes: invoiceEntity.customer!.notes,
                  status: invoiceEntity.customer!.status,
                  createdAt: invoiceEntity.customer!.createdAt,
                  updatedAt: invoiceEntity.customer!.updatedAt,
                )
              : null,
          apiRequest: null,
        );
        _invoices.add(invoiceModel);
        emit(
          InvoicesState.createSuccess(
            invoices: _invoices,
            created: invoiceModel,
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

    final result = await _repository.updateInvoice(
      request: UpdateInvoiceRequest(
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
      success: (invoiceEntity) {
        // Convert InvoiceEntity to InvoiceModel
        final invoiceModel = InvoiceModel(
          id: invoiceEntity.id,
          invoiceId: invoiceEntity.invoiceId,
          invoiceNumber: invoiceEntity.invoiceNumber,
          taxUid: invoiceEntity.taxUid,
          qrCode: invoiceEntity.qrCode,
          invoiceType: invoiceEntity.invoiceType,
          documentType: invoiceEntity.documentType,
          status: invoiceEntity.status,
          errorMessage: invoiceEntity.errorMessage,
          issueDate: invoiceEntity.issueDate,
          customerName: invoiceEntity.customerName,
          paymentMethodCode: invoiceEntity.paymentMethodCode,
          subtotal: invoiceEntity.subtotal,
          taxAmount: invoiceEntity.taxAmount,
          discount: invoiceEntity.discount,
          total: invoiceEntity.total,
          description: invoiceEntity.description,
          sentAt: invoiceEntity.sentAt,
          createdAt: invoiceEntity.createdAt,
          updatedAt: invoiceEntity.updatedAt,
          companyId: invoiceEntity.companyId,
          customerId: invoiceEntity.customerId,
          items: invoiceEntity.items?.map((item) {
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
          customer: invoiceEntity.customer != null
              ? InvoiceCustomerModel(
                  id: invoiceEntity.customer!.id,
                  companyId: invoiceEntity.customer!.companyId,
                  name: invoiceEntity.customer!.name,
                  email: invoiceEntity.customer!.email,
                  phone: invoiceEntity.customer!.phone,
                  taxNumber: invoiceEntity.customer!.taxNumber,
                  address: invoiceEntity.customer!.address,
                  notes: invoiceEntity.customer!.notes,
                  status: invoiceEntity.customer!.status,
                  createdAt: invoiceEntity.customer!.createdAt,
                  updatedAt: invoiceEntity.customer!.updatedAt,
                )
              : null,
          apiRequest: null,
        );
        for (var i = 0; i < _invoices.length; i++) {
          final invoice = _invoices[i];
          if (invoice.id?.toString() == id) {
            _invoices[i] = invoiceModel;
            break;
          }
        }
        emit(
          InvoicesState.updateSuccess(
            invoices: _invoices,
            updated: invoiceModel,
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

    final result = await _repository.getInvoice(
      request: GetInvoiceRequest(id: id),
    );

    result.when(
      success: (invoiceEntity) {
        // Convert InvoiceEntity to InvoiceModel
        final invoiceModel = InvoiceModel(
          id: invoiceEntity.id,
          invoiceId: invoiceEntity.invoiceId,
          invoiceNumber: invoiceEntity.invoiceNumber,
          taxUid: invoiceEntity.taxUid,
          qrCode: invoiceEntity.qrCode,
          invoiceType: invoiceEntity.invoiceType,
          documentType: invoiceEntity.documentType,
          status: invoiceEntity.status,
          errorMessage: invoiceEntity.errorMessage,
          issueDate: invoiceEntity.issueDate,
          customerName: invoiceEntity.customerName,
          paymentMethodCode: invoiceEntity.paymentMethodCode,
          subtotal: invoiceEntity.subtotal,
          taxAmount: invoiceEntity.taxAmount,
          discount: invoiceEntity.discount,
          total: invoiceEntity.total,
          description: invoiceEntity.description,
          sentAt: invoiceEntity.sentAt,
          createdAt: invoiceEntity.createdAt,
          updatedAt: invoiceEntity.updatedAt,
          companyId: invoiceEntity.companyId,
          customerId: invoiceEntity.customerId,
          items: invoiceEntity.items?.map((item) {
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
          customer: invoiceEntity.customer != null
              ? InvoiceCustomerModel(
                  id: invoiceEntity.customer!.id,
                  companyId: invoiceEntity.customer!.companyId,
                  name: invoiceEntity.customer!.name,
                  email: invoiceEntity.customer!.email,
                  phone: invoiceEntity.customer!.phone,
                  taxNumber: invoiceEntity.customer!.taxNumber,
                  address: invoiceEntity.customer!.address,
                  notes: invoiceEntity.customer!.notes,
                  status: invoiceEntity.customer!.status,
                  createdAt: invoiceEntity.customer!.createdAt,
                  updatedAt: invoiceEntity.customer!.updatedAt,
                )
              : null,
          apiRequest: null,
        );
        emit(
          InvoicesState.loaded(
            invoices: _invoices,
            currentPage: _currentPage,
            totalPages: _totalPages,
            selectedInvoice: invoiceModel,
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
      success: (response) {
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
      success: (response) {
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
      success: (response) {
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
}
