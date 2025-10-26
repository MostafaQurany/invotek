import 'package:json_annotation/json_annotation.dart';

part 'permission_models.g.dart';

/// نموذج الصلاحية الفردية
@JsonSerializable()
class Permission {
  final int id;
  final String name;
  final String key;
  final String module;
  final String description;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  Permission({
    required this.id,
    required this.name,
    required this.key,
    required this.module,
    required this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionToJson(this);
}

/// استجابة API للصلاحيات
@JsonSerializable()
class PermissionsResponse {
  final bool success;
  final Map<String, List<Permission>> data;

  PermissionsResponse({
    required this.success,
    required this.data,
  });

  factory PermissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$PermissionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionsResponseToJson(this);
}

/// wrapper للصلاحيات مع helper methods
@JsonSerializable()
class UserPermissions {
  final Map<String, List<Permission>> permissions;
  @JsonKey(name: 'loaded_at')
  final String? loadedAt;

  UserPermissions({
    required this.permissions,
    String? loadedAt,
  }) : loadedAt = loadedAt ?? DateTime.now().toIso8601String();

  factory UserPermissions.fromJson(Map<String, dynamic> json) =>
      _$UserPermissionsFromJson(json);

  Map<String, dynamic> toJson() => _$UserPermissionsToJson(this);

  /// الحصول على جميع الصلاحيات كقائمة مسطحة
  List<Permission> get allPermissions {
    return permissions.values.expand((list) => list).toList();
  }

  /// الحصول على جميع مفاتيح الصلاحيات
  List<String> get allPermissionKeys {
    return allPermissions.map((p) => p.key).toList();
  }

  /// التحقق من وجود صلاحية محددة
  bool hasPermission(String key) {
    return allPermissionKeys.contains(key);
  }

  /// التحقق من وجود أي صلاحية من القائمة
  bool hasAnyPermission(List<String> keys) {
    return keys.any((key) => hasPermission(key));
  }

  /// التحقق من وجود جميع الصلاحيات
  bool hasAllPermissions(List<String> keys) {
    return keys.every((key) => hasPermission(key));
  }

  /// التحقق من صلاحية العرض لوحدة معينة
  bool canView(String module) {
    return hasPermission('$module.view');
  }

  /// التحقق من صلاحية الإنشاء
  bool canCreate(String module) {
    return hasPermission('$module.create');
  }

  /// التحقق من صلاحية التعديل
  bool canEdit(String module) {
    return hasPermission('$module.edit');
  }

  /// التحقق من صلاحية الحذف
  bool canDelete(String module) {
    return hasPermission('$module.delete');
  }

  /// إنشاء UserPermissions فارغة
  factory UserPermissions.empty() {
    return UserPermissions(permissions: {});
  }
  /// إنشاء صلاحيات كاملة للاختبار
  factory UserPermissions.fullAccess() {
    final allPermissions = <String, List<Permission>>{};

    // قائمة جميع الصلاحيات المطلوبة في التطبيق
    final permissionKeys = [
      // لوحة التحكم
      'dashboard.view', 'dashboard.settings', 'dashboard.reports',

      // إدارة المستخدمين
      'users.view', 'users.create', 'users.edit', 'users.delete',

      // إدارة الأدوار
      'roles.view', 'roles.create', 'roles.edit', 'roles.delete',

      // إدارة العملاء
      'customers.view',
      'customers.create',
      'customers.edit',
      'customers.delete',

      // إدارة المنتجات
      'products.view', 'products.create', 'products.edit', 'products.delete',

      // فئات المنتجات
      'product-categories.view', 'product-categories.create',
      'product-categories.edit', 'product-categories.delete',

      // إدارة المصاريف
      'expenses.view', 'expenses.create', 'expenses.edit',
      'expenses.delete', 'expenses.approve',

      // فئات المصاريف
      'expense-categories.view', 'expense-categories.create',
      'expense-categories.edit', 'expense-categories.delete',

      // الفواتير الضريبية
      'tax-invoices.view', 'tax-invoices.create', 'tax-invoices.edit',
      'tax-invoices.delete', 'tax-invoices.send', 'tax-invoices.create-credit',
      'tax-invoices.pending', 'tax-invoices.sent', 'tax-invoices.returned',
      'tax-invoices.print', 'tax-invoices.bluetooth',
    ];

    // تجميع الصلاحيات حسب الوحدة
    for (final key in permissionKeys) {
      final parts = key.split('.');
      final module = parts[0];

      if (!allPermissions.containsKey(module)) {
        allPermissions[module] = [];
      }

      allPermissions[module]!.add(
        Permission(
          id: permissionKeys.indexOf(key) + 1,
          name: _getPermissionName(key),
          key: key,
          module: module,
          description: 'صلاحية ${_getPermissionName(key)}',
          createdAt: DateTime.now().toIso8601String(),
          updatedAt: DateTime.now().toIso8601String(),
        ),
      );
    }

    return UserPermissions(permissions: allPermissions);
  }

  // دالة مساعدة للحصول على اسم الصلاحية بالعربية
  static String _getPermissionName(String key) {
    final names = {
      // لوحة التحكم
      'dashboard.view': 'عرض لوحة التحكم',
      'dashboard.settings': 'إعدادات لوحة التحكم',
      'dashboard.reports': 'تقارير لوحة التحكم',

      // إدارة المستخدمين
      'users.view': 'عرض المستخدمين',
      'users.create': 'إنشاء مستخدم',
      'users.edit': 'تعديل مستخدم',
      'users.delete': 'حذف مستخدم',

      // إدارة الأدوار
      'roles.view': 'عرض الأدوار',
      'roles.create': 'إنشاء دور',
      'roles.edit': 'تعديل دور',
      'roles.delete': 'حذف دور',

      // إدارة العملاء
      'customers.view': 'عرض العملاء',
      'customers.create': 'إنشاء عميل',
      'customers.edit': 'تعديل عميل',
      'customers.delete': 'حذف عميل',

      // إدارة المنتجات
      'products.view': 'عرض المنتجات',
      'products.create': 'إنشاء منتج',
      'products.edit': 'تعديل منتج',
      'products.delete': 'حذف منتج',

      // فئات المنتجات
      'product-categories.view': 'عرض فئات المنتجات',
      'product-categories.create': 'إنشاء فئة منتج',
      'product-categories.edit': 'تعديل فئة منتج',
      'product-categories.delete': 'حذف فئة منتج',

      // إدارة المصاريف
      'expenses.view': 'عرض المصروفات',
      'expenses.create': 'إنشاء مصروف',
      'expenses.edit': 'تعديل مصروف',
      'expenses.delete': 'حذف مصروف',
      'expenses.approve': 'الموافقة على المصروفات',

      // فئات المصاريف
      'expense-categories.view': 'عرض فئات المصروفات',
      'expense-categories.create': 'إنشاء فئة مصروف',
      'expense-categories.edit': 'تعديل فئة مصروف',
      'expense-categories.delete': 'حذف فئة مصروف',

      // الفواتير الضريبية
      'tax-invoices.view': 'عرض الفواتير الضريبية',
      'tax-invoices.create': 'إنشاء فاتورة ضريبية',
      'tax-invoices.edit': 'تعديل فاتورة ضريبية',
      'tax-invoices.delete': 'حذف فاتورة ضريبية',
      'tax-invoices.send': 'إرسال فاتورة ضريبية',
      'tax-invoices.create-credit': 'إنشاء فاتورة دائنة',
      'tax-invoices.pending': 'الفواتير المعلقة',
      'tax-invoices.sent': 'الفواتير المرسلة',
      'tax-invoices.returned': 'الفواتير المرتجعة',
      'tax-invoices.print': 'طباعة الفواتير',
      'tax-invoices.bluetooth': 'طباعة بلوتوث',
    };
    return names[key] ?? key;
  }
}

