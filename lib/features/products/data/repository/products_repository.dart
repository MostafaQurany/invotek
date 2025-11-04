import 'package:invotek/core/error/failures.dart';
import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/products/data/models/pagination_result.dart';
import 'package:invotek/features/products/data/models/product_api_model.dart';
import 'package:invotek/features/products/data/models/product_category_models.dart';
import 'package:invotek/features/products/data/models/request/product_requests.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';

class ProductsRepository {
  final ApiClient _apiClient;

  ProductsRepository(this._apiClient);

  // Get all products with pagination and filters
  Future<ApiResult<List<ProductModel>>> getProducts({
    String? search,
    String? categoryId,
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
    int? perPage,
  }) async {
    try {
      final response = await _apiClient.getProducts(
        search: search,
        categoryId: categoryId,
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
        perPage: perPage,
      );

      if (response.data != null) {
        final products = response.data!
            .map((apiProduct) => _convertToProductModel(apiProduct))
            .toList();
        return ApiResult.success(products);
      }
      return ApiResult.failure(
        Failure.server(
          message: response.message ?? 'حدث خطأ أثناء تحميل المنتجات',
        ),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Get products with pagination metadata
  Future<ApiResult<ProductsPaginationResult>> getProductsWithPagination({
    String? search,
    String? categoryId,
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
    int? perPage,
  }) async {
    try {
      final response = await _apiClient.getProducts(
        search: search,
        categoryId: categoryId,
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
        perPage: perPage,
      );

      final paginationResult = ProductsPaginationResult.fromResponse(response);
      return ApiResult.success(paginationResult);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Get product by ID
  Future<ApiResult<ProductModel>> getProductById(int id) async {
    try {
      final response = await _apiClient.getProductById(id);

      final product = _convertToProductModel(response);
      return ApiResult.success(product);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Create new product
  Future<ApiResult<ProductModel>> createProduct({
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
    try {
      final request = CreateProductRequest(
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

      final response = await _apiClient.createProduct(request);

      if (response.id != null) {
        // ProductModel uses String for price, cost, taxRate
        final product = ProductModel(
          id: response.id,
          companyId: response.companyId,
          productCategoryId: response.productCategoryId,
          sku: response.sku,
          barcode: response.barcode,
          unit: response.unit,
          taxRate: response.taxRate,
          taxRateBackup: response.taxRate, // Set backup to same value
          cost: response.cost,
          description: response.description,
          hasTax: response.hasTax ?? false,
          image: response.image,
          isActive: response.isActive ?? true,
          trackInventory: response.trackInventory ?? false,
          status: response.status ?? 'active',
          createdAt: response.createdAt,
          updatedAt: response.updatedAt,
          name: response.name,
          price: response.price,
          quantity: response.quantity ?? 0,
          quantityBackup: response.quantity ?? 0, // Set backup to same value
        );
        return ApiResult.success(product);
      }

      return ApiResult.failure(
        Failure.server(message: 'حدث خطأ أثناء إنشاء المنتج'),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Update product
  Future<ApiResult<ProductModel>> updateProduct({
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
    try {
      final request = UpdateProductRequest(
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

      final response = await _apiClient.updateProduct(id, request);

      if (response.data != null) {
        final product = _convertToProductModel(response.data!);
        return ApiResult.success(product);
      }
      return ApiResult.failure(
        Failure.server(message: 'حدث خطأ أثناء تحديث المنتج'),
      );
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
  Future<ApiResult<List<ProductCategoryApiModel>>> listProductCategories({
    String? search,
    String? status,
    String? sortBy,
    String? sortOrder,
    int? page,
    int? limit,
    int? perPage,
  }) async {
    try {
      final response = await _apiClient.listProductCategories(
        search: search,
        status: status,
        sortBy: sortBy,
        sortOrder: sortOrder,
        page: page,
        limit: limit,
        perPage: perPage,
      );
      // Extract pagination info and return data
      return ApiResult.success(response.data ?? []);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Get categories with pagination metadata
  Future<ApiResult<ListProductCategoriesResponse>>
  listProductCategoriesWithPagination({
    String? search,
    String? status,
    String? sortBy,
    String? sortOrder,
    int? page,
    int? limit,
    int? perPage,
  }) async {
    try {
      final response = await _apiClient.listProductCategories(
        search: search,
        status: status,
        sortBy: sortBy,
        sortOrder: sortOrder,
        page: page,
        limit: limit,
        perPage: perPage,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<ProductCategoryApiModel>> createProductCategory({
    required String name,
    String? status,
    String? description,
  }) async {
    try {
      final created = await _apiClient.createProductCategory(
        CreateProductCategoryRequest(
          name: name,
          status: status,
          descreption: description,
        ),
      );
      return ApiResult.success(
        ProductCategoryApiModel(
          id: created.id ?? 0,
          companyId: created.companyId,
          name: created.name,
          status: created.status,
          description: created.description ?? description,
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
    String? description,
  }) async {
    try {
      final updated = await _apiClient.updateProductCategory(
        id,
        UpdateProductCategoryRequest(
          name: name,
          status: status,
          description: description,
        ),
      );
      return ApiResult.success(updated);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<void>> deleteProductCategory(int id) async {
    try {
      await _apiClient.deleteProductCategory(id);
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
