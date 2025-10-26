import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/users_and_permissions/data/repository/users_repository.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';

class GetUsers implements UseCase<List<User>, GetUsersParams> {
  final UsersRepository repository;

  GetUsers(this.repository);

  @override
  Future<ApiResult<List<User>>> call(GetUsersParams params) async {
    return await repository.getUsers(
      search: params.search,
      role: params.role,
      status: params.status,
      page: params.page,
      limit: params.limit,
      sortBy: params.sortBy,
      sortOrder: params.sortOrder,
    );
  }
}

class GetUsersParams {
  final String? search;
  final String? role;
  final String? status;
  final int? page;
  final int? limit;
  final String? sortBy;
  final String? sortOrder;

  const GetUsersParams({
    this.search,
    this.role,
    this.status,
    this.page,
    this.limit,
    this.sortBy,
    this.sortOrder,
  });
}
