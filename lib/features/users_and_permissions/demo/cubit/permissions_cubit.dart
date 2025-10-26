import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/features/users_and_permissions/data/models/permission_model.dart';
import 'package:invotek/features/users_and_permissions/demo/cubit/permissions_state.dart';

// Cubit
class PermissionsCubit extends Cubit<PermissionsState> {
  PermissionsCubit() : super(PermissionsState());

  // تحميل الأدوار والصلاحيات
  Future<void> loadRolesAndPermissions() async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true, error: null));

    try {
      // محاكاة تأخير الشبكة
      await Future.delayed(const Duration(milliseconds: 1000));

      if (isClosed) return;

      final roles = PermissionData.getRoles();
      final permissions = PermissionData.getPermissions();

      emit(
        state.copyWith(
          roles: roles,
          permissions: permissions,
          isLoading: false,
        ),
      );
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(isLoading: false, error: ApiErrorHandler.handleError(e)),
      );
    }
  }

  // تحميل صلاحيات المستخدم
  Future<void> loadUserPermissions(int userId) async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true, error: null));

    try {
      // محاكاة تأخير الشبكة
      await Future.delayed(const Duration(milliseconds: 500));

      if (isClosed) return;

      // بيانات تجريبية لصلاحيات المستخدم
      final userPermissions = [
        UserPermission(
          userId: userId,
          roleId: 1, // مدير النظام
          additionalPermissions: [],
        ),
      ];

      emit(state.copyWith(userPermissions: userPermissions, isLoading: false));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(isLoading: false, error: ApiErrorHandler.handleError(e)),
      );
    }
  }

  // تحديد دور معين
  void selectRole(Role role) {
    if (isClosed) return;
    emit(state.copyWith(selectedRole: role));
  }

  // إضافة دور جديد
  Future<void> addRole(Role role) async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true, error: null));

    try {
      // محاكاة تأخير الشبكة
      await Future.delayed(const Duration(milliseconds: 800));

      if (isClosed) return;

      final updatedRoles = List<Role>.from(state.roles)..add(role);

      emit(state.copyWith(roles: updatedRoles, isLoading: false));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(isLoading: false, error: ApiErrorHandler.handleError(e)),
      );
    }
  }

  // تحديث دور
  Future<void> updateRole(Role updatedRole) async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true, error: null));

    try {
      // محاكاة تأخير الشبكة
      await Future.delayed(const Duration(milliseconds: 800));

      if (isClosed) return;

      final updatedRoles = state.roles.map((role) {
        return role.id == updatedRole.id ? updatedRole : role;
      }).toList();

      emit(state.copyWith(roles: updatedRoles, isLoading: false));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(isLoading: false, error: ApiErrorHandler.handleError(e)),
      );
    }
  }

  // حذف دور
  Future<void> deleteRole(int roleId) async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true, error: null));

    try {
      // محاكاة تأخير الشبكة
      await Future.delayed(const Duration(milliseconds: 600));

      if (isClosed) return;

      final updatedRoles = state.roles
          .where((role) => role.id != roleId)
          .toList();

      emit(state.copyWith(roles: updatedRoles, isLoading: false));
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(isLoading: false, error: ApiErrorHandler.handleError(e)),
      );
    }
  }

  // تحديث صلاحيات المستخدم
  Future<void> updateUserPermissions(UserPermission userPermission) async {
    if (isClosed) return;
    emit(state.copyWith(isLoading: true, error: null));

    try {
      // محاكاة تأخير الشبكة
      await Future.delayed(const Duration(milliseconds: 1000));

      if (isClosed) return;

      final updatedUserPermissions = state.userPermissions.map((up) {
        return up.userId == userPermission.userId ? userPermission : up;
      }).toList();

      emit(
        state.copyWith(
          userPermissions: updatedUserPermissions,
          isLoading: false,
        ),
      );
    } catch (e) {
      if (isClosed) return;
      emit(
        state.copyWith(isLoading: false, error: ApiErrorHandler.handleError(e)),
      );
    }
  }

  // مسح الخطأ
  void clearError() {
    if (isClosed) return;
    emit(state.copyWith(error: null));
  }

  // الحصول على الصلاحيات حسب الوحدة
  List<Permission> getPermissionsByModule(String module) {
    return state.permissions
        .where((permission) => permission.module == module)
        .toList();
  }

  // الحصول على الأدوار النشطة
  List<Role> getActiveRoles() {
    return state.roles.where((role) => role.isActive).toList();
  }

  // التحقق من وجود صلاحية للمستخدم
  bool hasPermission(int userId, String module, String action) {
    final userPermission = state.userPermissions
        .where((up) => up.userId == userId && up.isActive)
        .firstOrNull;

    if (userPermission == null) return false;

    final role = state.roles
        .where((r) => r.id == userPermission.roleId && r.isActive)
        .firstOrNull;

    if (role == null) return false;

    // التحقق من صلاحيات الدور
    final hasRolePermission = role.permissions.any(
      (p) => p.module == module && p.action == action && p.isActive,
    );

    if (hasRolePermission) return true;

    // التحقق من الصلاحيات الإضافية
    return userPermission.additionalPermissions.any(
      (p) => p.module == module && p.action == action && p.isActive,
    );
  }
}
