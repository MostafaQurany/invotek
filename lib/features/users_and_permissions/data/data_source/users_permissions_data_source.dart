import 'package:dio/dio.dart';
import 'package:invotek/core/utils/app_api_constants.dart';
import 'package:invotek/features/users_and_permissions/data/models/requests/user_requests.dart';
import 'package:invotek/features/users_and_permissions/data/models/responses/create_user_response.dart';
import 'package:invotek/features/users_and_permissions/data/models/responses/user_responses.dart';
import 'package:retrofit/retrofit.dart';

part 'users_permissions_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baserUrl)
abstract class UsersPermissionsDataSource {
  factory UsersPermissionsDataSource(Dio dio, {String baseUrl}) =
      _UsersPermissionsDataSource;

  // Get all users with pagination and filters
  @GET('/company/users')
  Future<UsersResponse> getUsers({
    @Query('search') String? search,
    @Query('role') String? role,
    @Query('status') String? status,
    @Query('page') int? page,
    @Query('per_page') int? perPage,
    @Query('sort_by') String? sortBy,
    @Query('sort_order') String? sortOrder,
  });

  // Get user by ID
  @GET('company/users/{id}')
  Future<UserResponse> getUserById(@Path('id') int id);

  // Create new user
  @POST('/company/users')
  Future<CreateUserResponse> createUser(@Body() CreateUserRequest request);

  // Update user
  @PUT('/company/users/{id}')
  Future<UserResponse> updateUser(
    @Path('id') int id,
    @Body() UpdateUserRequest request,
  );

  // Delete user
  @DELETE('/company/users/{id}')
  Future<void> deleteUser(@Path('id') int id);

  // // Change user password
  // @POST('/company/users/:id/change-password')
  // Future<void> changePassword(
  //   @Path('id') int id,
  //   @Body() ChangePasswordRequest request,
  // );

  // // Upload user avatar
  // @POST('/users/{id}/avatar')
  // @MultiPart()
  // Future<UserResponse> uploadAvatar(@Path('id') int id, @Part() File avatar);

  // // Get user statistics
  // @GET('/users/statistics')
  // Future<UserStatisticsResponse> getUserStatistics();

  // // Bulk operations
  // @POST('/users/bulk-delete')
  // Future<void> bulkDeleteUsers(@Body() List<int> userIds);

  // @POST('/users/bulk-update-status')
  // Future<void> bulkUpdateStatus(@Body() Map<String, dynamic> request);
}
