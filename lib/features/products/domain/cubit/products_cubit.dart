import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';

part 'products_cubit.freezed.dart';

@freezed
sealed class ProductsState with _$ProductsState {
  const factory ProductsState.initial({
    @Default([]) List<ProductModel> products,
    ProductModel? selectedProduct,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    Failure? error,
  }) = _Initial;

  const factory ProductsState.loading({
    @Default([]) List<ProductModel> products,
    ProductModel? selectedProduct,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    String? message,
  }) = _LoadingProducts;

  const factory ProductsState.loaded({
    required List<ProductModel> products,
    ProductModel? selectedProduct,
    required int currentPage,
    required int totalPages,
  }) = _LoadedProducts;

  const factory ProductsState.createSuccess({
    required List<ProductModel> products,
    required ProductModel created,
    ProductModel? selectedProduct,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _CreateSuccessProducts;

  const factory ProductsState.updateSuccess({
    required List<ProductModel> products,
    required ProductModel updated,
    ProductModel? selectedProduct,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _UpdateSuccessProducts;

  const factory ProductsState.deleteSuccess({
    required List<ProductModel> products,
    required int deletedId,
    ProductModel? selectedProduct,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _DeleteSuccessProducts;

  const factory ProductsState.failure({
    @Default([]) List<ProductModel> products,
    ProductModel? selectedProduct,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    required Failure failure,
  }) = _FailureProducts;
}

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository _repository;
  static ProductsCubit get(context) => BlocProvider.of(context);
  // persistent products cache used across states
  final List<ProductModel> _products = <ProductModel>[];
  int _currentPage = 1;
  int _totalPages = 1;
  String? _lastSearch;
  String? _lastCategory;
  String? _lastStatus;
  String? _lastSortBy;
  String? _lastSortOrder;
  int _pageSize = 20;
  bool _isLoadingPage = false;

  ProductsCubit(this._repository) : super(const ProductsState.initial());

  List<ProductModel> get products => List.unmodifiable(_products);
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  bool get hasMore => _currentPage < _totalPages;
  bool get isLoadingPage => _isLoadingPage;

  Future<void> loadFirstPage({
    bool refresh = false,
    String? search,
    String? category,
    String? status,
    String? sortBy,
    String? sortOrder,
    int? limit,
  }) async {
    if (_isLoadingPage) return;
    _isLoadingPage = true;

    // Check if search parameters changed
    final searchChanged = _lastSearch != search;
    final categoryChanged = _lastCategory != category;
    final statusChanged = _lastStatus != status;
    final sortByChanged = _lastSortBy != sortBy;
    final sortOrderChanged = _lastSortOrder != sortOrder;
    final shouldRefresh =
        refresh ||
        searchChanged ||
        categoryChanged ||
        statusChanged ||
        sortByChanged ||
        sortOrderChanged;

    if (shouldRefresh) {
      _products.clear();
      _currentPage = 1;
      _totalPages = 1;
    }

    emit(
      ProductsState.loading(
        products: _products,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: shouldRefresh ? 'refreshing' : 'loading',
      ),
    );

    _lastSearch = search;
    _lastCategory = category;
    _lastStatus = status;
    _lastSortBy = sortBy;
    _lastSortOrder = sortOrder;
    _pageSize = limit ?? _pageSize;

    final result = await _repository.getProductsWithPagination(
      search: _lastSearch,
      categoryId: _lastCategory,
      status: _lastStatus,
      sortBy: _lastSortBy,
      sortOrder: _lastSortOrder,
      page: 1,
      limit: _pageSize,
    );

    result.when(
      success: (paginationResult) {
        if (shouldRefresh) {
          _products.clear();
        }
        _products.addAll(
          paginationResult.products
              .map(
                (apiProduct) => ProductModel(
                  id: apiProduct.id,
                  companyId: apiProduct.companyId,
                  productCategoryId: apiProduct.productCategoryId,
                  name: apiProduct.name,
                  sku: apiProduct.sku,
                  description: apiProduct.description,
                  price: apiProduct.price,
                  cost: apiProduct.cost,
                  taxRate: apiProduct.taxRate,
                  taxRateBackup: apiProduct.taxRateBackup,
                  quantity: apiProduct.quantity,
                  quantityBackup: apiProduct.quantityBackup,
                  barcode: apiProduct.barcode,
                  unit: apiProduct.unit,
                  hasTax: apiProduct.hasTax,
                  isActive: apiProduct.isActive,
                  trackInventory: apiProduct.trackInventory,
                  status: apiProduct.status,
                  createdAt: apiProduct.createdAt,
                  updatedAt: apiProduct.updatedAt,
                  image: apiProduct.image,
                ),
              )
              .toList(),
        );
        _currentPage = paginationResult.currentPage;
        _totalPages = paginationResult.totalPages;

        emit(
          ProductsState.loaded(
            products: _products,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          ProductsState.failure(
            products: _products,
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

    // Emit loading state for next page to show loading indicator
    emit(
      ProductsState.loading(
        products: _products,
        selectedProduct: state.selectedProduct,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading_more',
      ),
    );

    final nextPage = _currentPage + 1;
    final result = await _repository.getProductsWithPagination(
      search: _lastSearch,
      categoryId: _lastCategory,
      status: _lastStatus,
      sortBy: _lastSortBy,
      sortOrder: _lastSortOrder,
      page: nextPage,
      limit: _pageSize,
    );

    result.when(
      success: (paginationResult) {
        // Only add new products, don't clear existing ones
        final newProducts = paginationResult.products
            .map(
              (apiProduct) => ProductModel(
                id: apiProduct.id,
                companyId: apiProduct.companyId,
                productCategoryId: apiProduct.productCategoryId,
                name: apiProduct.name,
                sku: apiProduct.sku,
                description: apiProduct.description,
                price: apiProduct.price,
                cost: apiProduct.cost,
                taxRate: apiProduct.taxRate,
                taxRateBackup: apiProduct.taxRateBackup,
                quantity: apiProduct.quantity,
                quantityBackup: apiProduct.quantityBackup,
                barcode: apiProduct.barcode,
                unit: apiProduct.unit,
                hasTax: apiProduct.hasTax,
                isActive: apiProduct.isActive,
                trackInventory: apiProduct.trackInventory,
                status: apiProduct.status,
                createdAt: apiProduct.createdAt,
                updatedAt: apiProduct.updatedAt,
                image: apiProduct.image,
              ),
            )
            .toList();

        _products.addAll(newProducts);
        _currentPage = paginationResult.currentPage;
        _totalPages = paginationResult.totalPages;

        emit(
          ProductsState.loaded(
            products: _products,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          ProductsState.failure(
            products: _products,
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
      refresh: true,
      search: _lastSearch,
      category: _lastCategory,
      status: _lastStatus,
      sortBy: _lastSortBy,
      sortOrder: _lastSortOrder,
      limit: _pageSize,
    );
  }

  // Search products
  Future<void> searchProducts(String query) async {
    await loadFirstPage(search: query.isEmpty ? null : query, refresh: true);
  }

  // Clear search and reload all products
  Future<void> clearSearch() async {
    await loadFirstPage(search: null, refresh: true);
  }

  // Create product preserves cache
  Future<void> createProduct({
    required String name,
    int? productCategoryId,
    String? sku,
    String? description,
    String? image,
    double? price,
    double? cost,
    double? taxRate,
    int? quantity,
    String? barcode,
    String? unit,
    bool? hasTax,
    bool? isActive,
    bool? trackInventory,
    String? status,
  }) async {
    emit(
      ProductsState.loading(
        products: _products,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'creating',
      ),
    );

    final result = await _repository.createProduct(
      name: name,
      productCategoryId: productCategoryId,
      sku: sku,
      description: description,
      image: image,
      price: price,
      cost: cost,
      taxRate: taxRate,
      quantity: quantity,
      barcode: barcode,
      unit: unit,
      hasTax: hasTax,
      isActive: isActive,
      trackInventory: trackInventory,
      status: status,
    );

    result.when(
      success: (product) {
        _products.add(product);
        emit(
          ProductsState.createSuccess(
            products: _products,
            created: product,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          ProductsState.failure(
            products: _products,
            currentPage: _currentPage,
            totalPages: _totalPages,
            failure: failure,
          ),
        );
      },
    );
  }

  Future<void> updateProduct({
    required int id,
    required String name,
    int? productCategoryId,
    String? sku,
    String? description,
    String? image,
    double? price,
    double? cost,
    double? taxRate,
    int? quantity,
    String? barcode,
    String? unit,
    bool? hasTax,
    bool? isActive,
    bool? trackInventory,
    String? status,
  }) async {
    emit(
      ProductsState.loading(
        products: _products,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'updating',
      ),
    );

    final result = await _repository.updateProduct(
      id: id,
      name: name,
      productCategoryId: productCategoryId,
      sku: sku,
      description: description,
      image: image,
      price: price,
      cost: cost,
      taxRate: taxRate,
      quantity: quantity,
      barcode: barcode,
      unit: unit,
      hasTax: hasTax,
      isActive: isActive,
      trackInventory: trackInventory,
      status: status,
    );

    result.when(
      success: (updatedProduct) {
        for (var i = 0; i < _products.length; i++) {
          final p = _products[i];
          if ((p.id ?? 0) == id) {
            _products[i] = updatedProduct;
            break;
          }
        }
        emit(
          ProductsState.updateSuccess(
            products: _products,
            updated: updatedProduct,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          ProductsState.failure(
            products: _products,
            currentPage: _currentPage,
            totalPages: _totalPages,
            failure: failure,
          ),
        );
      },
    );
  }

  Future<void> deleteProduct(int id) async {
    emit(
      ProductsState.loading(
        products: _products,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'deleting',
      ),
    );

    final result = await _repository.deleteProduct(id);

    result.when(
      success: (_) {
        _products.removeWhere((p) => (p.id ?? 0) == id);
        emit(
          ProductsState.deleteSuccess(
            products: _products,
            deletedId: id,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (failure) {
        emit(
          ProductsState.failure(
            products: _products,
            currentPage: _currentPage,
            totalPages: _totalPages,
            failure: failure,
          ),
        );
      },
    );
  }

  Future<void> getProductById(int id) async {
    emit(
      ProductsState.loading(
        products: _products,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading_product',
      ),
    );

    final result = await _repository.getProductById(id);

    result.when(
      success: (product) {
        emit(
          ProductsState.loaded(
            products: _products,
            currentPage: _currentPage,
            totalPages: _totalPages,
            selectedProduct: product,
          ),
        );
      },
      failure: (failure) {
        emit(
          ProductsState.failure(
            products: _products,
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
        ProductsState.loaded(
          products: _products,
          currentPage: _currentPage,
          totalPages: _totalPages,
        ),
      ),
      failure: (products, selectedProduct, currentPage, totalPages, error) =>
          emit(
            ProductsState.loaded(
              products: _products,
              currentPage: _currentPage,
              totalPages: _totalPages,
            ),
          ),
    );
  }

  void clearSelectedProduct() {
    emit(
      ProductsState.loaded(
        products: _products,
        currentPage: _currentPage,
        totalPages: _totalPages,
        selectedProduct: null,
      ),
    );
  }
}
