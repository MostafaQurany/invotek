import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/cubits/permissions_cubit.dart';
import 'package:invotek/core/theme/app_colors.dart';

/// مفاتيح الصلاحيات المستخدمة في التطبيق
class PermissionKeys {
  // لوحة التحكم
  static const String dashboardView = 'dashboard.view';
  static const String dashboardSettings = 'dashboard.settings';
  static const String dashboardReports = 'dashboard.reports';

  // إدارة المستخدمين
  static const String usersView = 'users.view';
  static const String usersCreate = 'users.create';
  static const String usersEdit = 'users.edit';
  static const String usersDelete = 'users.delete';

  // إدارة الأدوار
  static const String rolesView = 'roles.view';
  static const String rolesCreate = 'roles.create';
  static const String rolesEdit = 'roles.edit';
  static const String rolesDelete = 'roles.delete';

  // إدارة العملاء
  static const String customersView = 'customers.view';
  static const String customersCreate = 'customers.create';
  static const String customersEdit = 'customers.edit';
  static const String customersDelete = 'customers.delete';

  // إدارة المنتجات
  static const String productsView = 'products.view';
  static const String productsCreate = 'products.create';
  static const String productsEdit = 'products.edit';
  static const String productsDelete = 'products.delete';

  // فئات المنتجات
  static const String productCategoriesView = 'product-categories.view';
  static const String productCategoriesCreate = 'product-categories.create';
  static const String productCategoriesEdit = 'product-categories.edit';
  static const String productCategoriesDelete = 'product-categories.delete';

  // إدارة المصاريف
  static const String expensesView = 'expenses.view';
  static const String expensesCreate = 'expenses.create';
  static const String expensesEdit = 'expenses.edit';
  static const String expensesDelete = 'expenses.delete';
  static const String expensesApprove = 'expenses.approve';

  // فئات المصاريف
  static const String expenseCategoriesView = 'expense-categories.view';
  static const String expenseCategoriesCreate = 'expense-categories.create';
  static const String expenseCategoriesEdit = 'expense-categories.edit';
  static const String expenseCategoriesDelete = 'expense-categories.delete';

  // الفواتير الضريبية
  static const String taxInvoicesView = 'tax-invoices.view';
  static const String taxInvoicesCreate = 'tax-invoices.create';
  static const String taxInvoicesEdit = 'tax-invoices.edit';
  static const String taxInvoicesDelete = 'tax-invoices.delete';
  static const String taxInvoicesSend = 'tax-invoices.send';
  static const String taxInvoicesCreateCredit = 'tax-invoices.create-credit';
  static const String taxInvoicesPending = 'tax-invoices.pending';
  static const String taxInvoicesSent = 'tax-invoices.sent';
  static const String taxInvoicesReturned = 'tax-invoices.returned';
  static const String taxInvoicesPrint = 'tax-invoices.print';
  static const String taxInvoicesBluetooth = 'tax-invoices.bluetooth';
}

/// Widget للتحكم في عرض العناصر بناءً على الصلاحيات
class PermissionWidget extends StatelessWidget {
  final String permission;
  final Widget child;
  final Widget? fallback;
  final bool requireAll;

  const PermissionWidget({
    super.key,
    required this.permission,
    required this.child,
    this.fallback,
    this.requireAll = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PermissionsCubit, PermissionsState>(
      builder: (context, state) {
        final hasPermission = state.maybeWhen(
          loaded: (permissions) => permissions.hasPermission(permission),
          orElse: () => false,
        );

        if (hasPermission) {
          return child;
        } else {
          return fallback ?? const SizedBox.shrink();
        }
      },
    );
  }
}

/// Widget للتحكم في عرض العناصر بناءً على عدة صلاحيات
class MultiPermissionWidget extends StatelessWidget {
  final List<String> permissions;
  final Widget child;
  final Widget? fallback;
  final bool requireAll;

  const MultiPermissionWidget({
    super.key,
    required this.permissions,
    required this.child,
    this.fallback,
    this.requireAll = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PermissionsCubit, PermissionsState>(
      builder: (context, state) {
        final hasPermission = state.maybeWhen(
          loaded: (permissions) => requireAll
              ? permissions.hasAllPermissions(this.permissions)
              : permissions.hasAnyPermission(this.permissions),
          orElse: () => false,
        );

        if (hasPermission) {
          return child;
        } else {
          return fallback ?? const SizedBox.shrink();
        }
      },
    );
  }
}

/// Widget للتحكم في عرض العناصر بناءً على صلاحية وحدة معينة
class ModulePermissionWidget extends StatelessWidget {
  final String module;
  final String action; // view, create, edit, delete
  final Widget child;
  final Widget? fallback;

  const ModulePermissionWidget({
    super.key,
    required this.module,
    required this.action,
    required this.child,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PermissionsCubit, PermissionsState>(
      builder: (context, state) {
        final hasPermission = state.maybeWhen(
          loaded: (permissions) {
            switch (action) {
              case 'view':
                return permissions.canView(module);
              case 'create':
                return permissions.canCreate(module);
              case 'edit':
                return permissions.canEdit(module);
              case 'delete':
                return permissions.canDelete(module);
              default:
                return false;
            }
          },
          orElse: () => false,
        );

        if (hasPermission) {
          return child;
        } else {
          return fallback ?? const SizedBox.shrink();
        }
      },
    );
  }
}

/// Helper class for checking permissions
class PermissionChecker {
  /// التحقق من صلاحية واحدة
  static bool hasPermission(BuildContext context, String permission) {
    final permissionsCubit = context.read<PermissionsCubit>();
    return permissionsCubit.hasPermission(permission);
  }

  /// التحقق من عدة صلاحيات (أي واحدة)
  static bool hasAnyPermission(BuildContext context, List<String> permissions) {
    final permissionsCubit = context.read<PermissionsCubit>();
    return permissionsCubit.hasAnyPermission(permissions);
  }

  /// التحقق من عدة صلاحيات (جميعها)
  static bool hasAllPermissions(
    BuildContext context,
    List<String> permissions,
  ) {
    final permissionsCubit = context.read<PermissionsCubit>();
    return permissionsCubit.hasAllPermissions(permissions);
  }

  /// التحقق من صلاحية وحدة معينة
  static bool canPerformAction(
    BuildContext context,
    String module,
    String action,
  ) {
    final permissionsCubit = context.read<PermissionsCubit>();
    switch (action) {
      case 'view':
        return permissionsCubit.canView(module);
      case 'create':
        return permissionsCubit.canCreate(module);
      case 'edit':
        return permissionsCubit.canEdit(module);
      case 'delete':
        return permissionsCubit.canDelete(module);
      default:
        return false;
    }
  }

  /// عرض رسالة عدم وجود صلاحية
  static void showPermissionDeniedSnackBar(
    BuildContext context,
    String featureName,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.lock_outline, color: Colors.white),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'غير مسموح',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'ليس لديك صلاحية للوصول إلى $featureName',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.error,
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
