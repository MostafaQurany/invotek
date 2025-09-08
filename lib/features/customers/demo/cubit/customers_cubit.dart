import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/customers/data/repository/customers_repository.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';

part 'customers_cubit.freezed.dart';

@freezed
sealed class CustomersState with _$CustomersState {
  const factory CustomersState.initial({
    @Default([]) List<CustomerModel> customers,
    CustomerModel? selectedCustomer,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    String? error,
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
    required String error,
  }) = _FailureCustomers;
}

class CustomersCubit extends Cubit<CustomersState> {
  final CustomersRepository _repository;
  static CustomersCubit get(context) => BlocProvider.of(context);

  final List<CustomerModel> _customers = <CustomerModel>[];
  int _currentPage = 1;
  int _totalPages = 1;
  String? _lastSearch;
  String? _lastStatus;
  String? _lastCompany;
  int _pageSize = 20;
  bool _isLoadingPage = false;

  CustomersCubit(this._repository) : super(const CustomersState.initial());

  List<CustomerModel> get customers => List.unmodifiable(_customers);
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  bool get hasMore => _currentPage < _totalPages;

  Future<void> loadFirstPage({
    bool refresh = false,
    String? search,
    String? status,
    String? company,
    int? limit,
  }) async {
    if (_isLoadingPage) return;
    _isLoadingPage = true;

    if (refresh) {
      _customers.clear();
      _currentPage = 1;
      _totalPages = 1;
    }

    emit(
      CustomersState.loading(
        customers: _customers,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: refresh ? 'refreshing' : 'loading',
      ),
    );

    _lastSearch = search;
    _lastStatus = status;
    _lastCompany = company;
    _pageSize = limit ?? _pageSize;

    final result = await _repository.getCustomers(
      search: _lastSearch,
      status: _lastStatus,
      company: _lastCompany,
      page: 1,
      limit: _pageSize,
    );

    result.when(
      success: (data) {
        _customers
          ..clear()
          ..addAll(data);
        _currentPage = 1;
        _totalPages = data.length < _pageSize ? 1 : 2; // heuristic
        emit(
          CustomersState.loaded(
            customers: _customers,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          CustomersState.failure(
            customers: _customers,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
          ),
        );
      },
    );

    _isLoadingPage = false;
  }

  Future<void> loadNextPage() async {
    if (_isLoadingPage || !hasMore) return;
    _isLoadingPage = true;

    emit(
      CustomersState.loading(
        customers: _customers,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading_more',
      ),
    );

    final nextPage = _currentPage + 1;
    final result = await _repository.getCustomers(
      search: _lastSearch,
      status: _lastStatus,
      company: _lastCompany,
      page: nextPage,
      limit: _pageSize,
    );

    result.when(
      success: (data) {
        _customers.addAll(data);
        _currentPage = nextPage;
        if (data.isEmpty || data.length < _pageSize) {
          _totalPages = _currentPage;
        }
        emit(
          CustomersState.loaded(
            customers: _customers,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          CustomersState.failure(
            customers: _customers,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
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

    final result = await _repository.createCustomer(
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
      failure: (error) {
        emit(
          CustomersState.failure(
            customers: _customers,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
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

    final result = await _repository.updateCustomer(
      id: id,
      name: name,
      email: email,
      phone: phone,
      address: address,
      taxNumber: taxNumber,
      notes: notes,
      status: status,
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
      failure: (error) {
        emit(
          CustomersState.failure(
            customers: _customers,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
          ),
        );
      },
    );
  }

  Future<void> deleteCustomer(int id) async {
    emit(
      CustomersState.loading(
        customers: _customers,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'deleting',
      ),
    );

    final result = await _repository.deleteCustomer(id);

    result.when(
      success: (_) {
        _customers.removeWhere((c) => c.id == id);
        emit(
          CustomersState.deleteSuccess(
            customers: _customers,
            deletedId: id,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          CustomersState.failure(
            customers: _customers,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
          ),
        );
      },
    );
  }
}
