import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/features/expenses/data/repository/expenses_repository.dart';
import 'package:invotek/features/expenses/domain/entit/expense_model.dart';

part 'expenses_cubit.freezed.dart';

@freezed
sealed class ExpensesState with _$ExpensesState {
  const factory ExpensesState.initial({
    @Default([]) List<ExpenseModel> expenses,
    ExpenseModel? selectedExpense,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    Failure? error,
  }) = _Initial;

  const factory ExpensesState.loading({
    @Default([]) List<ExpenseModel> expenses,
    ExpenseModel? selectedExpense,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    String? message,
  }) = _LoadingExpenses;

  const factory ExpensesState.loaded({
    required List<ExpenseModel> expenses,
    ExpenseModel? selectedExpense,
    required int currentPage,
    required int totalPages,
  }) = _LoadedExpenses;

  const factory ExpensesState.createSuccess({
    required List<ExpenseModel> expenses,
    required ExpenseModel created,
    ExpenseModel? selectedExpense,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _CreateSuccessExpenses;

  const factory ExpensesState.updateSuccess({
    required List<ExpenseModel> expenses,
    required ExpenseModel updated,
    ExpenseModel? selectedExpense,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _UpdateSuccessExpenses;

  const factory ExpensesState.deleteSuccess({
    required List<ExpenseModel> expenses,
    required int deletedId,
    ExpenseModel? selectedExpense,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _DeleteSuccessExpenses;

  const factory ExpensesState.failure({
    @Default([]) List<ExpenseModel> expenses,
    ExpenseModel? selectedExpense,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    required Failure failure,
  }) = _FailureExpenses;
}

class ExpensesCubit extends Cubit<ExpensesState> {
  final ExpensesRepository _repository;
  static ExpensesCubit get(context) => BlocProvider.of(context);
  // persistent expenses cache used across states
  final List<ExpenseModel> _expenses = <ExpenseModel>[];
  int _currentPage = 1;
  int _totalPages = 1;
  String? _lastSearch;
  String? _lastStatus;
  int? _lastCategoryId;
  String? _lastSortBy;
  String? _lastSortOrder;
  int _pageSize = 20;
  bool _isLoadingPage = false;

  ExpensesCubit(this._repository) : super(const ExpensesState.initial());

  List<ExpenseModel> get expenses => List.unmodifiable(_expenses);
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  bool get hasMore => _currentPage < _totalPages;
  bool get isLoadingPage => _isLoadingPage;

  Future<void> loadFirstPage({
    bool refresh = false,
    String? search,
    String? status,
    int? categoryId,
    String? sortBy,
    String? sortOrder,
    int? limit,
  }) async {
    if (_isLoadingPage) return;
    if (_expenses.isNotEmpty && !refresh) return;
    _isLoadingPage = true;

    _lastSearch = search;
    _lastStatus = status;
    _lastCategoryId = categoryId;
    _lastSortBy = sortBy;
    _lastSortOrder = sortOrder;
    _pageSize = limit ?? _pageSize;

    _expenses.clear();
    _currentPage = 1;
    _totalPages = 1;

    emit(
      ExpensesState.loading(
        expenses: _expenses,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading',
      ),
    );

    final result = await _repository.getExpensesWithPagination(
      search: _lastSearch,
      status: _lastStatus,
      categoryId: _lastCategoryId,
      page: _currentPage,
      limit: _pageSize,
      sortBy: _lastSortBy,
      sortOrder: _lastSortOrder,
    );

    result.when(
      success: (pagination) {
        final pageExpenses = pagination.expenses
            .map(
              (e) => ExpenseModel(
                id: e.id,
                companyId: e.companyId,
                expenseCategoryId: e.expenseCategoryId,
                title: e.title,
                description: e.description,
                amount: double.parse(e.amount),
                expenseDate: e.expenseDate,
                referenceNumber: e.referenceNumber,
                paymentMethod: e.paymentMethod,
                notes: e.notes,
                attachment: e.attachment,
                createdBy: e.createdBy.toString(),
                createdAt: e.createdAt,
                updatedAt: e.updatedAt,
              ),
            )
            .toList();

        _expenses.addAll(pageExpenses);
        _currentPage = pagination.currentPage;
        _totalPages = pagination.totalPages;
        emit(
          ExpensesState.loaded(
            expenses: _expenses,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          ExpensesState.failure(
            expenses: _expenses,
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
      ExpensesState.loading(
        expenses: _expenses,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading_more',
      ),
    );

    final result = await _repository.getExpensesWithPagination(
      search: _lastSearch,
      status: _lastStatus,
      categoryId: _lastCategoryId,
      page: nextPage,
      limit: _pageSize,
      sortBy: _lastSortBy,
      sortOrder: _lastSortOrder,
    );

    result.when(
      success: (pagination) {
        final pageExpenses = pagination.expenses
            .map(
              (e) => ExpenseModel(
                id: e.id,
                companyId: e.companyId,
                expenseCategoryId: e.expenseCategoryId,
                title: e.title,
                description: e.description,
                amount: double.parse(e.amount),
                expenseDate: e.expenseDate,
                referenceNumber: e.referenceNumber,
                paymentMethod: e.paymentMethod,
                notes: e.notes,
                attachment: e.attachment,
                createdBy: e.createdBy.toString(),
                createdAt: e.createdAt,
                updatedAt: e.updatedAt,
              ),
            )
            .toList();

        _currentPage = pagination.currentPage;
        _totalPages = pagination.totalPages;
        _expenses.addAll(pageExpenses);
        emit(
          ExpensesState.loaded(
            expenses: _expenses,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          ExpensesState.failure(
            expenses: _expenses,
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
      categoryId: _lastCategoryId,
      sortBy: _lastSortBy,
      sortOrder: _lastSortOrder,
      limit: _pageSize,
    );
  }

  // Create expense preserves cache
  Future<void> createExpense({
    required int expenseCategoryId,
    required String title,
    String? description,
    required double amount,
    required String expenseDate,
    String? referenceNumber,
    required String paymentMethod,
    String? notes,
    String? attachment,
  }) async {
    emit(
      ExpensesState.loading(
        expenses: _expenses,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'creating',
      ),
    );

    final result = await _repository.createExpense(
      expenseCategoryId: expenseCategoryId,
      title: title,
      description: description,
      amount: amount,
      expenseDate: expenseDate,
      referenceNumber: referenceNumber,
      paymentMethod: paymentMethod,
      notes: notes,
      attachment: attachment,
    );

    result.when(
      success: (expense) {
        _expenses.add(expense);
        emit(
          ExpensesState.createSuccess(
            expenses: _expenses,
            created: expense,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          ExpensesState.failure(
            expenses: _expenses,
            currentPage: _currentPage,
            totalPages: _totalPages,
            failure: failure,
          ),
        );
      },
    );
  }

  Future<void> updateExpense({
    required int id,
    int? expenseCategoryId,
    String? title,
    String? description,
    double? amount,
    String? expenseDate,
    String? referenceNumber,
    String? paymentMethod,
    String? notes,
    String? attachment,
  }) async {
    emit(
      ExpensesState.loading(
        expenses: _expenses,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'updating',
      ),
    );

    final result = await _repository.updateExpense(
      id: id,
      expenseCategoryId: expenseCategoryId,
      title: title,
      description: description,
      amount: amount,
      expenseDate: expenseDate,
      referenceNumber: referenceNumber,
      paymentMethod: paymentMethod,
      notes: notes,
      attachment: attachment,
    );

    result.when(
      success: (updatedExpense) {
        for (var i = 0; i < _expenses.length; i++) {
          final e = _expenses[i];
          if (e.id == id) {
            _expenses[i] = updatedExpense;
            break;
          }
        }
        emit(
          ExpensesState.updateSuccess(
            expenses: _expenses,
            updated: updatedExpense,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          ExpensesState.failure(
            expenses: _expenses,
            currentPage: _currentPage,
            totalPages: _totalPages,
            failure: failure,
          ),
        );
      },
    );
  }

  Future<void> deleteExpense(int id) async {
    emit(
      ExpensesState.loading(
        expenses: _expenses,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'deleting',
      ),
    );

    final result = await _repository.deleteExpense(id);

    result.when(
      success: (_) {
        _expenses.removeWhere((e) => e.id == id);
        emit(
          ExpensesState.deleteSuccess(
            expenses: _expenses,
            deletedId: id,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          ExpensesState.failure(
            expenses: _expenses,
            currentPage: _currentPage,
            totalPages: _totalPages,
            failure: failure,
          ),
        );
      },
    );
  }

  Future<void> getExpenseById(int id) async {
    emit(
      ExpensesState.loading(
        expenses: _expenses,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading_expense',
      ),
    );

    final result = await _repository.getExpenseById(id);

    result.when(
      success: (expense) {
        emit(
          ExpensesState.loaded(
            expenses: _expenses,
            currentPage: _currentPage,
            totalPages: _totalPages,
            selectedExpense: expense,
          ),
        );
      },
      failure: (failure) {
        emit(
          ExpensesState.failure(
            expenses: _expenses,
            currentPage: _currentPage,
            totalPages: _totalPages,
            failure: failure,
          ),
        );
      },
    );
  }

  void clearError() {
    state.maybeWhen(
      orElse: () => emit(
        ExpensesState.loaded(
          expenses: _expenses,
          currentPage: _currentPage,
          totalPages: _totalPages,
        ),
      ),
      failure: (expenses, selectedExpense, currentPage, totalPages, error) =>
          emit(
            ExpensesState.loaded(
              expenses: _expenses,
              currentPage: _currentPage,
              totalPages: _totalPages,
            ),
          ),
    );
  }

  void clearSelectedExpense() {
    emit(
      ExpensesState.loaded(
        expenses: _expenses,
        currentPage: _currentPage,
        totalPages: _totalPages,
        selectedExpense: null,
      ),
    );
  }
}
