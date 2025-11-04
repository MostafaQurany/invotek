import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/products/data/models/product_category_models.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';

part 'categories_cubit.freezed.dart';

@freezed
sealed class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial({
    @Default(<ProductCategoryApiModel>[])
    List<ProductCategoryApiModel> categories,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    String? error,
  }) = _InitialCategories;

  const factory CategoriesState.loading({
    @Default(<ProductCategoryApiModel>[])
    List<ProductCategoryApiModel> categories,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    String? message,
  }) = _LoadingCategories;

  const factory CategoriesState.loaded({
    required List<ProductCategoryApiModel> categories,
    required int currentPage,
    required int totalPages,
  }) = _LoadedCategories;

  const factory CategoriesState.createSuccess({
    required List<ProductCategoryApiModel> categories,
    required ProductCategoryApiModel created,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _CreateSuccessCategories;

  const factory CategoriesState.updateSuccess({
    required List<ProductCategoryApiModel> categories,
    required ProductCategoryApiModel updated,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _UpdateSuccessCategories;

  const factory CategoriesState.deleteSuccess({
    required List<ProductCategoryApiModel> categories,
    required int deletedId,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _DeleteSuccessCategories;

  const factory CategoriesState.failure({
    @Default(<ProductCategoryApiModel>[])
    List<ProductCategoryApiModel> categories,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    required String error,
  }) = _FailureCategories;
}

class CategoriesCubit extends Cubit<CategoriesState> {
  final ProductsRepository _repository;
  static CategoriesCubit get(context) => BlocProvider.of(context);
  final List<ProductCategoryApiModel> _categories = <ProductCategoryApiModel>[];
  int _currentPage = 1;
  int _totalPages = 1;
  String? _lastSearch;
  String? _lastStatus;
  String? _lastSortBy;
  String? _lastSortOrder;
  final int _pageSize = 50;
  bool _isLoadingPage = false;

  CategoriesCubit(this._repository) : super(const CategoriesState.initial());

  List<ProductCategoryApiModel> get categories =>
      List.unmodifiable(_categories);
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  bool get hasMore => _currentPage < _totalPages;
  bool get isLoadingPage => _isLoadingPage;

  Future<void> loadFirstPage({
    bool refresh = false,
    String? search,
    String? status,
    String? sortBy,
    String? sortOrder,
  }) async {
    if (_isLoadingPage) return;
    _isLoadingPage = true;

    // Check if search parameters changed
    final searchChanged = _lastSearch != search;
    final statusChanged = _lastStatus != status;
    final sortByChanged = _lastSortBy != sortBy;
    final sortOrderChanged = _lastSortOrder != sortOrder;
    final shouldRefresh =
        refresh ||
        searchChanged ||
        statusChanged ||
        sortByChanged ||
        sortOrderChanged;

    if (shouldRefresh) {
      _categories.clear();
      _currentPage = 1;
      _totalPages = 1;
    }

    emit(
      CategoriesState.loading(
        categories: _categories,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: shouldRefresh ? 'refreshing' : 'loading',
      ),
    );

    _lastSearch = search;
    _lastStatus = status;
    _lastSortBy = sortBy;
    _lastSortOrder = sortOrder;

    final ApiResult<ListProductCategoriesResponse> result =
        await _repository.listProductCategoriesWithPagination(
      search: _lastSearch,
      status: _lastStatus,
      sortBy: _lastSortBy,
      sortOrder: _lastSortOrder,
      page: _currentPage,
      limit: _pageSize,
    );

    result.when(
      success: (response) {
        final list = response.data ?? [];
        if (shouldRefresh) {
          _categories.clear();
        }
        _categories.addAll(list);
        _currentPage = response.currentPage ?? _currentPage;
        _totalPages = response.lastPage ?? 1;
        emit(
          CategoriesState.loaded(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (err) {
        emit(
          CategoriesState.failure(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: err.message,
          ),
        );
      },
    );

    _isLoadingPage = false;
  }

  Future<void> loadNextPage() async {
    if (_isLoadingPage || !hasMore) return;
    _isLoadingPage = true;

    final int nextPage = _currentPage + 1;
    emit(
      CategoriesState.loading(
        categories: _categories,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading_more',
      ),
    );

    final ApiResult<ListProductCategoriesResponse> result =
        await _repository.listProductCategoriesWithPagination(
      search: _lastSearch,
      status: _lastStatus,
      sortBy: _lastSortBy,
      sortOrder: _lastSortOrder,
      page: nextPage,
      limit: _pageSize,
    );

    result.when(
      success: (response) {
        final list = response.data ?? [];
        _currentPage = response.currentPage ?? nextPage;
        _totalPages = response.lastPage ?? 1;
        // Only add new categories, don't clear existing ones
        _categories.addAll(list);
        emit(
          CategoriesState.loaded(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (err) {
        emit(
          CategoriesState.failure(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: err.message,
          ),
        );
      },
    );

    _isLoadingPage = false;
  }

  Future<void> refresh() async {
    await loadFirstPage(
      refresh: true,
      search: _lastSearch,
      status: _lastStatus,
      sortBy: _lastSortBy,
      sortOrder: _lastSortOrder,
    );
  }

  Future<void> createCategory(
    String name, {
    String? status,
    String? description,
  }) async {
    emit(
      CategoriesState.loading(
        categories: _categories,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'creating',
      ),
    );

    final result = await _repository.createProductCategory(
      name: name,
      status: status,
      description: description,
    );

    result.when(
      success: (created) {
        _categories.add(created);
        emit(
          CategoriesState.createSuccess(
            categories: _categories,
            created: created,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (err) {
        emit(
          CategoriesState.failure(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: err.message,
          ),
        );
      },
    );
  }

  Future<void> updateCategory(
    int id,
    String name, {
    String? status,
    String? description,
  }) async {
    emit(
      CategoriesState.loading(
        categories: _categories,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'updating',
      ),
    );

    final result = await _repository.updateProductCategory(
      id: id,
      name: name,
      status: status,
      description: description,
    );

    result.when(
      success: (updated) {
        for (var i = 0; i < _categories.length; i++) {
          if (_categories[i].id == id) {
            _categories[i] = updated;
            break;
          }
        }
        emit(
          CategoriesState.updateSuccess(
            categories: _categories,
            updated: updated,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (err) {
        emit(
          CategoriesState.failure(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: err.message,
          ),
        );
      },
    );
  }

  Future<void> deleteCategory(int id) async {
    emit(
      CategoriesState.loading(
        categories: _categories,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'deleting',
      ),
    );

    final result = await _repository.deleteProductCategory(id);

    result.when(
      success: (_) {
        _categories.removeWhere((c) => c.id == id);
        emit(
          CategoriesState.deleteSuccess(
            categories: _categories,
            deletedId: id,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (err) {
        emit(
          CategoriesState.failure(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: err.message,
          ),
        );
      },
    );
  }

  void clearError() {
    state.maybeWhen(
      failure: (categories, currentPage, totalPages, error) {
        emit(
          CategoriesState.loaded(
            categories: _categories,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      orElse: () {},
    );
  }
}
