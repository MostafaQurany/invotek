import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/customers/data/repository/customers_repository.dart';
import 'package:invotek/features/customers/data/models/pagination_result.dart';

class GetCustomers implements UseCase<PaginationResult, GetCustomersParams> {
  final CustomersRepository repository;

  GetCustomers(this.repository);

  @override
  Future<ApiResult<PaginationResult>> call(GetCustomersParams params) async {
    return await repository.getCustomersWithPagination(
      search: params.search,
      status: params.status,
      company: params.company,
      page: params.page,
      limit: params.limit,
      sortBy: params.sortBy,
      sortOrder: params.sortOrder,
    );
  }
}

class GetCustomersParams {
  final String? search;
  final String? status;
  final String? company;
  final int? page;
  final int? limit;
  final String? sortBy;
  final String? sortOrder;

  const GetCustomersParams({
    this.search,
    this.status,
    this.company,
    this.page,
    this.limit,
    this.sortBy,
    this.sortOrder,
  });
}
