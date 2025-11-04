import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/expenses/data/repository/expense_categories_repository.dart';
import 'package:invotek/features/expenses/domain/entit/expense_category_model.dart';

part 'expense_categories_cubit.freezed.dart';

@freezed
sealed class ExpenseCategoriesState with _$ExpenseCategoriesState {
  const factory ExpenseCategoriesState.initial({
    @Default([]) List<ExpenseCategoryModel> categories,
    ExpenseCategoryModel? selectedCategory,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    String? error,
  }) = _Initial;

  const factory ExpenseCategoriesState.loading({
    @Default([]) List<ExpenseCategoryModel> categories,
    ExpenseCategoryModel? selectedCategory,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    String? message,
  }) = _LoadingExpenseCategories;

  const factory ExpenseCategoriesState.loaded({
    required List<ExpenseCategoryModel> categories,
    ExpenseCategoryModel? selectedCategory,
    required int currentPage,
    required int totalPages,
  }) = _LoadedExpenseCategories;

  const factory ExpenseCategoriesState.createSuccess({
    required List<ExpenseCategoryModel> categories,
    required ExpenseCategoryModel created,
    ExpenseCategoryModel? selectedCategory,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _CreateSuccessExpenseCategories;

  const factory ExpenseCategoriesState.updateSuccess({
    required List<ExpenseCategoryModel> categories,
    required ExpenseCategoryModel updated,
    ExpenseCategoryModel? selectedCategory,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _UpdateSuccessExpenseCategories;

  const factory ExpenseCategoriesState.deleteSuccess({
    required List<ExpenseCategoryModel> categories,
    required int deletedId,
    ExpenseCategoryModel? selectedCategory,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _DeleteSuccessExpenseCategories;

  const factory ExpenseCategoriesState.failure({
    @Default([]) List<ExpenseCategoryModel> categories,
    ExpenseCategoryModel? selectedCategory,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    required String error,
  }) = _FailureExpenseCategories;
}

class ExpenseCategoriesCubit extends Cubit<ExpenseCategoriesState> {
  final ExpenseCategoriesRepository _repository;
  static ExpenseCategoriesCubit get(context) => BlocProvider.of(context);
  // persistent categories cache used across states
  final List<ExpenseCategoryModel> _categories = <ExpenseCategoryModel>[];
  int _currentPage = 1;
  int _totalPages = 1;
  String? _lastSearch;
  String? _lastStatus;
  int _pageSize = 20;
  bool _isLoadingPage = false;

  ExpenseCategoriesCubit(this._repository)
    : super(const ExpenseCategoriesState.initial());

  List<ExpenseCategoryModel> get categories => List.unmodifiable(_categories);
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  bool get hasMore => _currentPage < _totalPages;

  Future<void> loadFirstPage({
    bool refresh = false,
    String? search,
    String? status,
    int? limit,
  }) async {
    if (_isLoadingPage) return;
    if (_categories.isNotEmpty && !refresh) return;
    _isLoadingPage = true;

    _lastSearch = search;
    _lastStatus = status;
    _pageSize = limit ?? _pageSize;

    _categories.clear();
    _currentPage = 1;
    _totalPages = 1;

    emit(
      ExpenseCategoriesState.loading(
        categories: _categories,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading',
      ),
    );

    final result = await _repository.getExpenseCategories(
      search: _lastSearch,
      status: _lastStatus,
      page: _currentPage,
      limit: _pageSize,
    );

    result.when(
      success: (pageCategories) {
        _categories.addAll(pageCategories);
        // If repository can return pagination meta, wire it; otherwise estimate
        // For now, keep totalPages as current when page not full
        if (pageCategories.length < _pageSize) {
          _totalPages = _currentPage; // no more pages
        } else {
          _totalPages = _currentPage + 1; // optimistic next
        }
        emit(
          ExpenseCategoriesState.loaded(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          ExpenseCategoriesState.failure(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error.message,
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
      ExpenseCategoriesState.loading(
        categories: _categories,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading_next',
      ),
    );

    final result = await _repository.getExpenseCategories(
      search: _lastSearch,
      status: _lastStatus,
      page: nextPage,
      limit: _pageSize,
    );

    result.when(
      success: (pageCategories) {
        _currentPage = nextPage;
        _categories.addAll(pageCategories);
        if (pageCategories.length < _pageSize) {
          _totalPages = _currentPage; // reached last page
        } else {
          _totalPages = _currentPage + 1; // optimistic next
        }
        emit(
          ExpenseCategoriesState.loaded(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          ExpenseCategoriesState.failure(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error.message,
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
      limit: _pageSize,
    );
  }

  // Create category preserves cache
  Future<void> createExpenseCategory({
    required String name,
    String status = 'active',
    String? description,
    String? color,
    String? icon,
  }) async {
    emit(
      ExpenseCategoriesState.loading(
        categories: _categories,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'creating',
      ),
    );

    final result = await _repository.createExpenseCategory(
      name: name,
      status: status,
      description: description,
      color: color,
      icon: icon,
    );

    result.when(
      success: (category) {
        _categories.add(category);
        emit(
          ExpenseCategoriesState.createSuccess(
            categories: _categories,
            created: category,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          ExpenseCategoriesState.failure(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error.message,
          ),
        );
      },
    );
  }

  Future<void> updateExpenseCategory({
    required int id,
    String? name,
    String? status,
    String? description,
    String? color,
    String? icon,
  }) async {
    emit(
      ExpenseCategoriesState.loading(
        categories: _categories,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'updating',
      ),
    );

    final result = await _repository.updateExpenseCategory(
      id: id,
      name: name,
      status: status,
      description: description,
      color: color,
      icon: icon,
    );

    result.when(
      success: (updatedCategory) {
        for (var i = 0; i < _categories.length; i++) {
          final c = _categories[i];
          if (c.id == id) {
            _categories[i] = updatedCategory;
            break;
          }
        }
        emit(
          ExpenseCategoriesState.updateSuccess(
            categories: _categories,
            updated: updatedCategory,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          ExpenseCategoriesState.failure(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error.message,
          ),
        );
      },
    );
  }

  Future<void> deleteExpenseCategory(int id) async {
    emit(
      ExpenseCategoriesState.loading(
        categories: _categories,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'deleting',
      ),
    );

    final result = await _repository.deleteExpenseCategory(id);

    result.when(
      success: (_) {
        _categories.removeWhere((c) => c.id == id);
        emit(
          ExpenseCategoriesState.deleteSuccess(
            categories: _categories,
            deletedId: id,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          ExpenseCategoriesState.failure(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error.message,
          ),
        );
      },
    );
  }

  Future<void> getExpenseCategoryById(int id) async {
    emit(
      ExpenseCategoriesState.loading(
        categories: _categories,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading_category',
      ),
    );

    final result = await _repository.getExpenseCategoryById(id);

    result.when(
      success: (category) {
        emit(
          ExpenseCategoriesState.loaded(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
            selectedCategory: category,
          ),
        );
      },
      failure: (error) {
        emit(
          ExpenseCategoriesState.failure(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error.message,
          ),
        );
      },
    );
  }

  void clearError() {
    state.maybeWhen(
      orElse: () => emit(
        ExpenseCategoriesState.loaded(
          categories: _categories,
          currentPage: _currentPage,
          totalPages: _totalPages,
        ),
      ),
      failure: (categories, selectedCategory, currentPage, totalPages, error) =>
          emit(
            ExpenseCategoriesState.loaded(
              categories: _categories,
              currentPage: _currentPage,
              totalPages: _totalPages,
            ),
          ),
    );
  }

  void clearSelectedCategory() {
    emit(
      ExpenseCategoriesState.loaded(
        categories: _categories,
        currentPage: _currentPage,
        totalPages: _totalPages,
        selectedCategory: null,
      ),
    );
  }
}
