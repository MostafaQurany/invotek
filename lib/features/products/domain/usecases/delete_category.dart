import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/products/data/repository/products_repository.dart';

class DeleteCategory implements UseCase<void, int> {
  final ProductsRepository repository;

  DeleteCategory(this.repository);

  @override
  Future<ApiResult<void>> call(int id) async {
    return await repository.deleteProductCategory(id);
  }
}
