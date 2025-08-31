import 'package:invotek/features/users_and_permissions/data/models/permission_model.dart';

class PermissionsState {
  final List<Permission> permissions;
  final List<Role> roles;
  final List<UserPermission> userPermissions;
  final bool isLoading;
  final String? error;
  final Role? selectedRole;

  PermissionsState({
    this.permissions = const [],
    this.roles = const [],
    this.userPermissions = const [],
    this.isLoading = false,
    this.error,
    this.selectedRole,
  });

  PermissionsState copyWith({
    List<Permission>? permissions,
    List<Role>? roles,
    List<UserPermission>? userPermissions,
    bool? isLoading,
    String? error,
    Role? selectedRole,
  }) {
    return PermissionsState(
      permissions: permissions ?? this.permissions,
      roles: roles ?? this.roles,
      userPermissions: userPermissions ?? this.userPermissions,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      selectedRole: selectedRole ?? this.selectedRole,
    );
  }
}
