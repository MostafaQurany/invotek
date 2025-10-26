import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/features/customers/domain/usecases/get_customers.dart';
import 'package:invotek/features/customers/domain/usecases/get_customer_by_id.dart';
import 'package:invotek/features/customers/domain/usecases/create_customer.dart';
import 'package:invotek/features/customers/domain/usecases/update_customer.dart';
import 'package:invotek/features/customers/domain/usecases/delete_customer.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';

part 'customers_cubit.freezed.dart';

@freezed
sealed class CustomersState with _$CustomersState {
  const factory CustomersState.initial({
    @Default([]) List<CustomerModel> customers,
    CustomerModel? selectedCustomer,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    Failure? error,
  }) = _Initial;

  const factory CustomersState.loading({
    @Default([]) List<CustomerModel> customers,
    CustomerModel? selectedCustomer,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    String? message,
  }) = _LoadingCustomers;

  const factory CustomersState.loaded({
    required List<CustomerModel> customers,
    CustomerModel? selectedCustomer,
    required int currentPage,
    required int totalPages,
  }) = _LoadedCustomers;

  const factory CustomersState.createSuccess({
    required List<CustomerModel> customers,
    required CustomerModel created,
    CustomerModel? selectedCustomer,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _CreateSuccessCustomers;

  const factory CustomersState.updateSuccess({
    required List<CustomerModel> customers,
    required CustomerModel updated,
    CustomerModel? selectedCustomer,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _UpdateSuccessCustomers;

  const factory CustomersState.deleteSuccess({
    required List<CustomerModel> customers,
    required int deletedId,
    CustomerModel? selectedCustomer,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _DeleteSuccessCustomers;

  const factory CustomersState.failure({
    @Default([]) List<CustomerModel> customers,
    CustomerModel? selectedCustomer,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    required Failure failure,
  }) = _FailureCustomers;
}

class CustomersCubit extends Cubit<CustomersState> {
  final GetCustomers _getCustomers;
  final GetCustomerById _getCustomerById;
  final CreateCustomer _createCustomer;
  final UpdateCustomer _updateCustomer;
  final DeleteCustomer _deleteCustomer;

  static CustomersCubit get(context) => BlocProvider.of(context);

  final List<CustomerModel> _customers = <CustomerModel>[];
  int _currentPage = 1;
  int _totalPages = 1;
  String? _lastSearch;
  String? _lastStatus;
  String? _lastCompany;
  int _pageSize = 20;
  bool _isLoadingPage = false;

  CustomersCubit({
    required GetCustomers getCustomers,
    required GetCustomerById getCustomerById,
    required CreateCustomer createCustomer,
    required UpdateCustomer updateCustomer,
    required DeleteCustomer deleteCustomer,
  }) : _getCustomers = getCustomers,
       _getCustomerById = getCustomerById,
       _createCustomer = createCustomer,
       _updateCustomer = updateCustomer,
       _deleteCustomer = deleteCustomer,
       super(const CustomersState.initial());

  List<CustomerModel> get customers => List.unmodifiable(_customers);
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  bool get hasMore => _currentPage < _totalPages;
  bool get isLoadingPage => _isLoadingPage;

  Future<void> loadFirstPage({
    bool refresh = false,
    String? search,
    String? status,
    String? company,
    int? limit,
  }) async {
    if (_isLoadingPage) return;
    _isLoadingPage = true;

    // Check if search parameters changed
    final searchChanged = _lastSearch != search;
    final statusChanged = _lastStatus != status;
    final companyChanged = _lastCompany != company;
    final shouldRefresh =
        refresh || searchChanged || statusChanged || companyChanged;

    if (shouldRefresh) {
      _customers.clear();
      _currentPage = 1;
      _totalPages = 1;
    }

    emit(
      CustomersState.loading(
        customers: _customers,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: shouldRefresh ? 'refreshing' : 'loading',
      ),
    );

    _lastSearch = search;
    _lastStatus = status;
    _lastCompany = company;
    _pageSize = limit ?? _pageSize;

    final result = await _getCustomers(
      GetCustomersParams(
        search: _lastSearch,
        status: _lastStatus,
        company: _lastCompany,
        page: 1,
        limit: _pageSize,
      ),
    );

    result.when(
      success: (paginationResult) {
        if (shouldRefresh) {
          _customers.clear();
        }
        _customers.addAll(
          paginationResult.customers
              .map((c) => _convertToCustomerModel(c))
              .toList(),
        );
        _currentPage = paginationResult.currentPage;
        _totalPages = paginationResult.totalPages;
        emit(
          CustomersState.loaded(
            customers: _customers,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          CustomersState.failure(
            customers: _customers,
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

    // Don't emit loading state for next page to avoid UI flicker
    // Just keep the current state and add new data

    final nextPage = _currentPage + 1;
    final result = await _getCustomers(
      GetCustomersParams(
        search: _lastSearch,
        status: _lastStatus,
        company: _lastCompany,
        page: nextPage,
        limit: _pageSize,
      ),
    );

    result.when(
      success: (paginationResult) {
        // Only add new customers, don't clear existing ones
        final newCustomers = paginationResult.customers
            .map((c) => _convertToCustomerModel(c))
            .toList();

        _customers.addAll(newCustomers);
        _currentPage = paginationResult.currentPage;
        _totalPages = paginationResult.totalPages;

        emit(
          CustomersState.loaded(
            customers: _customers,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          CustomersState.failure(
            customers: _customers,
            currentPage: _currentPage,
            totalPages: _totalPages,
            failure: failure,
          ),
        );
      },
    );

    _isLoadingPage = false;
  }

  void selectCustomer(CustomerModel? customer) {
    emit(
      CustomersState.loaded(
        customers: _customers,
        selectedCustomer: customer,
        currentPage: _currentPage,
        totalPages: _totalPages,
      ),
    );
  }

  Future<void> createCustomer({
    required String name,
    required String email,
    String? phone,
    String? address,
    String? taxNumber,
    String? notes,
    String status = 'active',
    String? companyName,
    String? commercialRegister,
    String? city,
    String? region,
    String? postalCode,
    String? detailedAddress,
    String? responsiblePerson,
  }) async {
    emit(
      CustomersState.loading(
        customers: _customers,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'creating',
      ),
    );

    final result = await _createCustomer(
      CreateCustomerParams(
        name: name,
        email: email,
        phone: phone,
        address: address,
        taxNumber: taxNumber,
        notes: notes,
        status: status,
        companyName: companyName,
        commercialRegister: commercialRegister,
        city: city,
        region: region,
        postalCode: postalCode,
        detailedAddress: detailedAddress,
        responsiblePerson: responsiblePerson,
      ),
    );

    result.when(
      success: (customer) {
        _customers.add(customer);
        emit(
          CustomersState.createSuccess(
            customers: _customers,
            created: customer,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          CustomersState.failure(
            customers: _customers,
            currentPage: _currentPage,
            totalPages: _totalPages,
            failure: failure,
          ),
        );
      },
    );
  }

  Future<void> updateCustomer({
    required int id,
    required String name,
    required String email,
    String? phone,
    String? address,
    String? taxNumber,
    String? notes,
    String status = 'active',
  }) async {
    emit(
      CustomersState.loading(
        customers: _customers,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'updating',
      ),
    );

    final result = await _updateCustomer(
      UpdateCustomerParams(
        id: id,
        name: name,
        email: email,
        phone: phone,
        address: address,
        taxNumber: taxNumber,
        notes: notes,
        status: status,
      ),
    );

    result.when(
      success: (updated) {
        final idx = _customers.indexWhere((c) => c.id == id);
        if (idx != -1) {
          _customers[idx] = updated;
        }
        emit(
          CustomersState.updateSuccess(
            customers: _customers,
            updated: updated,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          CustomersState.failure(
            customers: _customers,
            currentPage: _currentPage,
            totalPages: _totalPages,
            failure: failure,
          ),
        );
      },
    );
  }

  Future<void> deleteCustomer(int id) async {
    print('🗑️ Deleting customer with ID: $id');
    print('📊 Current customers count before deletion: ${_customers.length}');

    emit(
      CustomersState.loading(
        customers: _customers,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'deleting',
      ),
    );

    final result = await _deleteCustomer(id);

    result.when(
      success: (_) {
        print('✅ Delete API call successful');
        final initialCount = _customers.length;
        _customers.removeWhere((c) => c.id == id);
        final finalCount = _customers.length;
        print(
          '📊 Customers count after deletion: $finalCount (removed ${initialCount - finalCount})',
        );

        emit(
          CustomersState.deleteSuccess(
            customers: _customers,
            deletedId: id,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
        print(
          '🎯 Emitted deleteSuccess state with ${_customers.length} customers',
        );
      },
      failure: (failure) {
        print('❌ Delete API call failed: $failure');
        emit(
          CustomersState.failure(
            customers: _customers,
            currentPage: _currentPage,
            totalPages: _totalPages,
            failure: failure,
          ),
        );
      },
    );
  }

  Future<void> getCustomerById(int id) async {
    emit(
      CustomersState.loading(
        customers: _customers,
        selectedCustomer: null,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading_customer',
      ),
    );

    final result = await _getCustomerById(id);

    result.when(
      success: (customer) {
        emit(
          CustomersState.loaded(
            customers: _customers,
            selectedCustomer: customer,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          CustomersState.failure(
            customers: _customers,
            selectedCustomer: null,
            currentPage: _currentPage,
            totalPages: _totalPages,
            failure: failure,
          ),
        );
      },
    );
  }

  // Search customers
  Future<void> searchCustomers(String query) async {
    await loadFirstPage(search: query.isEmpty ? null : query, refresh: true);
  }

  // Clear search and reload all customers
  Future<void> clearSearch() async {
    await loadFirstPage(search: null, refresh: true);
  }

  // Convert API model to CustomerModel
  CustomerModel _convertToCustomerModel(dynamic apiCustomer) {
    return CustomerModel(
      id: apiCustomer.id,
      name: apiCustomer.name ?? '',
      email: apiCustomer.email ?? '',
      phone: apiCustomer.phone,
      address: apiCustomer.address,
      status: apiCustomer.status ?? 'active',
      updatedAt: apiCustomer.updatedAt,
      createdAt: apiCustomer.createdAt,
    );
  }
}
