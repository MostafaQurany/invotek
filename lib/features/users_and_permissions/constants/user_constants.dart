class UserConstants {
  // User Roles
  static const List<String> roles = ['مدير', 'محاسب', 'مستخدم', 'مشرف'];

  // User Statuses
  static const List<String> statuses = ['نشط', 'غير نشط'];

  // Default Values
  static const String defaultRole = 'مستخدم';
  static const String defaultStatus = 'نشط';

  // Status Mappings
  static const Map<String, String> statusMapping = {
    'نشط': 'active',
    'غير نشط': 'inactive',
  };
}
