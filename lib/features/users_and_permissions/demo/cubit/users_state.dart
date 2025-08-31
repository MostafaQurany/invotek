import 'package:invotek/features/auth/demo/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/data/models/responses/user_responses.dart';

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
  const UsersListLoaded({required this.users, this.hasMoreData = true});
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
  final String message;
  final String operation;
  const UsersError({required this.message, required this.operation});
}

class UsersListError extends UsersState {
  final String message;
  const UsersListError({required this.message});
}

class UserCreationError extends UsersState {
  final String message;
  const UserCreationError({required this.message});
}

class UserUpdateError extends UsersState {
  final String message;
  const UserUpdateError({required this.message});
}

class UserDeletionError extends UsersState {
  final String message;
  const UserDeletionError({required this.message});
}

class PasswordChangeError extends UsersState {
  final String message;
  const PasswordChangeError({required this.message});
}

class StatisticsError extends UsersState {
  final String message;
  const StatisticsError({required this.message});
}

class BulkOperationError extends UsersState {
  final String message;
  final String operation;
  const BulkOperationError({required this.message, required this.operation});
}
