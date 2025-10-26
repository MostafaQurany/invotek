import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/features/auth/data/models/permission_models.dart';
import 'package:invotek/features/auth/domain/repo/permissions_repo.dart';
import 'package:invotek/core/server/api_result.dart';

part 'permissions_cubit.freezed.dart';
part 'permissions_state.dart';

class PermissionsCubit extends Cubit<PermissionsState> {
  final PermissionsRepo repo;

  PermissionsCubit(this.repo) : super(const PermissionsState.initial());

  /// تحميل الصلاحيات من API
  Future<void> loadPermissions(int roleId) async {
    emit(const PermissionsState.loading());

    try {
      final result = await repo.fetchPermissions(roleId);

      result.when(
        success: (permissions) {
          emit(PermissionsState.loaded(permissions));
        },
        failure: (failure) {
          emit(PermissionsState.error(failure.message));
        },
      );
    } catch (e) {
      emit(PermissionsState.error('خطأ في تحميل الصلاحيات: ${e.toString()}'));
    }
  }

  /// تحميل الصلاحيات من التخزين المحلي
  Future<void> loadCachedPermissions() async {
    try {
      final permissions = await repo.getCachedPermissions();
      if (permissions != null) {
        emit(PermissionsState.loaded(permissions));
      } else {
        emit(const PermissionsState.initial());
      }
    } catch (e) {
      emit(
        PermissionsState.error(
          'خطأ في تحميل الصلاحيات المحفوظة: ${e.toString()}',
        ),
      );
    }
  }

  /// مسح الصلاحيات
  Future<void> clearPermissions() async {
    await repo.clearPermissions();
    emit(const PermissionsState.initial());
  }

  /// التحقق من وجود صلاحية محددة
  bool hasPermission(String key) {
    return state.maybeWhen(
      loaded: (permissions) => permissions.hasPermission(key),
      orElse: () => false,
    );
  }

  /// التحقق من وجود أي صلاحية من القائمة
  bool hasAnyPermission(List<String> keys) {
    return state.maybeWhen(
      loaded: (permissions) => permissions.hasAnyPermission(keys),
      orElse: () => false,
    );
  }

  /// التحقق من وجود جميع الصلاحيات
  bool hasAllPermissions(List<String> keys) {
    return state.maybeWhen(
      loaded: (permissions) => permissions.hasAllPermissions(keys),
      orElse: () => false,
    );
  }

  /// التحقق من صلاحية العرض لوحدة معينة
  bool canView(String module) {
    return state.maybeWhen(
      loaded: (permissions) => permissions.canView(module),
      orElse: () => false,
    );
  }

  /// التحقق من صلاحية الإنشاء
  bool canCreate(String module) {
    return state.maybeWhen(
      loaded: (permissions) => permissions.canCreate(module),
      orElse: () => false,
    );
  }

  /// التحقق من صلاحية التعديل
  bool canEdit(String module) {
    return state.maybeWhen(
      loaded: (permissions) => permissions.canEdit(module),
      orElse: () => false,
    );
  }

  /// التحقق من صلاحية الحذف
  bool canDelete(String module) {
    return state.maybeWhen(
      loaded: (permissions) => permissions.canDelete(module),
      orElse: () => false,
    );
  }

  /// تحميل الصلاحيات مع استراتيجية Cache-First
  Future<void> loadPermissionsWithCacheFallback(int roleId) async {
    try {
      // 1. تحميل من Cache فوراً
      final cachedPermissions = await repo.getCachedPermissions();
      if (cachedPermissions != null) {
        emit(PermissionsState.loaded(cachedPermissions));
      }

      // 2. جلب من الخادم في الخلفية (بدون emit loading)
      final result = await repo.fetchPermissions(roleId);
      result.when(
        success: (permissions) {
          emit(PermissionsState.loaded(permissions));
        },
        failure: (failure) {
          // لا نعرض خطأ إذا كان لدينا cached data
          if (cachedPermissions == null) {
            emit(PermissionsState.error(failure.message));
          }
        },
      );
    } catch (e) {
      // إذا فشل كل شيء ولا يوجد cached data
      final cachedPermissions = await repo.getCachedPermissions();
      if (cachedPermissions == null) {
        emit(PermissionsState.error('خطأ في تحميل الصلاحيات'));
      }
    }
  }

  /// تحميل صلاحيات كاملة للاختبار
  Future<void> loadFullPermissionsForTesting() async {
    final result = await repo.loadFullPermissionsForTesting();
    result.when(
      success: (permissions) {
        emit(PermissionsState.loaded(permissions));
      },
      failure: (failure) {
        emit(PermissionsState.error(failure.message));
      },
    );
  }
}
