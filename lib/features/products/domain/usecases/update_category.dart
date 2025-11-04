import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/data/models/product_category_models.dart';

class UpdateCategory
    implements UseCase<ProductCategoryApiModel, UpdateCategoryParams> {
  final ProductsRepository repository;

  UpdateCategory(this.repository);

  @override
  Future<ApiResult<ProductCategoryApiModel>> call(
    UpdateCategoryParams params,
  ) async {
    return await repository.updateProductCategory(
      id: params.id,
      name: params.name,
      status: params.status,
      description: params.description,
    );
  }
}

class UpdateCategoryParams {
  final int id;
  final String name;
  final String? status;
  final String? description;

  const UpdateCategoryParams({
    required this.id,
    required this.name,
    this.status,
    this.description,
  });
}
