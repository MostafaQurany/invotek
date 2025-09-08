import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';

part 'products_cubit.freezed.dart';

@freezed
sealed class ProductsState with _$ProductsState {
  const factory ProductsState.initial({
    @Default([]) List<ProductModel> products,
    ProductModel? selectedProduct,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    String? error,
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
    required String error,
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
  int _pageSize = 20;
  bool _isLoadingPage = false;

  ProductsCubit(this._repository) : super(const ProductsState.initial());

  List<ProductModel> get products => List.unmodifiable(_products);
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
  bool get hasMore => _currentPage < _totalPages;

  Future<void> loadFirstPage({
    bool refresh = false,
    String? search,
    String? category,
    String? status,
    int? limit,
  }) async {
    if (_isLoadingPage) return;
    if (_products.isNotEmpty && !refresh) return;
    _isLoadingPage = true;

    _lastSearch = search;
    _lastCategory = category;
    _lastStatus = status;
    _pageSize = limit ?? _pageSize;

    _products.clear();
    _currentPage = 1;
    _totalPages = 1;

    emit(
      ProductsState.loading(
        products: _products,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading',
      ),
    );

    final result = await _repository.getProducts(
      search: _lastSearch,
      category: _lastCategory,
      status: _lastStatus,
      page: _currentPage,
      limit: _pageSize,
    );

    result.when(
      success: (pageProducts) {
        _products.addAll(pageProducts);
        // If repository can return pagination meta, wire it; otherwise estimate
        // For now, keep totalPages as current when page not full
        if (pageProducts.length < _pageSize) {
          _totalPages = _currentPage; // no more pages
        } else {
          _totalPages = _currentPage + 1; // optimistic next
        }
        emit(
          ProductsState.loaded(
            products: _products,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          ProductsState.failure(
            products: _products,
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
    final nextPage = _currentPage + 1;

    emit(
      ProductsState.loading(
        products: _products,
        currentPage: _currentPage,
        totalPages: _totalPages,
        message: 'loading_next',
      ),
    );

    final result = await _repository.getProducts(
      search: _lastSearch,
      category: _lastCategory,
      status: _lastStatus,
      page: nextPage,
      limit: _pageSize,
    );

    result.when(
      success: (pageProducts) {
        _currentPage = nextPage;
        _products.addAll(pageProducts);
        if (pageProducts.length < _pageSize) {
          _totalPages = _currentPage; // reached last page
        } else {
          _totalPages = _currentPage + 1; // optimistic next
        }
        emit(
          ProductsState.loaded(
            products: _products,
            currentPage: _currentPage,
            totalPages: _totalPages,
          ),
        );
      },
      failure: (error) {
        emit(
          ProductsState.failure(
            products: _products,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
          ),
        );
      },
    );

    _isLoadingPage = false;
  }

  Future<void> refreshCurrentFilters() async {
    await loadFirstPage(
      search: _lastSearch,
      category: _lastCategory,
      status: _lastStatus,
      limit: _pageSize,
    );
  }

  // Create product preserves cache
  Future<void> createProduct({
    required String name,
    String? description,
    required String price,
    String? cost,
    required int quantity,
    String? sku,
    String? barcode,
    String? unit,
    String? taxRate,
    String? notes,
    String? brand,
    String? model,
    String? weight,
    String? dimensions,
    String? color,
    String? material,
    int? minQuantity,
    int? maxQuantity,
    bool isActive = true,
    bool hasTax = false,
    bool trackInventory = false,
    String status = 'active',
    int? categoryId,
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
      description: description,
      price: price,
      cost: cost,
      quantity: quantity,
      sku: sku,
      barcode: barcode,
      unit: unit,
      taxRate: taxRate,
      notes: notes,
      brand: brand,
      model: model,
      weight: weight,
      dimensions: dimensions,
      color: color,
      material: material,
      minQuantity: minQuantity,
      maxQuantity: maxQuantity,
      isActive: isActive,
      hasTax: hasTax,
      trackInventory: trackInventory,
      status: status,
      categoryId: categoryId,
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
      failure: (error) {
        emit(
          ProductsState.failure(
            products: _products,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
          ),
        );
      },
    );
  }

  Future<void> updateProduct({
    required int id,
    required String name,
    String? description,
    required String price,
    String? cost,
    required int quantity,
    String? sku,
    String? barcode,
    String? unit,
    String? taxRate,
    String? notes,
    String? brand,
    String? model,
    String? weight,
    String? dimensions,
    String? color,
    String? material,
    int? minQuantity,
    int? maxQuantity,
    bool isActive = true,
    bool hasTax = false,
    bool trackInventory = false,
    String status = 'active',
    int? categoryId,
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
      description: description,
      price: price,
      cost: cost,
      quantity: quantity,
      sku: sku,
      barcode: barcode,
      unit: unit,
      taxRate: taxRate,
      notes: notes,
      brand: brand,
      model: model,
      weight: weight,
      dimensions: dimensions,
      color: color,
      material: material,
      minQuantity: minQuantity,
      maxQuantity: maxQuantity,
      isActive: isActive,
      hasTax: hasTax,
      trackInventory: trackInventory,
      status: status,
      categoryId: categoryId,
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
      failure: (error) {
        emit(
          ProductsState.failure(
            products: _products,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
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
      failure: (error) {
        emit(
          ProductsState.failure(
            products: _products,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
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
      failure: (error) {
        emit(
          ProductsState.failure(
            products: _products,
            currentPage: _currentPage,
            totalPages: _totalPages,
            error: error,
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
