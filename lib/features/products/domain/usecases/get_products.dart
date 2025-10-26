import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';

class GetProducts implements UseCase<List<ProductModel>, GetProductsParams> {
  final ProductsRepository repository;

  GetProducts(this.repository);

  @override
  Future<ApiResult<List<ProductModel>>> call(GetProductsParams params) async {
    return await repository.getProducts(
      search: params.search,
      category: params.category,
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
    );
  }
}

class GetProductsParams {
  final String? search;
  final String? category;
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

  const GetProductsParams({
    this.search,
    this.category,
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
  });
}
