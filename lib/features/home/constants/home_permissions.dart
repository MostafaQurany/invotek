/// ثوابت الصلاحيات المستخدمة في ميزة الرئيسية (Dashboard)
class HomePermissions {
  // صلاحيات العرض
  static const String view = 'dashboard.view';

  // صلاحيات الإعدادات
  static const String settings = 'dashboard.settings';

  // صلاحيات التقارير
  static const String reports = 'dashboard.reports';

  // جميع الصلاحيات
  static const List<String> all = [view, settings, reports];
}
