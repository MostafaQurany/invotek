import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';

class DeleteProduct implements UseCase<bool, int> {
  final ProductsRepository repository;

  DeleteProduct(this.repository);

  @override
  Future<ApiResult<bool>> call(int id) async {
    return await repository.deleteProduct(id);
  }
}
