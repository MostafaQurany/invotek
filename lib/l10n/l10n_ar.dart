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

  @override
  String get products => 'المنتجات';

  @override
  String get onboardingOne => 'تابع فواتيرك كلها في مكان واحد';

  @override
  String get onboardingTwo => 'ما تنساش ولا فاتورة تاني';

  @override
  String get onboardingThree => 'ادفع وتابع كل حاجة في ثواني';

  @override
  String get onboardingOneDec =>
      'نظم فواتيرك الشهرية، وتابع مواعيد الدفع، من غير ورق ولا صداع.';

  @override
  String get onboardingTwoDec =>
      'يوصلك تنبيه قبل ميعاد الدفع، علشان تتجنب أي تأخير أو غرامات.';

  @override
  String get onboardingThreeDec =>
      'ادفع إلكترونيًا، واحفظ سجلاتك تلقائيًا لمراجعتها في أي وقت.';

  @override
  String get onboardingStartNow => 'ابدا الان';

  @override
  String get productsCategories => 'إدارة المنتجات وفئاتها';

  @override
  String get productsList => 'قائمة المنتجات';

  @override
  String get categoriesAppbar => 'فئات المنتجات';

  @override
  String get searchProducts => 'البحث في المنتجات...';

  @override
  String get category => 'الفئة';

  @override
  String get allCategories => 'جميع الفئات';

  @override
  String get allStatuses => 'جميع الحالات';

  @override
  String get outOfStock => 'نفدت الكمية';

  @override
  String get noProductsFound => 'لا توجد منتجات';

  @override
  String get viewDetails => 'عرض التفاصيل';

  @override
  String get editProduct => 'تعديل المنتج';

  @override
  String get deleteProduct => 'حذف المنتج';

  @override
  String deleteProductConfirmation(Object name) {
    return 'هل أنت متأكد من حذف المنتج \"$name\"؟';
  }

  @override
  String get quantity => 'الكمية';

  @override
  String get noName => 'بدون اسم';

  @override
  String get undefined => 'غير محدد';

  @override
  String get editCategory => 'تعديل الفئة';

  @override
  String get addCategory => 'إضافة فئة';

  @override
  String get name => 'الاسم';

  @override
  String get save => 'حفظ';

  @override
  String get categoryAddedSuccessfully => 'تم إضافة الفئة بنجاح';

  @override
  String get categoryUpdatedSuccessfully => 'تم تحديث الفئة بنجاح';

  @override
  String get categoryDeletedSuccessfully => 'تم حذف الفئة بنجاح';

  @override
  String get errorAddingCategory => 'خطأ في إضافة الفئة';

  @override
  String get errorUpdatingCategory => 'خطأ في تحديث الفئة';

  @override
  String get errorDeletingCategory => 'خطأ في حذف الفئة';

  @override
  String get basicInformation => 'معلومات أساسية';

  @override
  String get description => 'الوصف';

  @override
  String get price => 'السعر';

  @override
  String get sku => 'رمز المنتج';

  @override
  String get barcode => 'الباركود';

  @override
  String get weight => 'الوزن';

  @override
  String get dimensions => 'الأبعاد';

  @override
  String get inventorySettings => 'إعدادات المخزون';

  @override
  String get trackInventory => 'تتبع المخزون';

  @override
  String get lowStockAlert => 'تنبيه المخزون المنخفض';

  @override
  String get minimumQuantity => 'الكمية الدنيا';

  @override
  String get taxSettings => 'إعدادات الضريبة';

  @override
  String get hasTax => 'يخضع للضريبة';

  @override
  String get taxRate => 'نسبة الضريبة';

  @override
  String get additionalSettings => 'إعدادات إضافية';

  @override
  String get isActive => 'نشط';

  @override
  String get productAddedSuccessfully => 'تم إضافة المنتج بنجاح';

  @override
  String get productUpdatedSuccessfully => 'تم تحديث المنتج بنجاح';

  @override
  String get productDeletedSuccessfully => 'تم حذف المنتج بنجاح';

  @override
  String get errorAddingProduct => 'خطأ في إضافة المنتج';

  @override
  String get errorUpdatingProduct => 'خطأ في تحديث المنتج';

  @override
  String get errorDeletingProduct => 'خطأ في حذف المنتج';

  @override
  String get addProduct => 'إضافة منتج جديد';

  @override
  String get pricing => 'التسعير';

  @override
  String get sellingPrice => 'سعر البيع';

  @override
  String get costPrice => 'سعر التكلفة';

  @override
  String get inventory => 'المخزون';

  @override
  String get thisFieldIsRequired => 'هذا الحقل مطلوب';

  @override
  String get quantityMustBeAPositiveInteger =>
      'يجب أن تكون الكمية رقم صحيح غير سالب';

  @override
  String get unit => 'الوحدة';

  @override
  String get piece => 'قطعة';

  @override
  String get kilogram => 'كجم';

  @override
  String get meter => 'متر';

  @override
  String get invalidNumber => 'رقم غير صحيح';

  @override
  String get maximumQuantity => 'الحد الأقصى للكمية';

  @override
  String get productDetails => 'تفاصيل المنتج';

  @override
  String get productSku => 'رمز المنتج (SKU)';

  @override
  String get brand => 'العلامة التجارية';

  @override
  String get model => 'الموديل';

  @override
  String get color => 'اللون';

  @override
  String get material => 'المادة';

  @override
  String get centimeters => 'سم';

  @override
  String get additionalInformation => 'معلومات إضافية';

  @override
  String get notes => 'ملاحظات';

  @override
  String get productIsActive => 'المنتج نشط';

  @override
  String get enableDisableProduct => 'تفعيل/إلغاء تفعيل المنتج';

  @override
  String get productIsTaxable => 'يخضع للضريبة';

  @override
  String get applyTaxToProduct => 'تطبيق الضريبة على هذا المنتج';

  @override
  String get trackAvailableProductQuantity => 'تتبع الكمية المتوفرة من المنتج';

  @override
  String get selectCategory => 'إختار الفئة';
}
