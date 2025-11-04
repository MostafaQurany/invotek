import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';
import 'package:invotek/features/products/domain/entit/product_model.dart';

class GetProductById implements UseCase<ProductModel, int> {
  final ProductsRepository repository;

  GetProductById(this.repository);

  @override
  Future<ApiResult<ProductModel>> call(int id) async {
    return await repository.getProductById(id);
  }
}
