import 'dart:io';

import 'package:dio/dio.dart';
// Removed unused: ApiResult
import 'package:invotek/core/utils/app_api_constants.dart';
import 'package:invotek/features/auth/data/models/login_request.dart';
import 'package:invotek/features/auth/data/models/login_respond.dart';
import 'package:invotek/features/auth/data/models/register_request.dart';
import 'package:invotek/features/auth/data/models/register_respond.dart';
import 'package:invotek/features/clients/data/models/client_api_model.dart';
import 'package:invotek/features/products/data/models/product_category_models.dart';
import 'package:invotek/features/products/data/models/request/product_requests.dart';
import 'package:invotek/features/products/data/models/response/product/product_responses.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baserUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(ApiConstants.login)
  Future<LoginRespond> login(@Body() LoginRequest request);

  @POST(ApiConstants.register)
  Future<RegisterRespond> register(@Body() RegisterRequest request);

  @POST(ApiConstants.logOut)
  Future<void> logout();

  // Products
  @GET(ApiConstants.products)
  Future<GetAllProductsResponse> getProducts({
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

  @GET(ApiConstants.productById)
  Future<GetProductByIdResponse> getProductById(@Path('id') int id);

  @POST(ApiConstants.createProduct)
  Future<CreateProductResponse> createProduct(
    @Body() CreateProductRequest request,
  );

  @PUT(ApiConstants.updateProduct)
  Future<UpdateProductResponse> updateProduct(
    @Path('id') int id,
    @Body() UpdateProductRequest request,
  );

  @DELETE(ApiConstants.deleteProduct)
  Future<DeleteProductResponse> deleteProduct(@Path('id') int id);

  // Clients
  @GET(ApiConstants.clients)
  Future<ClientsResponse> getClients({
    @Query('search') String? search,
    @Query('status') String? status,
    @Query('company') String? company,
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('sortBy') String? sortBy,
    @Query('sortOrder') String? sortOrder,
  });

  @GET(ApiConstants.clientById)
  Future<ClientResponse> getClientById(@Path('id') int id);

  @POST(ApiConstants.createClient)
  Future<ClientResponse> createClient(@Body() CreateClientRequest request);

  @PUT(ApiConstants.updateClient)
  Future<ClientResponse> updateClient(
    @Path('id') int id,
    @Body() UpdateClientRequest request,
  );

  @DELETE(ApiConstants.deleteClient)
  Future<void> deleteClient(@Path('id') int id);

  @POST(ApiConstants.clientAvatar)
  @MultiPart()
  Future<ClientResponse> uploadAvatar(@Path('id') int id, @Part() File avatar);

  @GET(ApiConstants.clientsStatistics)
  Future<dynamic> getClientStatistics();

  @POST(ApiConstants.clientsBulkDelete)
  Future<void> bulkDeleteClients(@Body() List<int> clientIds);

  @POST(ApiConstants.clientsBulkUpdateStatus)
  Future<void> bulkUpdateStatus(@Body() Map<String, dynamic> request);

  // Product Categories
  @GET(ApiConstants.productCategories)
  Future<ListProductCategoriesResponse> listProductCategories({
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @POST(ApiConstants.productCategories)
  Future<CreateProductCategoryResponse> createProductCategory(
    @Body() CreateProductCategoryRequest request,
  );

  @GET(ApiConstants.productCategoryById)
  Future<ProductCategoryApiModel> getProductCategory(@Path('id') int id);

  @PUT(ApiConstants.productCategoryById)
  Future<ProductCategoryApiModel> updateProductCategory(
    @Path('id') int id,
    @Body() UpdateProductCategoryRequest request,
  );

  @DELETE(ApiConstants.productCategoryById)
  Future<DeleteProductCategoryResponse> deleteProductCategory(
    @Path('id') int id,
  );
}
