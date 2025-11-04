import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';

class GetProducts implements UseCase<List<ProductModel>, GetProductsParams> {
  final ProductsRepository repository;

  GetProducts(this.repository);

  @override
  Future<ApiResult<List<ProductModel>>> call(GetProductsParams params) async {
    return await repository.getProducts(
      search: params.search,
      categoryId: params.categoryId,
      status: params.status,
      brand: params.brand,
      minPrice: params.minPrice,
      maxPrice: params.maxPrice,
      minQuantity: params.minQuantity,
      maxQuantity: params.maxQuantity,
      page: params.page,
      limit: params.limit,
      sortBy: params.sortBy,
      sortOrder: params.sortOrder,
      perPage: params.perPage,
    );
  }
}

class GetProductsParams {
  final String? search;
  final String? categoryId;
  final String? status;
  final String? brand;
  final double? minPrice;
  final double? maxPrice;
  final int? minQuantity;
  final int? maxQuantity;
  final int? page;
  final int? limit;
  final String? sortBy;
  final String? sortOrder;
  final int? perPage;

  const GetProductsParams({
    this.search,
    this.categoryId,
    this.status,
    this.brand,
    this.minPrice,
    this.maxPrice,
    this.minQuantity,
    this.maxQuantity,
    this.page,
    this.limit,
    this.sortBy,
    this.sortOrder,
    this.perPage,
  });
}
