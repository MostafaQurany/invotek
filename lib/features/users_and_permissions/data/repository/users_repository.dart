import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/auth/demo/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/data/data_source/users_permissions_data_source.dart';
import 'package:invotek/features/users_and_permissions/data/models/company_api_model.dart';
import 'package:invotek/features/users_and_permissions/data/models/requests/user_requests.dart';
import 'package:invotek/features/users_and_permissions/data/models/user_api_model.dart';
import 'package:invotek/generated/l10n.dart';

class UsersRepository {
  final UsersPermissionsDataSource _dataSource;

  // Pagination metadata
  int _currentPage = 1;
  int _lastPage = 1;
  int _total = 0;
  int _perPage = 20;

  UsersRepository(this._dataSource);

  // Getters for pagination metadata
  int get currentPage => _currentPage;
  int get lastPage => _lastPage;
  int get total => _total;
  int get perPage => _perPage;
  bool get hasMorePages => _currentPage < _lastPage;

  // Get all users with pagination and filters
  Future<ApiResult<List<User>>> getUsers({
    String? search,
    String? role,
    String? status,
    int? page,
    int? limit,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final response = await _dataSource.getUsers(
        search: search,
        role: role,
        status: status,
        page: page ?? 1,
        limit: limit ?? 20,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );

      // Handle Laravel pagination response
      if (response.data != null) {
        final users = response.data!
            .map((apiUser) => _convertToUser(apiUser))
            .toList();

        // Store pagination metadata for future use
        _currentPage = response.currentPage ?? 1;
        _lastPage = response.lastPage ?? 1;
        _total = response.total ?? 0;
        _perPage = response.perPage ?? 20;

        return ApiResult.success(users);
      } else {
        return ApiResult.failure(S.current.noDataReceived);
      }
    } catch (e) {
      return ApiResult.failure(S.current.errorLoadingUsers);
    }
  }

  // Get user by ID
  Future<ApiResult<User>> getUserById(int id) async {
    try {
      final response = await _dataSource.getUserById(id);

      if (response.data != null) {
        final user = _convertToUser(response.data!);
        return ApiResult.success(user);
      } else {
        return ApiResult.failure(response.message ?? S.current.userNotFound);
      }
    } catch (e) {
      return ApiResult.failure(S.current.errorLoadingUsers);
    }
  }

  // Create new user
  Future<ApiResult<void>> createUser({
    required String name,
    required String email,
    required String password,
    String? phone,
    required String role,
    required String status,
    String? address,
    String? notes,
  }) async {
    try {
      final request = CreateUserRequest(
        name: name,
        email: email,
        password: password,
        phone: phone,
        role: role,
        status: status,
        address: address,
        notes: notes,
      );

      final response = await _dataSource.createUser(request);

      // Check if we have data (successful creation) or error message
      try {
        return ApiResult.success(null);
      } catch (parseError) {
        print('Error parsing user data: $parseError');
        print('Response data: $response');
        return ApiResult.failure(S.current.errorParsingUserData);
      }
        } catch (e) {
      print('Error in createUser: $e');
      return ApiResult.failure(S.current.errorCreatingUser);
    }
  }

  // Update user
  Future<ApiResult<User>> updateUser({
    required int id,
    required String name,
    required String email,
    String? phone,
    required String role,
    required String status,
    String? address,
    String? notes,
  }) async {
    try {
      final request = UpdateUserRequest(
        name: name,
        email: email,
        phone: phone,
        role: role,
        status: status,
        address: address,
        notes: notes,
      );

      final response = await _dataSource.updateUser(id, request);

      if (response.data != null) {
        final user = _convertToUser(response.data!);
        return ApiResult.success(user);
      } else {
        return ApiResult.failure(
          response.message ?? S.current.failedToUpdateUser,
        );
      }
    } catch (e) {
      return ApiResult.failure(S.current.errorLoadingUsers);
    }
  }

  // Delete user
  Future<ApiResult<void>> deleteUser(int id) async {
    try {
      await _dataSource.deleteUser(id);
      return const ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(S.current.errorDeletingUser);
    }
  }

  // // Change user password
  // Future<ApiResult<void>> changePassword({
  //   required int id,
  //   required String currentPassword,
  //   required String newPassword,
  //   required String confirmPassword,
  // }) async {
  //   try {
  //     final request = ChangePasswordRequest(
  //       currentPassword: currentPassword,
  //       newPassword: newPassword,
  //       confirmPassword: confirmPassword,
  //     );

  //     await _dataSource.changePassword(id, request);
  //     return const ApiResult.success(null);
  //   } catch (e) {
  //     return ApiResult.failure('حدث خطأ أثناء تغيير كلمة المرور: $e');
  //   }
  // }

  // // Get user statistics
  // Future<ApiResult<UserStatisticsResponse>> getUserStatistics() async {
  //   try {
  //     final statistics = await _dataSource.getUserStatistics();
  //     return ApiResult.success(statistics);
  //   } catch (e) {
  //     return ApiResult.failure('حدث خطأ أثناء تحميل إحصائيات المستخدمين: $e');
  //   }
  // }

  // // Bulk delete users
  // Future<ApiResult<void>> bulkDeleteUsers(List<int> userIds) async {
  //   try {
  //     await _dataSource.bulkDeleteUsers(userIds);
  //     return const ApiResult.success(null);
  //   } catch (e) {
  //     return ApiResult.failure('حدث خطأ أثناء حذف المستخدمين: $e');
  //   }
  // }

  // // Bulk update user status
  // Future<ApiResult<void>> bulkUpdateStatus({
  //   required List<int> userIds,
  //   required String status,
  // }) async {
  //   try {
  //     final request = {'userIds': userIds, 'status': status};

  //     await _dataSource.bulkUpdateStatus(request);
  //     return const ApiResult.success(null);
  //   } catch (e) {
  //     return ApiResult.failure('حدث خطأ أثناء تحديث حالة المستخدمين: $e');
  //   }
  // }

  // Convert API model to domain model
  User _convertToUser(UserApiModel apiUser) {
    try {
      return User(
        id: apiUser.id,
        name: apiUser.name,
        email: apiUser.email,
        phone: apiUser.phone,
        role: apiUser.role,
        status: apiUser.status,
        createdAt: apiUser.createdAt.toIso8601String(),
        updatedAt: apiUser.updatedAt.toIso8601String(),
        company: apiUser.company != null
            ? _convertToCompany(apiUser.company!)
            : null,
      );
    } catch (e) {
      print('Error converting UserApiModel to User: $e');
      print('UserApiModel data: $apiUser');
      rethrow;
    }
  }

  // Convert API model to domain Company model
  Company _convertToCompany(CompanyApiModel apiCompany) {
    try {
      return Company(
        id: apiCompany.id,
        name: apiCompany.name,
        email: apiCompany.email,
        phone: apiCompany.phone,
        address: apiCompany.address,
        taxMerchantCode: apiCompany.taxMerchantCode,
        taxInvoiceType: apiCompany.taxInvoiceType,
        taxIntegrationActive: apiCompany.taxIntegrationActive,
        logo: apiCompany.logo,
        status: apiCompany.status,
        adminId: apiCompany.adminId,
        createdAt: apiCompany.createdAt.toIso8601String(),
        updatedAt: apiCompany.updatedAt.toIso8601String(),
        admin: null, // We'll handle this separately if needed
      );
    } catch (e) {
      print('Error converting CompanyApiModel to Company: $e');
      print('CompanyApiModel data: $apiCompany');
      rethrow;
    }
  }
}
