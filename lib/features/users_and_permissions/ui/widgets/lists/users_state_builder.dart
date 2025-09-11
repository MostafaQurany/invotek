import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/auth/demo/entit/user_model.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_cubit.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/users_state.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/lists/users_list.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/states/users_empty_state.dart';
import 'package:invotek/features/users_and_permissions/ui/widgets/states/users_error_state.dart';

class UsersStateBuilder extends StatelessWidget {
  final Function(User) onUserTap;
  final Function(User) onUserView;
  final Function(User) onUserEdit;
  final Function(User) onUserDelete;
  final VoidCallback onAddUser;
  final VoidCallback onRetry;
  final String selectedRole;
  final String selectedStatus;
  final ValueChanged<String?> onRoleChanged;
  final ValueChanged<String?> onStatusChanged;

  const UsersStateBuilder({
    super.key,
    required this.onUserTap,
    required this.onUserView,
    required this.onUserEdit,
    required this.onUserDelete,
    required this.onAddUser,
    required this.onRetry,
    required this.selectedRole,
    required this.selectedStatus,
    required this.onRoleChanged,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        if (state is UsersListLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is UsersListLoadingMore) {
          return UsersList(
            users: state.users,
            onUserTap: onUserTap,
            onUserView: onUserView,
            onUserEdit: onUserEdit,
            onUserDelete: onUserDelete,
            onAddUser: onAddUser,
            onRetry: onRetry,
            selectedRole: selectedRole,
            selectedStatus: selectedStatus,
            onRoleChanged: onRoleChanged,
            onStatusChanged: onStatusChanged,
            isLoadingMore: true,
          );
        }

        if (state is UsersListError) {
          return UsersErrorState(message: state.message, onRetry: onRetry);
        }

        if (state is UsersListLoaded) {
          if (state.users.isEmpty) {
            return UsersEmptyState(onAddUser: onAddUser);
          }

          return UsersList(
            users: state.users,
            onUserTap: onUserTap,
            onUserView: onUserView,
            onUserEdit: onUserEdit,
            onUserDelete: onUserDelete,
            onAddUser: onAddUser,
            onRetry: onRetry,
            selectedRole: selectedRole,
            selectedStatus: selectedStatus,
            onRoleChanged: onRoleChanged,
            onStatusChanged: onStatusChanged,
            isLoadingMore: false,
          );
        }

        // Default empty state
        return UsersEmptyState(onAddUser: onAddUser);
      },
    );
  }
}
