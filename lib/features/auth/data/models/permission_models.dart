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

    // لوحة التحكم
    allPermissions['لوحة التحكم'] = [
      Permission(
        id: 1,
        name: 'عرض لوحة التحكم',
        key: 'dashboard.view',
        module: 'لوحة التحكم',
        description: 'الوصول إلى لوحة التحكم والإحصائيات',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 2,
        name: 'إدارة إعدادات النظام',
        key: 'dashboard.settings',
        module: 'لوحة التحكم',
        description: 'إدارة إعدادات وتكوينات النظام',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 3,
        name: 'تشغيل التقارير',
        key: 'dashboard.reports',
        module: 'لوحة التحكم',
        description: 'إنشاء وعرض تقارير النظام',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
    ];

    // إدارة المستخدمين
    allPermissions['إدارة المستخدمين'] = [
      Permission(
        id: 4,
        name: 'عرض المستخدمين',
        key: 'users.view',
        module: 'إدارة المستخدمين',
        description: 'عرض قائمة المستخدمين',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 5,
        name: 'إنشاء مستخدم',
        key: 'users.create',
        module: 'إدارة المستخدمين',
        description: 'إضافة مستخدم جديد',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 6,
        name: 'تعديل مستخدم',
        key: 'users.edit',
        module: 'إدارة المستخدمين',
        description: 'تعديل معلومات المستخدم',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 7,
        name: 'حذف مستخدم',
        key: 'users.delete',
        module: 'إدارة المستخدمين',
        description: 'حذف مستخدم من النظام',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
    ];

    // إدارة الأدوار
    allPermissions['إدارة الأدوار'] = [
      Permission(
        id: 8,
        name: 'عرض الأدوار',
        key: 'roles.view',
        module: 'إدارة الأدوار',
        description: 'عرض قائمة الأدوار والصلاحيات',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 9,
        name: 'إنشاء دور',
        key: 'roles.create',
        module: 'إدارة الأدوار',
        description: 'إضافة دور جديد',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 10,
        name: 'تعديل دور',
        key: 'roles.edit',
        module: 'إدارة الأدوار',
        description: 'تعديل دور موجود',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 11,
        name: 'حذف دور',
        key: 'roles.delete',
        module: 'إدارة الأدوار',
        description: 'حذف دور من النظام',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
    ];

    // إدارة الفواتير الضريبية
    allPermissions['إدارة الفواتير الضريبية'] = [
      Permission(
        id: 12,
        name: 'عرض الفواتير الضريبية',
        key: 'tax-invoices.view',
        module: 'إدارة الفواتير الضريبية',
        description: 'عرض قائمة الفواتير الضريبية',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 13,
        name: 'إنشاء فاتورة ضريبية',
        key: 'tax-invoices.create',
        module: 'إدارة الفواتير الضريبية',
        description: 'إنشاء فاتورة ضريبية جديدة',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 14,
        name: 'تعديل فاتورة ضريبية',
        key: 'tax-invoices.edit',
        module: 'إدارة الفواتير الضريبية',
        description: 'تعديل فاتورة ضريبية موجودة',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 15,
        name: 'حذف فاتورة ضريبية',
        key: 'tax-invoices.delete',
        module: 'إدارة الفواتير الضريبية',
        description: 'حذف فاتورة ضريبية من النظام',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 16,
        name: 'إرسال فاتورة ضريبية',
        key: 'tax-invoices.send',
        module: 'إدارة الفواتير الضريبية',
        description: 'إرسال فاتورة ضريبية للنظام الضريبي',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 17,
        name: 'إنشاء إشعار إرجاع',
        key: 'tax-invoices.create-credit',
        module: 'إدارة الفواتير الضريبية',
        description: 'إنشاء إشعار إرجاع ضريبي',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 18,
        name: 'عرض الفواتير المعلقة',
        key: 'tax-invoices.pending',
        module: 'إدارة الفواتير الضريبية',
        description: 'عرض الفواتير الضريبية المعلقة',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 19,
        name: 'عرض الفواتير المرسلة',
        key: 'tax-invoices.sent',
        module: 'إدارة الفواتير الضريبية',
        description: 'عرض الفواتير الضريبية المرسلة',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 20,
        name: 'عرض الفواتير المرجعة',
        key: 'tax-invoices.returned',
        module: 'إدارة الفواتير الضريبية',
        description: 'عرض الفواتير الضريبية المرجعة',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 21,
        name: 'طباعة الفواتير',
        key: 'tax-invoices.print',
        module: 'إدارة الفواتير الضريبية',
        description: 'طباعة الفواتير الضريبية بأحجام مختلفة',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 22,
        name: 'طباعة بلوتوث',
        key: 'tax-invoices.bluetooth',
        module: 'إدارة الفواتير الضريبية',
        description: 'طباعة الفواتير عبر البلوتوث',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
    ];

    // إدارة المصاريف
    allPermissions['إدارة المصاريف'] = [
      Permission(
        id: 23,
        name: 'عرض المصاريف',
        key: 'expenses.view',
        module: 'إدارة المصاريف',
        description: 'عرض قائمة المصاريف',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 24,
        name: 'إنشاء مصروف',
        key: 'expenses.create',
        module: 'إدارة المصاريف',
        description: 'إضافة مصروف جديد',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 25,
        name: 'تعديل مصروف',
        key: 'expenses.edit',
        module: 'إدارة المصاريف',
        description: 'تعديل مصروف موجود',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 26,
        name: 'حذف مصروف',
        key: 'expenses.delete',
        module: 'إدارة المصاريف',
        description: 'حذف مصروف من النظام',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 27,
        name: 'الموافقة على المصاريف',
        key: 'expenses.approve',
        module: 'إدارة المصاريف',
        description: 'الموافقة على طلبات المصاريف',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
    ];

    // فئات المصاريف
    allPermissions['فئات المصاريف'] = [
      Permission(
        id: 28,
        name: 'عرض فئات المصاريف',
        key: 'expense-categories.view',
        module: 'فئات المصاريف',
        description: 'عرض قائمة فئات المصاريف',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 29,
        name: 'إنشاء فئة مصاريف',
        key: 'expense-categories.create',
        module: 'فئات المصاريف',
        description: 'إضافة فئة مصاريف جديدة',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 30,
        name: 'تعديل فئة مصاريف',
        key: 'expense-categories.edit',
        module: 'فئات المصاريف',
        description: 'تعديل فئة مصاريف موجودة',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 31,
        name: 'حذف فئة مصاريف',
        key: 'expense-categories.delete',
        module: 'فئات المصاريف',
        description: 'حذف فئة مصاريف من النظام',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
    ];

    // إدارة المنتجات
    allPermissions['إدارة المنتجات'] = [
      Permission(
        id: 40,
        name: 'عرض المنتجات',
        key: 'products.view',
        module: 'إدارة المنتجات',
        description: 'عرض قائمة المنتجات',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 41,
        name: 'إنشاء منتج',
        key: 'products.create',
        module: 'إدارة المنتجات',
        description: 'إضافة منتج جديد',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 42,
        name: 'تعديل منتج',
        key: 'products.edit',
        module: 'إدارة المنتجات',
        description: 'تعديل معلومات المنتج',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 43,
        name: 'حذف منتج',
        key: 'products.delete',
        module: 'إدارة المنتجات',
        description: 'حذف منتج من النظام',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
    ];

    // تصنيفات المنتجات
    allPermissions['تصنيفات المنتجات'] = [
      Permission(
        id: 36,
        name: 'عرض تصنيفات المنتجات',
        key: 'product-categories.view',
        module: 'تصنيفات المنتجات',
        description: 'عرض قائمة تصنيفات المنتجات',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 37,
        name: 'إنشاء تصنيف منتجات',
        key: 'product-categories.create',
        module: 'تصنيفات المنتجات',
        description: 'إضافة تصنيف منتجات جديد',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 38,
        name: 'تعديل تصنيف منتجات',
        key: 'product-categories.edit',
        module: 'تصنيفات المنتجات',
        description: 'تعديل تصنيف منتجات موجود',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 39,
        name: 'حذف تصنيف منتجات',
        key: 'product-categories.delete',
        module: 'تصنيفات المنتجات',
        description: 'حذف تصنيف منتجات من النظام',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
    ];

    // إدارة العملاء
    allPermissions['إدارة العملاء'] = [
      Permission(
        id: 32,
        name: 'عرض العملاء',
        key: 'customers.view',
        module: 'إدارة العملاء',
        description: 'عرض قائمة العملاء',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 33,
        name: 'إنشاء عميل',
        key: 'customers.create',
        module: 'إدارة العملاء',
        description: 'إضافة عميل جديد',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 34,
        name: 'تعديل عميل',
        key: 'customers.edit',
        module: 'إدارة العملاء',
        description: 'تعديل معلومات العميل',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
      Permission(
        id: 35,
        name: 'حذف عميل',
        key: 'customers.delete',
        module: 'إدارة العملاء',
        description: 'حذف عميل من النظام',
        createdAt: '2025-07-12T11:25:33.000000Z',
        updatedAt: '2025-07-12T11:25:33.000000Z',
      ),
    ];

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

