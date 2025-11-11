/// ثوابت الصلاحيات المستخدمة في ميزة الفواتير (Tax Invoices)
class InvoicesPermissions {
  // صلاحيات العرض
  static const String view = 'tax-invoices.view';
  
  // صلاحيات الإنشاء
  static const String create = 'tax-invoices.create';
  
  // صلاحيات التعديل
  static const String edit = 'tax-invoices.edit';
  
  // صلاحيات الحذف
  static const String delete = 'tax-invoices.delete';
  
  // صلاحيات الإرسال
  static const String send = 'tax-invoices.send';
  
  // صلاحيات إنشاء فاتورة دائنة
  static const String createCredit = 'tax-invoices.create-credit';
  
  // صلاحيات الفواتير المعلقة
  static const String pending = 'tax-invoices.pending';
  
  // صلاحيات الفواتير المرسلة
  static const String sent = 'tax-invoices.sent';
  
  // صلاحيات الفواتير المرتجعة
  static const String returned = 'tax-invoices.returned';
  
  // صلاحيات الطباعة
  static const String print = 'tax-invoices.print';
  
  // صلاحيات البلوتوث
  static const String bluetooth = 'tax-invoices.bluetooth';

  // جميع الصلاحيات
  static const List<String> all = [
    view,
    create,
    edit,
    delete,
    send,
    createCredit,
    pending,
    sent,
    returned,
    print,
    bluetooth,
  ];
}

