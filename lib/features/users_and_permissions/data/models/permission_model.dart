class Permission {
  final int id;
  final String name;
  final String description;
  final String module; // مثل: users, products, invoices, etc.
  final String action; // مثل: create, read, update, delete
  final bool isActive;

  Permission({
    required this.id,
    required this.name,
    required this.description,
    required this.module,
    required this.action,
    this.isActive = true,
  });

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      module: json['module'] ?? '',
      action: json['action'] ?? '',
      isActive: json['is_active'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'module': module,
      'action': action,
      'is_active': isActive,
    };
  }

  @override
  String toString() {
    return 'Permission(id: $id, name: $name, module: $module, action: $action)';
  }
}

class Role {
  final int id;
  final String name;
  final String description;
  final bool isActive;
  final List<Permission> permissions;

  Role({
    required this.id,
    required this.name,
    required this.description,
    this.isActive = true,
    this.permissions = const [],
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      isActive: json['is_active'] ?? true,
      permissions: (json['permissions'] as List<dynamic>?)
              ?.map((p) => Permission.fromJson(p))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'is_active': isActive,
      'permissions': permissions.map((p) => p.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return 'Role(id: $id, name: $name, permissions: ${permissions.length})';
  }
}

class UserPermission {
  final int userId;
  final int roleId;
  final List<Permission> additionalPermissions;
  final bool isActive;

  UserPermission({
    required this.userId,
    required this.roleId,
    this.additionalPermissions = const [],
    this.isActive = true,
  });

  factory UserPermission.fromJson(Map<String, dynamic> json) {
    return UserPermission(
      userId: json['user_id'] ?? 0,
      roleId: json['role_id'] ?? 0,
      additionalPermissions: (json['additional_permissions'] as List<dynamic>?)
              ?.map((p) => Permission.fromJson(p))
              .toList() ??
          [],
      isActive: json['is_active'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'role_id': roleId,
      'additional_permissions':
          additionalPermissions.map((p) => p.toJson()).toList(),
      'is_active': isActive,
    };
  }
}

// بيانات تجريبية للصلاحيات
class PermissionData {
  static List<Permission> getPermissions() {
    return [
      // صلاحيات المستخدمين
      Permission(
        id: 1,
        name: 'عرض المستخدمين',
        description: 'إمكانية عرض قائمة المستخدمين',
        module: 'users',
        action: 'read',
      ),
      Permission(
        id: 2,
        name: 'إضافة مستخدم',
        description: 'إمكانية إضافة مستخدم جديد',
        module: 'users',
        action: 'create',
      ),
      Permission(
        id: 3,
        name: 'تعديل مستخدم',
        description: 'إمكانية تعديل بيانات المستخدم',
        module: 'users',
        action: 'update',
      ),
      Permission(
        id: 4,
        name: 'حذف مستخدم',
        description: 'إمكانية حذف المستخدم',
        module: 'users',
        action: 'delete',
      ),
      Permission(
        id: 5,
        name: 'إدارة الصلاحيات',
        description: 'إمكانية إدارة صلاحيات المستخدمين',
        module: 'users',
        action: 'manage_permissions',
      ),

      // صلاحيات العملاء
      Permission(
        id: 6,
        name: 'عرض العملاء',
        description: 'إمكانية عرض قائمة العملاء',
        module: 'clients',
        action: 'read',
      ),
      Permission(
        id: 7,
        name: 'إضافة عميل',
        description: 'إمكانية إضافة عميل جديد',
        module: 'clients',
        action: 'create',
      ),
      Permission(
        id: 8,
        name: 'تعديل عميل',
        description: 'إمكانية تعديل بيانات العميل',
        module: 'clients',
        action: 'update',
      ),
      Permission(
        id: 9,
        name: 'حذف عميل',
        description: 'إمكانية حذف العميل',
        module: 'clients',
        action: 'delete',
      ),

      // صلاحيات المنتجات
      Permission(
        id: 10,
        name: 'عرض المنتجات',
        description: 'إمكانية عرض قائمة المنتجات',
        module: 'products',
        action: 'read',
      ),
      Permission(
        id: 11,
        name: 'إضافة منتج',
        description: 'إمكانية إضافة منتج جديد',
        module: 'products',
        action: 'create',
      ),
      Permission(
        id: 12,
        name: 'تعديل منتج',
        description: 'إمكانية تعديل بيانات المنتج',
        module: 'products',
        action: 'update',
      ),
      Permission(
        id: 13,
        name: 'حذف منتج',
        description: 'إمكانية حذف المنتج',
        module: 'products',
        action: 'delete',
      ),

      // صلاحيات الفواتير
      Permission(
        id: 14,
        name: 'عرض الفواتير',
        description: 'إمكانية عرض قائمة الفواتير',
        module: 'invoices',
        action: 'read',
      ),
      Permission(
        id: 15,
        name: 'إنشاء فاتورة',
        description: 'إمكانية إنشاء فاتورة جديدة',
        module: 'invoices',
        action: 'create',
      ),
      Permission(
        id: 16,
        name: 'تعديل فاتورة',
        description: 'إمكانية تعديل الفاتورة',
        module: 'invoices',
        action: 'update',
      ),
      Permission(
        id: 17,
        name: 'حذف فاتورة',
        description: 'إمكانية حذف الفاتورة',
        module: 'invoices',
        action: 'delete',
      ),
      Permission(
        id: 18,
        name: 'إرسال فاتورة',
        description: 'إمكانية إرسال الفاتورة للعميل',
        module: 'invoices',
        action: 'send',
      ),

      // صلاحيات المصروفات
      Permission(
        id: 19,
        name: 'عرض المصروفات',
        description: 'إمكانية عرض قائمة المصروفات',
        module: 'expenses',
        action: 'read',
      ),
      Permission(
        id: 20,
        name: 'إضافة مصروف',
        description: 'إمكانية إضافة مصروف جديد',
        module: 'expenses',
        action: 'create',
      ),
      Permission(
        id: 21,
        name: 'تعديل مصروف',
        description: 'إمكانية تعديل المصروف',
        module: 'expenses',
        action: 'update',
      ),
      Permission(
        id: 22,
        name: 'حذف مصروف',
        description: 'إمكانية حذف المصروف',
        module: 'expenses',
        action: 'delete',
      ),

      // صلاحيات التقارير
      Permission(
        id: 23,
        name: 'عرض التقارير',
        description: 'إمكانية عرض التقارير',
        module: 'reports',
        action: 'read',
      ),
      Permission(
        id: 24,
        name: 'تصدير التقارير',
        description: 'إمكانية تصدير التقارير',
        module: 'reports',
        action: 'export',
      ),

      // صلاحيات الإعدادات
      Permission(
        id: 25,
        name: 'إعدادات الشركة',
        description: 'إمكانية تعديل إعدادات الشركة',
        module: 'settings',
        action: 'company',
      ),
      Permission(
        id: 26,
        name: 'إعدادات النظام',
        description: 'إمكانية تعديل إعدادات النظام',
        module: 'settings',
        action: 'system',
      ),
    ];
  }

  static List<Role> getRoles() {
    final permissions = getPermissions();
    
    return [
      Role(
        id: 1,
        name: 'مدير النظام',
        description: 'لديه جميع الصلاحيات في النظام',
        permissions: permissions,
      ),
      Role(
        id: 2,
        name: 'محاسب',
        description: 'يدير الفواتير والمصروفات والتقارير المالية',
        permissions: permissions.where((p) => 
          p.module == 'invoices' || 
          p.module == 'expenses' || 
          p.module == 'reports' ||
          p.module == 'clients'
        ).toList(),
      ),
      Role(
        id: 3,
        name: 'مستخدم',
        description: 'صلاحيات محدودة للعرض والقراءة',
        permissions: permissions.where((p) => 
          p.action == 'read' && 
          p.module != 'settings'
        ).toList(),
      ),
      Role(
        id: 4,
        name: 'مشرف',
        description: 'يدير المستخدمين والصلاحيات',
        permissions: permissions.where((p) => 
          p.module == 'users' || 
          p.action == 'read'
        ).toList(),
      ),
    ];
  }
}
