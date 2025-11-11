/// ثوابت الصلاحيات المستخدمة في ميزة المصروفات
class ExpensesPermissions {
  // صلاحيات العرض
  static const String view = 'expenses.view';
  
  // صلاحيات الإنشاء
  static const String create = 'expenses.create';
  
  // صلاحيات التعديل
  static const String edit = 'expenses.edit';
  
  // صلاحيات الحذف
  static const String delete = 'expenses.delete';
  
  // صلاحيات الموافقة
  static const String approve = 'expenses.approve';

  // جميع الصلاحيات
  static const List<String> all = [
    view,
    create,
    edit,
    delete,
    approve,
  ];
}

/// ثوابت الصلاحيات المستخدمة في ميزة فئات المصروفات
class ExpenseCategoriesPermissions {
  // صلاحيات العرض
  static const String view = 'expense-categories.view';
  
  // صلاحيات الإنشاء
  static const String create = 'expense-categories.create';
  
  // صلاحيات التعديل
  static const String edit = 'expense-categories.edit';
  
  // صلاحيات الحذف
  static const String delete = 'expense-categories.delete';

  // جميع الصلاحيات
  static const List<String> all = [
    view,
    create,
    edit,
    delete,
  ];
}

