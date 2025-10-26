import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/data/models/responses/user_responses.dart';
import 'package:invotek/core/error/failures.dart';

// Base state class
abstract class UsersState {
  const UsersState();
}

// Initial state
class UsersInitial extends UsersState {
  const UsersInitial();
}

// Loading states for different operations
class UsersLoading extends UsersState {
  final String operation;
  const UsersLoading({required this.operation});
}

class UsersListLoading extends UsersState {
  const UsersListLoading();
}

class UsersListLoadingMore extends UsersState {
  final List<User> users;
  const UsersListLoadingMore({required this.users});
}

class UserCreating extends UsersState {
  const UserCreating();
}

class UserUpdating extends UsersState {
  const UserUpdating();
}

class UserDeleting extends UsersState {
  const UserDeleting();
}

class PasswordChanging extends UsersState {
  const PasswordChanging();
}

class StatisticsLoading extends UsersState {
  const StatisticsLoading();
}

class BulkOperationLoading extends UsersState {
  final String operation;
  const BulkOperationLoading({required this.operation});
}

// Success states
class UsersListLoaded extends UsersState {
  final List<User> users;
  final bool hasMoreData;
  final int currentPage;
  final int totalPages;
  const UsersListLoaded({
    required this.users,
    this.hasMoreData = true,
    this.currentPage = 1,
    this.totalPages = 1,
  });
}

class UserCreated extends UsersState {
  const UserCreated();
}

class UserUpdated extends UsersState {
  final User user;
  const UserUpdated({required this.user});
}

class UserDeleted extends UsersState {
  final int userId;
  const UserDeleted({required this.userId});
}

class PasswordChanged extends UsersState {
  const PasswordChanged();
}

class StatisticsLoaded extends UsersState {
  final UserStatisticsResponse statistics;
  const StatisticsLoaded({required this.statistics});
}

class BulkOperationCompleted extends UsersState {
  final String operation;
  final int affectedCount;
  const BulkOperationCompleted({
    required this.operation,
    required this.affectedCount,
  });
}

// Error states
class UsersError extends UsersState {
  final Failure failure;
  final String operation;
  const UsersError({required this.failure, required this.operation});
}

class UsersListError extends UsersState {
  final Failure failure;
  const UsersListError({required this.failure});
}

class UserCreationError extends UsersState {
  final Failure failure;
  const UserCreationError({required this.failure});
}

class UserUpdateError extends UsersState {
  final Failure failure;
  const UserUpdateError({required this.failure});
}

class UserDeletionError extends UsersState {
  final Failure failure;
  const UserDeletionError({required this.failure});
}

class PasswordChangeError extends UsersState {
  final Failure failure;
  const PasswordChangeError({required this.failure});
}

class StatisticsError extends UsersState {
  final Failure failure;
  const StatisticsError({required this.failure});
}

class BulkOperationError extends UsersState {
  final Failure failure;
  final String operation;
  const BulkOperationError({required this.failure, required this.operation});
}
