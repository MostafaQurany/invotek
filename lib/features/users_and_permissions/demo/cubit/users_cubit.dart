import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/data/repository/users_repository.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_state.dart';
import 'package:invotek/generated/l10n.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepository _repository;
  List<User> _users = [];
  bool _hasInitialData = false;
  bool _hasMorePages = false;

  UsersCubit(this._repository) : super(const UsersInitial());

  // Getters for current data
  List<User> get users => _users;
  bool get hasInitialData => _hasInitialData;
  bool get hasMorePages => _hasMorePages;

  Future<void> loadUsers({
    String? search,
    String? role,
    String? status,
    int? page,
    int? limit,
    String? sortBy,
    String? sortOrder,
    bool isRefresh = false,
  }) async {
    if (isClosed) return;

    // Prevent multiple simultaneous loads
    if (state is UsersListLoading && !isRefresh) return;

    // If this is a refresh or first load, reset the data
    if (isRefresh || !_hasInitialData) {
      emit(const UsersListLoading());
    }

    try {
      final result = await _repository.getUsers(
        search: search,
        role: role,
        status: status,
        page: page,
        limit: limit,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );

      if (isClosed) return;

      result.when(
        success: (users) {
          List<User> updatedUsers;

          // If this is page 1, refresh, or first load, replace the data
          if (page == 1 || isRefresh || !_hasInitialData) {
            updatedUsers = users;
            _hasInitialData = true;
          } else if (page != null && page > 1) {
            // For pagination, append to existing data
            updatedUsers = List<User>.from(_users)..addAll(users);
          } else {
            // Default case: replace data
            updatedUsers = users;
            _hasInitialData = true;
          }

          _users = updatedUsers;
          _hasMorePages = _repository.hasMorePages;
          emit(
            UsersListLoaded(
              users: updatedUsers,
              hasMoreData: _repository.hasMorePages,
              currentPage: _repository.currentPage,
              totalPages: _repository.lastPage,
            ),
          );
        },
        failure: (failure) {
          emit(UsersListError(failure: failure));
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(UsersListError(failure: ApiErrorHandler.handleError(e)));
      }
    }
  }

  // Method to refresh data (will reload from page 1)
  Future<void> refreshUsers({
    String? search,
    String? role,
    String? status,
    String? sortBy,
    String? sortOrder,
  }) async {
    await loadUsers(
      search: search,
      role: role,
      status: status,
      page: 1,
      limit: 20,
      sortBy: sortBy,
      sortOrder: sortOrder,
      isRefresh: true,
    );
  }

  // Method to load more users (pagination)
  Future<void> loadMoreUsers({
    String? search,
    String? role,
    String? status,
    String? sortBy,
    String? sortOrder,
  }) async {
    if (isClosed || !_hasMorePages || state is UsersListLoadingMore) return;

    // Get current page from repository
    final currentPage = _repository.currentPage;
    final nextPage = currentPage + 1;

    emit(UsersListLoadingMore(users: _users));

    await loadUsers(
      search: search,
      role: role,
      status: status,
      page: nextPage,
      limit: 20,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }

  // Method to clear cached data
  void clearCache() {
    _hasInitialData = false;
    _users = [];
    emit(const UsersInitial());
  }

  Future<void> createUser({
    required String name,
    required String email,
    required String password,
    String? phone,
    required String role,
    required String status,
    String? address,
    String? notes,
  }) async {
    if (isClosed) return;

    emit(const UserCreating());

    try {
      final result = await _repository.createUser(
        name: name,
        email: email,
        password: password,
        phone: phone,
        role: role,
        status: status,
        address: address,
        notes: notes,
      );

      if (isClosed) return;

      result.when(
        success: (newUser) {
          emit(UserCreated());
        },
        failure: (failure) {
          // Provide user-friendly error messages
          String userFriendlyMessage = _getUserFriendlyErrorMessage(
            failure.message,
          );
          emit(UserCreationError(failure: failure));
        },
      );
    } catch (e) {
      if (!isClosed) {
        String userFriendlyMessage = _getUserFriendlyErrorMessage(
          'Error creating user: $e',
        );
        emit(UserCreationError(failure: ApiErrorHandler.handleError(e)));
      }
    }
  }

  // Helper method to provide user-friendly error messages
  String _getUserFriendlyErrorMessage(String error) {
    if (error.contains('Error parsing user data') ||
        error.contains(S.current.errorParsingUserData)) {
      return S.current.errorParsingUserData;
    } else if (error.contains('email')) {
      return S.current.emailInvalid;
    } else if (error.contains('password')) {
      return S.current.passwordShort;
    } else if (error.contains('network') || error.contains('connection')) {
      return S.current.networkError;
    } else if (error.contains('timeout')) {
      return S.current.serverError;
    } else {
      return S.current.errorCreatingUser;
    }
  }

  Future<void> updateUser({
    required int id,
    required String name,
    required String email,
    String? phone,
    required String role,
    required String status,
    String? address,
    String? notes,
  }) async {
    if (isClosed) return;

    emit(const UserUpdating());

    try {
      final result = await _repository.updateUser(
        id: id,
        name: name,
        email: email,
        phone: phone,
        role: role,
        status: status,
        address: address,
        notes: notes,
      );

      if (isClosed) return;

      result.when(
        success: (updatedUser) {
          _users = _users.map((user) {
            return user.id == id ? updatedUser : user;
          }).toList();
          emit(UserUpdated(user: updatedUser));
        },
        failure: (failure) {
          if (!isClosed) {
            emit(UserUpdateError(failure: failure));
          }
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(UserUpdateError(failure: ApiErrorHandler.handleError(e)));
      }
    }
  }

  Future<void> deleteUser(int userId) async {
    if (isClosed) return;

    emit(const UserDeleting());

    try {
      final result = await _repository.deleteUser(userId);

      if (isClosed) return;

      result.when(
        success: (_) {
          _users = _users.where((user) => user.id != userId).toList();
          emit(UserDeleted(userId: userId));
        },
        failure: (failure) {
          if (!isClosed) {
            emit(UserDeletionError(failure: failure));
          }
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(UserDeletionError(failure: ApiErrorHandler.handleError(e)));
      }
    }
  }

  // Future<void> changePassword({
  //   required int id,
  //   required String currentPassword,
  //   required String newPassword,
  //   required String confirmPassword,
  // }) async {
  //   if (isClosed) return;

  //   emit(const PasswordChanging());

  //   try {
  //     final result = await _repository.changePassword(
  //       id: id,
  //       currentPassword: currentPassword,
  //       newPassword: newPassword,
  //       confirmPassword: confirmPassword,
  //     );

  //     if (isClosed) return;

  //     result.when(
  //       success: (_) {
  //         emit(const PasswordChanged());
  //       },
  //       failure: (error) {
  //         emit(PasswordChangeError(message: error));
  //       },
  //     );
  //   } catch (e) {
  //     if (!isClosed) {
  //       emit(PasswordChangeError(message: 'Error changing password: $e'));
  //     }
  //   }
  // }

  // Future<void> loadUserStatistics() async {
  //   if (isClosed) return;

  //   emit(const StatisticsLoading());

  //   try {
  //     final result = await _repository.getUserStatistics();

  //     if (isClosed) return;

  //     result.when(
  //       success: (statistics) {
  //         emit(StatisticsLoaded(statistics: statistics));
  //       },
  //       failure: (error) {
  //         emit(StatisticsError(message: error));
  //       },
  //     );
  //   } catch (e) {
  //     if (!isClosed) {
  //       emit(StatisticsError(message: 'Error loading statistics: $e'));
  //     }
  //   }
  // }

  // Future<void> bulkDeleteUsers(List<int> userIds) async {
  //   if (isClosed) return;

  //   emit(const BulkOperationLoading(operation: 'Deleting users'));

  //   try {
  //     final result = await _repository.bulkDeleteUsers(userIds);

  //     if (isClosed) return;

  //     result.when(
  //       success: (_) {
  //         _users = _users.where((user) => !userIds.contains(user.id)).toList();
  //         emit(
  //           BulkOperationCompleted(
  //             operation: 'delete',
  //             affectedCount: userIds.length,
  //           ),
  //         );
  //       },
  //       failure: (error) {
  //         emit(BulkOperationError(message: error, operation: 'delete'));
  //       },
  //     );
  //   } catch (e) {
  //     if (!isClosed) {
  //       emit(
  //         BulkOperationError(
  //           message: 'Error deleting users: $e',
  //           operation: 'delete',
  //         ),
  //       );
  //     }
  //   }
  // }

  // Future<void> bulkUpdateStatus({
  //   required List<int> userIds,
  //   required String status,
  // }) async {
  //   if (isClosed) return;

  //   emit(const BulkOperationLoading(operation: 'Updating user status'));

  //   try {
  //     final result = await _repository.bulkUpdateStatus(
  //       userIds: userIds,
  //       status: status,
  //     );

  //     if (isClosed) return;

  //     result.when(
  //       success: (_) {
  //         _users = _users.map((user) {
  //           if (userIds.contains(user.id)) {
  //             return User(
  //               id: user.id,
  //               name: user.name,
  //               email: user.email,
  //               phone: user.phone,
  //               role: user.role,
  //               status: status,
  //               createdAt: user.createdAt,
  //               updatedAt: user.updatedAt,
  //             );
  //           }
  //           return user;
  //         }).toList();
  //         emit(
  //           BulkOperationCompleted(
  //             operation: 'status_update',
  //             affectedCount: userIds.length,
  //           ),
  //         );
  //       },
  //       failure: (error) {
  //         emit(BulkOperationError(message: error, operation: 'status_update'));
  //       },
  //     );
  //   } catch (e) {
  //     if (!isClosed) {
  //       emit(
  //         BulkOperationError(
  //           message: 'Error updating user status: $e',
  //           operation: 'status_update',
  //         ),
  //       );
  //     }
  //   }
  // }

  // Helper methods
  List<User> getUsersByRole(String role) {
    return _users.where((user) => user.role == role).toList();
  }

  List<User> getUsersByStatus(String status) {
    return _users.where((user) => user.status == status).toList();
  }

  List<User> searchUsers(String query) {
    return _users.where((user) {
      return (user.name ?? '').toLowerCase().contains(query.toLowerCase()) ||
          (user.email ?? '').toLowerCase().contains(query.toLowerCase()) ||
          (user.phone?.toLowerCase().contains(query.toLowerCase()) ?? false);
    }).toList();
  }
}
