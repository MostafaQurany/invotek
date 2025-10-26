// مثال على استخدام نظام الصلاحيات في التطبيق

import 'package:flutter/material.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/core/cubits/permissions_cubit.dart';

class PermissionsUsageExample extends StatelessWidget {
  const PermissionsUsageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('مثال على الصلاحيات')),
      body: Column(
        children: [
          // 1. استخدام PermissionWidget لإخفاء/إظهار عنصر واحد
          PermissionWidget(
            permission: PermissionKeys.usersView,
            child: const ListTile(
              leading: Icon(Icons.people),
              title: Text('قائمة المستخدمين'),
            ),
          ),

          // 2. استخدام MultiPermissionWidget للتحقق من عدة صلاحيات
          MultiPermissionWidget(
            permissions: [PermissionKeys.usersCreate, PermissionKeys.usersEdit],
            child: const ListTile(
              leading: Icon(Icons.add),
              title: Text('إضافة مستخدم جديد'),
            ),
          ),

          // 3. استخدام ModulePermissionWidget للتحقق من صلاحية وحدة معينة
          ModulePermissionWidget(
            module: 'users',
            action: 'view',
            child: const ListTile(
              leading: Icon(Icons.list),
              title: Text('عرض المستخدمين'),
            ),
          ),

          // 4. استخدام PermissionWidget مع fallback widget
          PermissionWidget(
            permission: PermissionKeys.dashboardSettings,
            fallback: const ListTile(
              leading: Icon(Icons.lock),
              title: Text('غير مسموح - لا توجد صلاحية'),
            ),
            child: const ListTile(
              leading: Icon(Icons.settings),
              title: Text('إعدادات النظام'),
            ),
          ),

          // 5. استخدام في FloatingActionButton
          PermissionWidget(
            permission: PermissionKeys.taxInvoicesCreate,
            child: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

// مثال على التحقق من الصلاحيات في Cubit أو Logic
class ExampleCubit {
  // التحقق من الصلاحية في Logic
  bool canUserCreateInvoice(PermissionsCubit permissionsCubit) {
    return permissionsCubit.hasPermission(PermissionKeys.taxInvoicesCreate);
  }

  // التحقق من عدة صلاحيات
  bool canUserManageUsers(PermissionsCubit permissionsCubit) {
    return permissionsCubit.hasAnyPermission([
      PermissionKeys.usersView,
      PermissionKeys.usersCreate,
      PermissionKeys.usersEdit,
      PermissionKeys.usersDelete,
    ]);
  }

  // التحقق من صلاحية وحدة معينة
  bool canUserViewModule(PermissionsCubit permissionsCubit, String module) {
    return permissionsCubit.canView(module);
  }
}
