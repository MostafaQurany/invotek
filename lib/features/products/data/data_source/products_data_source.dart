import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:invotek/features/products/data/models/product_api_model.dart';

part 'products_data_source.g.dart';

@RestApi(baseUrl: "https://demo.invotik.com/api/")
abstract class ProductsDataSource {
  factory ProductsDataSource(Dio dio, {String baseUrl}) = _ProductsDataSource;

  // Get all products with pagination and filters
  @GET('/products')
  Future<ProductsResponse> getProducts({
    @Query('search') String? search,
    @Query('category') String? category,
    @Query('status') String? status,
    @Query('brand') String? brand,
    @Query('min_price') double? minPrice,
    @Query('max_price') double? maxPrice,
    @Query('min_quantity') int? minQuantity,
    @Query('max_quantity') int? maxQuantity,
    @Query('sort_by') String? sortBy,
    @Query('sort_order') String? sortOrder,
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  // Get product by ID
  @GET('/products/{id}')
  Future<ProductResponse> getProductById(@Path('id') int id);

  // Create new product
  @POST('/products')
  Future<ProductResponse> createProduct(@Body() CreateProductRequest request);

  // Update product
  @PUT('/products/{id}')
  Future<ProductResponse> updateProduct(
    @Path('id') int id,
    @Body() UpdateProductRequest request,
  );

  // Delete product
  @DELETE('/products/{id}')
  Future<ProductResponse> deleteProduct(@Path('id') int id);

  // Upload product image
  @POST('/products/{id}/image')
  @MultiPart()
  Future<ProductResponse> uploadImage(@Path('id') int id, @Part() File image);

  // Get product statistics
  @GET('/products/statistics')
  Future<Map<String, dynamic>> getProductStatistics();

  // Bulk delete products
  @POST('/products/bulk-delete')
  Future<ProductResponse> bulkDeleteProducts(@Body() List<int> productIds);

  // Bulk update product status
  @POST('/products/bulk-update-status')
  Future<ProductResponse> bulkUpdateStatus(
    @Body() Map<String, dynamic> request,
  );
}
