// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class SAr extends S {
  SAr([String locale = 'ar']) : super(locale);

  @override
  String get welcome => 'مرحباً!';

  @override
  String get tekpart => 'تك بارت';

  @override
  String get password => 'كلمة المرور';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get alreadyHaveAnAccount => 'لديك حساب؟';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get register => 'التسجيل';

  @override
  String get confirmPassword => 'تأكيد كلمة المرور';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get dontHaveAnAccount => 'ليس لديك حساب؟';

  @override
  String get emailRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get emailInvalid => 'البريد الإلكتروني غير صحيح';

  @override
  String get passwordRequired => 'كلمة المرور مطلوبة';

  @override
  String get passwordShort => 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';

  @override
  String get passwordWeak =>
      'كلمة المرور يجب أن تحتوي على حرف كبير وحرف صغير ورقم';

  @override
  String get confirmPasswordRequired => 'تأكيد كلمة المرور مطلوب';

  @override
  String get passwordsNotMatch => 'كلمة المرور غير متطابقة';

  @override
  String get nameRequired => 'الاسم مطلوب';

  @override
  String get nameShort => 'الاسم يجب أن يكون حرفين على الأقل';

  @override
  String get nameInvalid => 'الاسم يجب أن يحتوي على أحرف فقط';

  @override
  String get validationError => 'يرجى التحقق من صحة البيانات المدخلة';

  @override
  String get networkError =>
      'خطأ في الاتصال بالإنترنت. يرجى التحقق من اتصالك والمحاولة مرة أخرى.';

  @override
  String get serverError => 'خطأ في الخادم. يرجى المحاولة لاحقاً.';

  @override
  String get authError =>
      'فشل في تسجيل الدخول. يرجى التحقق من البريد الإلكتروني وكلمة المرور.';

  @override
  String get unknownError => 'حدث خطأ غير معروف';

  @override
  String get loading => 'جاري التحميل...';

  @override
  String get loggingIn => 'تسجيل الدخول...';

  @override
  String get registering => 'التسجيل...';

  @override
  String get close => 'إغلاق';

  @override
  String get loginSuccess => 'تم تسجيل الدخول بنجاح';

  @override
  String get registerSuccess => 'تم التسجيل بنجاح! يرجى تسجيل الدخول.';

  @override
  String get usersPermissions => 'المستخدمين والصلاحيات';

  @override
  String get usersPermissionsDesc => 'التحكم في العملاء والصلاحيات';

  @override
  String get clientsProducts => 'العملاء والمنتجات';

  @override
  String get clientsProductsDesc => 'التحكم في العملاء والمنتجات';

  @override
  String get expenses => 'المصروفات';

  @override
  String get expensesDesc => 'فئات المصروفات وإدارة المصروفات';

  @override
  String get taxInvoices => 'الفواتير الضريبية';

  @override
  String get taxInvoicesDesc =>
      'الفواتير غير المعلنة والفواتير المدفوعة والفواتير المرتجعة وإنشاء فاتورة جديدة';

  @override
  String get loginSuccessfully => 'تم تسجيل الدخول بنجاح';

  @override
  String get rejesterSuccessfully => 'تم التسجيل بنجاح! يرجى تسجيل الدخول.';

  @override
  String get loginLoadin => 'التسجيل...';

  @override
  String get rejester => 'تسجيل الدخول';

  @override
  String get rejesterLoading => 'تسجيل الدخول...';

  @override
  String get haveAccountLogin => 'لديك حساب؟ تسجيل الدخول';

  @override
  String get noHaveAccountRejester => 'ليس لديك حساب؟ إنشاء حساب جديد';

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get signInWithGoogle => 'تسجيل الدخول بـ Google';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';

  @override
  String get notAMember => 'ليس عضوا؟';

  @override
  String get createAnAccount => 'إنشاء حساب';

  @override
  String get onboardingWelcome => 'مرحباً بك في Invotek';

  @override
  String get onboardingWelcomeDesc =>
      'نظام متكامل لإدارة الفواتير الإلكترونية مع التكامل مع نظام الفوترة الوطني الأردني';

  @override
  String get onboardingUsers => 'إدارة المستخدمين والصلاحيات';

  @override
  String get onboardingUsersDesc =>
      'تحكم كامل في المستخدمين وصلاحياتهم داخل الشركة';

  @override
  String get onboardingClients => 'إدارة العملاء والمنتجات';

  @override
  String get onboardingClientsDesc =>
      'إدارة شاملة للعملاء والمنتجات مع تتبع المخزون';

  @override
  String get onboardingExpenses => 'إدارة المصروفات';

  @override
  String get onboardingExpensesDesc =>
      'تتبع وإدارة المصروفات مع تصنيفات متعددة';

  @override
  String get onboardingInvoices => 'الفواتير الضريبية';

  @override
  String get onboardingInvoicesDesc =>
      'إنشاء وإدارة الفواتير الضريبية مع التكامل مع نظام فاتورة الوطني';

  @override
  String get next => 'التالي';

  @override
  String get previous => 'السابق';

  @override
  String get startNow => 'ابدأ الآن';

  @override
  String get chooseFeature => 'اختر الميزة التي تريد إدارتها';

  @override
  String get usersPermissionsTitle => 'المستخدمين والصلاحيات';

  @override
  String get clientsProductsTitle => 'العملاء والمنتجات';

  @override
  String get expensesTitle => 'المصروفات';

  @override
  String get taxInvoicesTitle => 'الفواتير الضريبية';

  @override
  String get logout => 'تسجيل الخروج';

  @override
  String get usersList => 'قائمة المستخدمين';

  @override
  String get addUser => 'إضافة مستخدم جديد';

  @override
  String get managePermissions => 'إدارة الصلاحيات';

  @override
  String get clientsList => 'قائمة العملاء';

  @override
  String get addClient => 'إضافة عميل جديد';

  @override
  String get manageProducts => 'إدارة المنتجات';

  @override
  String get productCategories => 'فئات المنتجات';

  @override
  String get expensesList => 'قائمة المصروفات';

  @override
  String get addExpense => 'إضافة مصروف جديد';

  @override
  String get expenseCategories => 'فئات المصروفات';

  @override
  String get invoicesList => 'قائمة الفواتير';

  @override
  String get createInvoice => 'إنشاء فاتورة جديدة';

  @override
  String get postedInvoices => 'الفواتير المعلنة';

  @override
  String get returnedInvoices => 'الفواتير المرتجعة';

  @override
  String get salesReport => 'تقرير المبيعات';

  @override
  String get expensesReport => 'تقرير المصروفات';

  @override
  String get customersReport => 'تقرير العملاء';

  @override
  String get productsReport => 'تقرير المنتجات';

  @override
  String get companySettings => 'إعدادات الشركة';

  @override
  String get systemSettings => 'إعدادات النظام';

  @override
  String get backup => 'النسخ الاحتياطي';

  @override
  String get userAddedSuccessfully => 'تم إضافة المستخدم بنجاح';

  @override
  String get errorCreatingUser => 'حدث خطأ أثناء إنشاء المستخدم: \$e';

  @override
  String get cancel => 'إلغاء';

  @override
  String get usersAndPermissionsManagement => 'إدارة المستخدمين والصلاحيات';

  @override
  String get usersAndPermissionsDescription =>
      'عرض وإدارة المستخدمين وصلاحياتهم';

  @override
  String get searchForUser => 'البحث عن مستخدم...';

  @override
  String get status => 'الحالة';

  @override
  String get role => 'الدور';

  @override
  String get all => 'الكل';

  @override
  String get active => 'نشط';

  @override
  String get inactive => 'غير نشط';

  @override
  String get admin => 'مدير';

  @override
  String get user => 'مستخدم';

  @override
  String get manager => 'مشرف';

  @override
  String get noUsersFound => 'لا يوجد مستخدمين';

  @override
  String get addNewUserMessage => 'اضغط على زر الإضافة لإنشاء مستخدم جديد';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get deleteConfirmation => 'تأكيد الحذف';

  @override
  String deleteUserConfirmation(Object name) {
    return 'هل أنت متأكد من حذف المستخدم $name؟';
  }

  @override
  String get delete => 'حذف';

  @override
  String get fillTheFormBelowToAddANewUserTo =>
      'املأ النموذج أدناه لإضافة مستخدم جديد للنظام';

  @override
  String get addANewUser => 'إضافة مستخدم جديد';

  @override
  String get state => 'الحالة';

  @override
  String get rule => 'الدور';

  @override
  String get userSettings => 'إعدادات المستخدم';

  @override
  String get personalInformation => 'المعلومات الشخصية';

  @override
  String get securityInformation => 'معلومات الأمان';

  @override
  String get enterFullName => 'أدخل الاسم الكامل';

  @override
  String get enterEmail => 'أدخل البريد الإلكتروني';

  @override
  String get enterPhoneNumber => 'أدخل رقم الهاتف';

  @override
  String get enterPassword => 'أدخل كلمة المرور';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get noDataReceived => 'لم يتم استلام بيانات من الخادم';

  @override
  String get errorLoadingUsers => 'خطأ في تحميل المستخدمين';

  @override
  String get userNotFound => 'المستخدم غير موجود';

  @override
  String get failedToUpdateUser => 'فشل في تحديث المستخدم';

  @override
  String get errorDeletingUser => 'خطأ في حذف المستخدم';

  @override
  String get errorParsingUserData => 'خطأ في معالجة بيانات المستخدم';

  @override
  String get userCreatedSuccessfully => 'تم إنشاء المستخدم بنجاح';

  @override
  String get userUpdatedSuccessfully => 'تم تحديث المستخدم بنجاح';

  @override
  String get userDeletedSuccessfully => 'تم حذف المستخدم بنجاح';
}
