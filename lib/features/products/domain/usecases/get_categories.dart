import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/data/models/product_category_models.dart';

class GetCategories
    implements UseCase<List<ProductCategoryApiModel>, NoParams> {
  final ProductsRepository repository;

  GetCategories(this.repository);

  @override
  Future<ApiResult<List<ProductCategoryApiModel>>> call(NoParams params) async {
    return await repository.listProductCategories();
  }
}
