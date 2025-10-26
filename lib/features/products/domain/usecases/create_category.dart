import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/data/models/product_category_models.dart';

class CreateCategory
    implements UseCase<ProductCategoryApiModel, CreateCategoryParams> {
  final ProductsRepository repository;

  CreateCategory(this.repository);

  @override
  Future<ApiResult<ProductCategoryApiModel>> call(
    CreateCategoryParams params,
  ) async {
    return await repository.createProductCategory(
      name: params.name,
      status: params.status,
    );
  }
}

class CreateCategoryParams {
  final String name;
  final String? status;

  const CreateCategoryParams({required this.name, this.status});
}
