import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/products/data/data_source/products_data_source.dart';
import 'package:invotek/features/products/data/models/product_api_model.dart';

class ProductsRepository {
  final ProductsDataSource _dataSource;

  ProductsRepository(this._dataSource);

  // Get all products with pagination and filters
  Future<ApiResult<List<Product>>> getProducts({
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
    try {
      final response = await _dataSource.getProducts(
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

      if (response.success) {
        final products = response.data
            .map((apiProduct) => _convertToProduct(apiProduct))
            .toList();
        return ApiResult.success(products);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      return ApiResult.failure('حدث خطأ أثناء تحميل المنتجات: $e');
    }
  }

  // Get product by ID
  Future<ApiResult<Product>> getProductById(int id) async {
    try {
      final response = await _dataSource.getProductById(id);

      if (response.success) {
        final product = _convertToProduct(response.data);
        return ApiResult.success(product);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      return ApiResult.failure('حدث خطأ أثناء تحميل بيانات المنتج: $e');
    }
  }

  // Create new product
  Future<ApiResult<Product>> createProduct({
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
    try {
      final request = CreateProductRequest(
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

      final response = await _dataSource.createProduct(request);

      if (response.success) {
        final product = _convertToProduct(response.data);
        return ApiResult.success(product);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      return ApiResult.failure('حدث خطأ أثناء إنشاء المنتج: $e');
    }
  }

  // Update product
  Future<ApiResult<Product>> updateProduct({
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
    try {
      final request = UpdateProductRequest(
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

      final response = await _dataSource.updateProduct(id, request);

      if (response.success) {
        final product = _convertToProduct(response.data);
        return ApiResult.success(product);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      return ApiResult.failure('حدث خطأ أثناء تحديث المنتج: $e');
    }
  }

  // Delete product
  Future<ApiResult<void>> deleteProduct(int id) async {
    try {
      final response = await _dataSource.deleteProduct(id);

      if (response.success) {
        return const ApiResult.success(null);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      return ApiResult.failure('حدث خطأ أثناء حذف المنتج: $e');
    }
  }

  // Get product statistics
  Future<ApiResult<Map<String, dynamic>>> getProductStatistics() async {
    try {
      final statistics = await _dataSource.getProductStatistics();
      return ApiResult.success(statistics);
    } catch (e) {
      return ApiResult.failure('حدث خطأ أثناء تحميل إحصائيات المنتجات: $e');
    }
  }

  // Bulk delete products
  Future<ApiResult<void>> bulkDeleteProducts(List<int> productIds) async {
    try {
      final response = await _dataSource.bulkDeleteProducts(productIds);

      if (response.success) {
        return const ApiResult.success(null);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      return ApiResult.failure('حدث خطأ أثناء حذف المنتجات: $e');
    }
  }

  // Bulk update product status
  Future<ApiResult<void>> bulkUpdateStatus({
    required List<int> productIds,
    required String status,
  }) async {
    try {
      final request = {'productIds': productIds, 'status': status};

      final response = await _dataSource.bulkUpdateStatus(request);

      if (response.success) {
        return const ApiResult.success(null);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      return ApiResult.failure('حدث خطأ أثناء تحديث حالة المنتجات: $e');
    }
  }

  // Convert API model to domain model
  Product _convertToProduct(ProductApiModel apiProduct) {
    return Product(
      id: apiProduct.id,
      name: apiProduct.name,
      description: apiProduct.description,
      price: apiProduct.price,
      costPrice: apiProduct.costPrice,
      quantity: apiProduct.quantity,
      sku: apiProduct.sku,
      barcode: apiProduct.barcode,
      category: apiProduct.category,
      status: apiProduct.status,
      image: apiProduct.image,
      unit: apiProduct.unit,
      taxRate: apiProduct.taxRate,
      notes: apiProduct.notes,
      createdAt: apiProduct.createdAt.toIso8601String(),
      updatedAt: apiProduct.updatedAt.toIso8601String(),
      brand: apiProduct.brand,
      model: apiProduct.model,
      weight: apiProduct.weight,
      dimensions: apiProduct.dimensions,
      color: apiProduct.color,
      material: apiProduct.material,
      minQuantity: apiProduct.minQuantity,
      maxQuantity: apiProduct.maxQuantity,
      isActive: apiProduct.isActive,
    );
  }
}
