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

  final List<ProductCategoryApiModel> _categories = <ProductCategoryApiModel>[];
  int _currentPage = 1;
  int _totalPages = 1;
  final int _pageSize = 50;
  bool _isLoadingPage = false;

  CategoriesCubit(this._repository) : super(const CategoriesState.initial());

  List<ProductCategoryApiModel> get categories =>
      List.unmodifiable(_categories);
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  bool get hasMore => _currentPage < _totalPages;

  Future<void> loadFirstPage({bool refresh = false}) async {
    if (_isLoadingPage) return;
    if (_categories.isNotEmpty && !refresh) return;
    _isLoadingPage = true;
    _categories.clear();
    _currentPage = 1;
    _totalPages = 1;

    emit(
      CategoriesState.loading(
        categories: _categories,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading',
      ),
    );

    final ApiResult<List<ProductCategoryApiModel>> result = await _repository
        .listProductCategories();

    result.when(
      success: (list) {
        _categories.addAll(list);
        if (list.length < _pageSize) {
          _totalPages = _currentPage;
        } else {
          _totalPages = _currentPage + 1;
        }
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
            error: err,
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
        message: 'loading_next',
      ),
    );

    // If server supports pagination, wire it here. For now reusing same call.
    final ApiResult<List<ProductCategoryApiModel>> result = await _repository
        .listProductCategories();

    result.when(
      success: (list) {
        _currentPage = nextPage;
        _categories.addAll(list);
        if (list.length < _pageSize) {
          _totalPages = _currentPage;
        } else {
          _totalPages = _currentPage + 1;
        }
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
            error: err,
          ),
        );
      },
    );

    _isLoadingPage = false;
  }

  Future<void> refresh() async {
    await loadFirstPage();
  }

  Future<void> createCategory(String name, {String? status}) async {
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
            error: err,
          ),
        );
      },
    );
  }

  Future<void> updateCategory(int id, String name, {String? status}) async {
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
            error: err,
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
            error: err,
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
