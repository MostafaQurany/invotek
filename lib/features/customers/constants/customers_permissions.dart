/// ثوابت الصلاحيات المستخدمة في ميزة العملاء
class CustomersPermissions {
  // صلاحيات العرض
  static const String view = 'customers.view';
  
  // صلاحيات الإنشاء
  static const String create = 'customers.create';
  
  // صلاحيات التعديل
  static const String edit = 'customers.edit';
  
  // صلاحيات الحذف
  static const String delete = 'customers.delete';

  // جميع الصلاحيات
  static const List<String> all = [
    view,
    create,
    edit,
    delete,
  ];
}

