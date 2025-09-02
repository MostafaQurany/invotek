import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/products/data/models/product_api_model.dart';
import 'package:invotek/features/products/data/models/request/product_requests.dart';
import 'package:invotek/features/products/data/models/product_category_models.dart';

class ProductsRepository {
  final ApiClient _apiClient;

  ProductsRepository(this._apiClient);

  // Get all products with pagination and filters
  Future<ApiResult<List<ProductModel>>> getProducts({
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
      final response = await _apiClient.getProducts(
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

      if (response.data != null) {
        final products = response.data!
            .map((apiProduct) => _convertToProductModel(apiProduct))
            .toList();
        return ApiResult.success(products);
      }
      return ApiResult.failure(
        response.message ?? 'حدث خطأ أثناء تحميل المنتجات',
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Get product by ID
  Future<ApiResult<ProductModel>> getProductById(int id) async {
    try {
      final response = await _apiClient.getProductById(id);

      if (response.data != null) {
        final product = _convertToProductModel(response.data!);
        return ApiResult.success(product);
      }
      return ApiResult.failure('حدث خطأ أثناء تحميل بيانات المنتج');
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Create new product
  Future<ApiResult<ProductModel>> createProduct({
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
    try {
      final request = CreateProductRequest(
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

      final response = await _apiClient.createProduct(request);

      if (response.id != null) {
        final product = ProductModel(
          id: response.id,
          companyId: response.companyId,
          name: response.name,
          price: response.price,
          quantity: response.quantity,
          createdAt: response.createdAt,
          updatedAt: response.updatedAt,
        );
        return ApiResult.success(product);
      }

      return ApiResult.failure('حدث خطأ أثناء إنشاء المنتج');
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Update product
  Future<ApiResult<ProductModel>> updateProduct({
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
    try {
      final request = UpdateProductRequest(
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

      final response = await _apiClient.updateProduct(id, request);

      if (response.data != null) {
        final product = _convertToProductModel(response.data!);
        return ApiResult.success(product);
      }
      return ApiResult.failure('حدث خطأ أثناء تحديث المنتج');
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Delete product
  Future<ApiResult<bool>> deleteProduct(int id) async {
    try {
      await _apiClient.deleteProduct(id);
      return ApiResult.success(true);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Categories
  Future<ApiResult<List<ProductCategoryApiModel>>>
  listProductCategories() async {
    try {
      final response = await _apiClient.listProductCategories();
      return ApiResult.success(response.data ?? []);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<ProductCategoryApiModel>> createProductCategory({
    required String name,
    String? status,
  }) async {
    try {
      final created = await _apiClient.createProductCategory(
        CreateProductCategoryRequest(name: name, status: status),
      );
      return ApiResult.success(
        ProductCategoryApiModel(
          id: created.id ?? 0,
          companyId: created.companyId,
          name: created.name,
          status: created.status,
          createdAt: created.createdAt,
          updatedAt: created.updatedAt,
        ),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<ProductCategoryApiModel>> updateProductCategory({
    required int id,
    required String name,
    String? status,
  }) async {
    try {
      final updated = await _apiClient.updateProductCategory(
        id,
        UpdateProductCategoryRequest(name: name, status: status),
      );
      return ApiResult.success(updated);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<void>> deleteProductCategory(int id) async {
    try {
      final resp = await _apiClient.deleteProductCategory(id);
      return const ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Convert API model to ProductModel
  ProductModel _convertToProductModel(ProductApiModel apiProduct) {
    return ProductModel(
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
    );
  }
}
