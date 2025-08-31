import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository _repository;

  ProductsCubit(this._repository) : super(const ProductsState());

  // Load products
  Future<void> loadProducts({
    String? search,
    String? category,
    String? status,
    String? brand,
    double? minPrice,
    double? maxPrice,
    int? minQuantity,
    int? maxQuantity,
    int? page,
    int? limit,
    String? sortBy,
    String? sortOrder,
  }) async {
    if (isClosed) return;

    emit(state.copyWith(isLoading: true, error: null));

    final result = await _repository.getProducts(
      search: search,
      category: category,
      status: status,
      brand: brand,
      minPrice: minPrice,
      maxPrice: maxPrice,
      minQuantity: minQuantity,
      maxQuantity: maxQuantity,
      page: page,
      limit: limit,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );

    if (isClosed) return;

    result.when(
      success: (products) {
        emit(state.copyWith(isLoading: false, products: products, error: null));
      },
      failure: (error) {
        emit(state.copyWith(isLoading: false, error: error));
      },
    );
  }

  // Create product
  Future<void> createProduct({
    required String name,
    String? description,
    required double price,
    double? costPrice,
    required int quantity,
    String? sku,
    String? barcode,
    required String category,
    required String status,
    String? unit,
    double? taxRate,
    String? notes,
    String? brand,
    String? model,
    double? weight,
    String? dimensions,
    String? color,
    String? material,
    int? minQuantity,
    int? maxQuantity,
    required bool isActive,
  }) async {
    if (isClosed) return;

    emit(state.copyWith(isLoading: true, error: null));

    final result = await _repository.createProduct(
      name: name,
      description: description,
      price: price,
      costPrice: costPrice,
      quantity: quantity,
      sku: sku,
      barcode: barcode,
      category: category,
      status: status,
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
    );

    if (isClosed) return;

    result.when(
      success: (product) {
        final updatedProducts = List<Product>.from(state.products)
          ..add(product);
        emit(
          state.copyWith(
            isLoading: false,
            products: updatedProducts,
            error: null,
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(isLoading: false, error: error));
      },
    );
  }

  // Update product
  Future<void> updateProduct({
    required int id,
    required String name,
    String? description,
    required double price,
    double? costPrice,
    required int quantity,
    String? sku,
    String? barcode,
    required String category,
    required String status,
    String? unit,
    double? taxRate,
    String? notes,
    String? brand,
    String? model,
    double? weight,
    String? dimensions,
    String? color,
    String? material,
    int? minQuantity,
    int? maxQuantity,
    required bool isActive,
  }) async {
    if (isClosed) return;

    emit(state.copyWith(isLoading: true, error: null));

    final result = await _repository.updateProduct(
      id: id,
      name: name,
      description: description,
      price: price,
      costPrice: costPrice,
      quantity: quantity,
      sku: sku,
      barcode: barcode,
      category: category,
      status: status,
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
    );

    if (isClosed) return;

    result.when(
      success: (updatedProduct) {
        final updatedProducts = state.products.map((product) {
          return product.id == id ? updatedProduct : product;
        }).toList();
        emit(
          state.copyWith(
            isLoading: false,
            products: updatedProducts,
            error: null,
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(isLoading: false, error: error));
      },
    );
  }

  // Delete product
  Future<void> deleteProduct(int id) async {
    if (isClosed) return;

    emit(state.copyWith(isLoading: true, error: null));

    final result = await _repository.deleteProduct(id);

    if (isClosed) return;

    result.when(
      success: (_) {
        final updatedProducts = state.products
            .where((product) => product.id != id)
            .toList();
        emit(
          state.copyWith(
            isLoading: false,
            products: updatedProducts,
            error: null,
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(isLoading: false, error: error));
      },
    );
  }

  // Load product statistics
  Future<void> loadProductStatistics() async {
    if (isClosed) return;

    emit(state.copyWith(isLoading: true, error: null));

    final result = await _repository.getProductStatistics();

    if (isClosed) return;

    result.when(
      success: (statistics) {
        emit(
          state.copyWith(isLoading: false, statistics: statistics, error: null),
        );
      },
      failure: (error) {
        emit(state.copyWith(isLoading: false, error: error));
      },
    );
  }

  // Bulk delete products
  Future<void> bulkDeleteProducts(List<int> productIds) async {
    if (isClosed) return;

    emit(state.copyWith(isLoading: true, error: null));

    final result = await _repository.bulkDeleteProducts(productIds);

    if (isClosed) return;

    result.when(
      success: (_) {
        final updatedProducts = state.products
            .where((product) => !productIds.contains(product.id))
            .toList();
        emit(
          state.copyWith(
            isLoading: false,
            products: updatedProducts,
            error: null,
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(isLoading: false, error: error));
      },
    );
  }

  // Bulk update product status
  Future<void> bulkUpdateStatus({
    required List<int> productIds,
    required String status,
  }) async {
    if (isClosed) return;

    emit(state.copyWith(isLoading: true, error: null));

    final result = await _repository.bulkUpdateStatus(
      productIds: productIds,
      status: status,
    );

    if (isClosed) return;

    result.when(
      success: (_) {
        final updatedProducts = state.products.map((product) {
          if (productIds.contains(product.id)) {
            return product.copyWith(status: status);
          }
          return product;
        }).toList();
        emit(
          state.copyWith(
            isLoading: false,
            products: updatedProducts,
            error: null,
          ),
        );
      },
      failure: (error) {
        emit(state.copyWith(isLoading: false, error: error));
      },
    );
  }

  // Clear error
  void clearError() {
    if (isClosed) return;
    emit(state.copyWith(error: null));
  }

  // Get product by ID
  Future<void> getProductById(int id) async {
    if (isClosed) return;

    emit(state.copyWith(isLoading: true, error: null));

    final result = await _repository.getProductById(id);

    if (isClosed) return;

    result.when(
      success: (product) {
        // For now, we'll just update the products list with the single product
        // In a real app, you might want to have a separate selectedProduct state
        emit(state.copyWith(isLoading: false, error: null));
      },
      failure: (error) {
        emit(state.copyWith(isLoading: false, error: error));
      },
    );
  }

  // Get products by category
  List<Product> getProductsByCategory(String category) {
    return state.products
        .where((product) => product.category == category)
        .toList();
  }

  // Get products by status
  List<Product> getProductsByStatus(String status) {
    return state.products.where((product) => product.status == status).toList();
  }

  // Get products by brand
  List<Product> getProductsByBrand(String brand) {
    return state.products.where((product) => product.brand == brand).toList();
  }

  // Search products
  List<Product> searchProducts(String query) {
    return state.products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase()) ||
          (product.description?.toLowerCase().contains(query.toLowerCase()) ??
              false) ||
          (product.sku?.toLowerCase().contains(query.toLowerCase()) ?? false) ||
          (product.barcode?.toLowerCase().contains(query.toLowerCase()) ??
              false);
    }).toList();
  }

  // Get low stock products
  List<Product> getLowStockProducts() {
    return state.products.where((product) {
      return product.minQuantity != null &&
          product.quantity <= product.minQuantity!;
    }).toList();
  }

  // Get out of stock products
  List<Product> getOutOfStockProducts() {
    return state.products.where((product) => product.quantity == 0).toList();
  }
}
