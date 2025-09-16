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
  String get unknownError => 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.';

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
  String get english => 'الإنجليزية';

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
  String get addUser => 'إضافة مستخدم';

  @override
  String get managePermissions => 'إدارة الصلاحيات';

  @override
  String get clientsList => 'قائمة العملاء';

  @override
  String get addClient => 'إضافة العميل';

  @override
  String get manageProducts => 'إدارة المنتجات';

  @override
  String get productCategories => 'فئات المنتجات';

  @override
  String get expensesList => 'قائمة المصروفات';

  @override
  String get addExpense => 'إضافة مصروف';

  @override
  String get expenseCategories => 'فئات المصروفات';

  @override
  String get invoicesList => 'قائمة الفواتير';

  @override
  String get createInvoice => 'إنشاء فاتورة';

  @override
  String get postedInvoices => 'الفواتير المعلنة';

  @override
  String get returnedInvoices => 'الفواتير المرتجعة';

  @override
  String get salesReport => 'تقرير المبيعات';

  @override
  String get expensesReport => 'تقرير المصروفات';

  @override
  String get newExpense => 'مصروف جديد';

  @override
  String get trackYourBusinessExpenses => 'تتبع مصروفات عملك';

  @override
  String get basicInformation => 'المعلومات الأساسية';

  @override
  String get expenseTitle => 'عنوان المصروف';

  @override
  String get expenseTitleHint => 'مثال: مستلزمات مكتبية، مصروفات سفر';

  @override
  String get titleIsRequired => 'العنوان مطلوب';

  @override
  String get description => 'الوصف';

  @override
  String get descriptionHint => 'أضف المزيد من التفاصيل حول هذا المصروف';

  @override
  String get financialDetails => 'التفاصيل المالية';

  @override
  String get amount => 'المبلغ';

  @override
  String get amountHint => '0.00';

  @override
  String get amountHelperText => 'أدخل إجمالي المبلغ المنفق بما في ذلك الضرائب';

  @override
  String get amountIsRequired => 'المبلغ مطلوب';

  @override
  String get pleaseEnterValidAmount => 'يرجى إدخال مبلغ صحيح';

  @override
  String get additionalInformation => 'معلومات إضافية';

  @override
  String get referenceNumber => 'رقم المرجع';

  @override
  String get referenceNumberHint => 'رقم الفاتورة، معرف الإيصال، إلخ';

  @override
  String get notes => 'ملاحظات';

  @override
  String get notesHint => 'أي معلومات إضافية أو سياق';

  @override
  String get createExpense => 'إنشاء مصروف';

  @override
  String get expenseCreatedSuccessfully => 'تم إنشاء المصروف بنجاح!';

  @override
  String get pleaseSelectCategory => 'يرجى اختيار فئة';

  @override
  String get completeRequiredFields => 'أكمل الحقول المطلوبة';

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
  String deleteUserConfirmation(String name) {
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
  String get productsCategories => 'المنتجات';

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
  String get editProduct => 'تعديل منتج';

  @override
  String get deleteProduct => 'حذف منتج';

  @override
  String deleteProductConfirmation(String name) {
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
  String get errorUpdatingProduct => 'حدث خطأ أثناء تحديث المنتج';

  @override
  String get errorDeletingProduct => 'خطأ في حذف المنتج';

  @override
  String get addProduct => 'إضافة منتج';

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

  @override
  String get exitAppConfirmation => 'إغلاق التطبيق';

  @override
  String get exitAppConfirmationMessage => 'هل أنت متأكد من إغلاق التطبيق؟';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get apply => 'تطبيق';

  @override
  String get noCustomersFound => 'لا يوجد عملاء';

  @override
  String get noCustomersFoundMessage => 'اضغط على زر الإضافة لإنشاء عميل جديد';

  @override
  String get customersList => 'قائمة العملاء';

  @override
  String get addCustomer => 'إضافة عميل';

  @override
  String get editCustomer => 'تعديل العميل';

  @override
  String get deleteCustomer => 'حذف العميل';

  @override
  String get customerDetails => 'تفاصيل العميل';

  @override
  String get customerName => 'اسم العميل';

  @override
  String get customerNameRequired => 'اسم العميل مطلوب';

  @override
  String get customerEmail => 'البريد الإلكتروني';

  @override
  String get customerPhone => 'رقم الهاتف';

  @override
  String get customerAddress => 'العنوان';

  @override
  String get customerTaxNumber => 'الرقم الضريبي';

  @override
  String get customerNotes => 'ملاحظات';

  @override
  String get customerStatus => 'الحالة';

  @override
  String get customerStatusActive => 'نشط';

  @override
  String get customerStatusInactive => 'غير نشط';

  @override
  String get customerBasicInfo => 'معلومات العميل';

  @override
  String get customerBasicInfoSection => 'المعلومات الأساسية';

  @override
  String get customerCompanyName => 'اسم الشركة/المؤسسة';

  @override
  String get customerPhoneRequired => 'رقم الهاتف مطلوب';

  @override
  String get customerCommercialRegister => 'رقم السجل التجاري';

  @override
  String get customerCity => 'المدينة';

  @override
  String get customerRegion => 'المنطقة/المحافظة';

  @override
  String get customerPostalCode => 'الرمز البريدي';

  @override
  String get customerDetailedAddress => 'العنوان التفصيلي';

  @override
  String get customerAdditionalInfo => 'معلومات إضافية';

  @override
  String get customerResponsiblePerson => 'الشخص المسؤول';

  @override
  String customerCreatedSuccessfully(Object name) {
    return 'تم إنشاء العميل \"$name\" بنجاح';
  }

  @override
  String customerUpdatedSuccessfully(Object name) {
    return 'تم تحديث العميل \"$name\" بنجاح';
  }

  @override
  String get customerDeletedSuccessfully => 'تم حذف العميل بنجاح';

  @override
  String get confirmDeleteCustomer => 'تأكيد الحذف';

  @override
  String confirmDeleteCustomerMessage(Object name) {
    return 'هل أنت متأكد من حذف العميل \"$name\"?';
  }

  @override
  String get view => 'عرض';

  @override
  String get edit => 'تعديل';

  @override
  String get addNewCustomer => 'إضافة عميل جديد';

  @override
  String errorOccurred(Object error) {
    return 'حدث خطأ: $error';
  }

  @override
  String get searchCustomers => 'البحث في العملاء...';

  @override
  String get company => 'الشركة';

  @override
  String get clearFilters => 'مسح المرشحات';

  @override
  String get customers => 'العملاء';

  @override
  String get help => 'مساعدة';

  @override
  String get formHelpTitle => 'نموذج تعديل العميل';

  @override
  String get formHelpDescription =>
      'هذا النموذج مقسم إلى ثلاث خطوات:\n\n1. المعلومات الأساسية\n2. معلومات العنوان\n3. المعلومات الإضافية';

  @override
  String get addressInformation => 'معلومات العنوان';

  @override
  String get contactInfo => 'معلومات الاتصال';

  @override
  String get statusInfo => 'معلومات الحالة';

  @override
  String get createdDate => 'تاريخ الإنشاء';

  @override
  String get lastUpdated => 'آخر تحديث';

  @override
  String get confirmDelete => 'تأكيد الحذف';

  @override
  String deleteCustomerConfirmation(Object name) {
    return 'هل أنت متأكد من حذف العميل \"$name\"؟';
  }

  @override
  String get copy => 'نسخ';

  @override
  String get customerDataCopied => 'تم نسخ بيانات العميل إلى الحافظة';

  @override
  String get addExpenseHelp => 'مساعدة في إضافة المصروف';

  @override
  String get addExpenseHelpDescription =>
      'يسمح لك هذا الشاشة بإنشاء وتتبع المصروفات التجارية. هذا ما يمكنك فعله:';

  @override
  String get enterExpenseTitleAndDescription => 'أدخل عنوان المصروف والوصف';

  @override
  String get setAmountDateAndPaymentMethod =>
      'ضبط المبلغ، التاريخ، وطريقة الدفع';

  @override
  String get selectAppropriateExpenseCategory =>
      'اختيار الفئة المناسبة للمصروف';

  @override
  String get addReferenceNumberAndNotes => 'إضافة رقم المرجع والملاحظات';

  @override
  String get gotIt => 'فهمت!';

  @override
  String get categorization => 'التصنيف';

  @override
  String get additionalInfo => 'معلومات إضافية';

  @override
  String get create => 'إنشاء';

  @override
  String get expenseDate => 'تاريخ المصروف';

  @override
  String get selectTheDateThisExpenseOccurred =>
      'اختر التاريخ الذي حدث فيه المصروف';

  @override
  String get paymentMethod => 'طريقة الدفع';

  @override
  String get cash => 'نقدي';

  @override
  String get creditCard => 'بطاقة ائتمان';

  @override
  String get debitCard => 'بطاقة ائتمان';

  @override
  String get bankTransfer => 'تحويل بنكي';

  @override
  String get check => 'شيك';

  @override
  String get other => 'أخرى';

  @override
  String get somethingWentWrong => 'حدث خطأ';

  @override
  String get tryAgain => 'إعادة المحاولة';

  @override
  String get loadingMore => 'جاري تحميل المزيد...';

  @override
  String get loadingExpenses => 'جاري تحميل المصروفات...';

  @override
  String get categories => 'الفئات';

  @override
  String get expenseDetails => 'تفاصيل المصروف';

  @override
  String get title => 'العنوان';

  @override
  String get date => 'التاريخ';

  @override
  String get financialInformation => 'المعلومات المالية';

  @override
  String get paymentInformation => 'معلومات الدفع';

  @override
  String get metadata => 'البيانات الوصفية';

  @override
  String get createdBy => 'أنشأ بواسطة';

  @override
  String get createdAt => 'تاريخ الإنشاء';

  @override
  String get updatedAt => 'تاريخ التحديث';

  @override
  String get expenseUpdatedSuccessfully => 'تم تحديث المصروف بنجاح';

  @override
  String get editExpense => 'تعديل مصروف';

  @override
  String get addNewExpenseCategory => 'إضافة فئة مصروفات جديدة';

  @override
  String get backToCategories => 'العودة للفئات';

  @override
  String get newCategoryDetails => 'بيانات الفئة الجديدة';

  @override
  String get categoryName => 'اسم الفئة';

  @override
  String get categoryNameRequired => 'اسم الفئة مطلوب';

  @override
  String get enterCategoryName => 'أدخل اسم الفئة';

  @override
  String get categoryDescription => 'وصف الفئة';

  @override
  String get enterCategoryDescription => 'أدخل وصفاً مختصراً للفئة';

  @override
  String get icon => 'الأيقونة';

  @override
  String get categoryPreview => 'معاينة الفئة';

  @override
  String get saveCategory => 'حفظ الفئة';

  @override
  String get saving => 'جاري الحفظ...';

  @override
  String get editExpenseCategory => 'تعديل فئة المصروفات';

  @override
  String get updateCategory => 'تحديث الفئة';

  @override
  String get categoryCreatedSuccessfully => 'تم إنشاء الفئة بنجاح';

  @override
  String get noCategoriesFound => 'لا توجد فئات';

  @override
  String get createYourFirstExpenseCategory => 'إنشاء فئة مصروفات جديدة';

  @override
  String get errorLoadingCategories => 'خطأ في تحميل الفئات';

  @override
  String get deleteAllCategories => 'حذف جميع الفئات';

  @override
  String get deleteCategory => 'حذف الفئة';

  @override
  String deleteCategoryConfirmation(String name) {
    return 'هل أنت متأكد من حذف الفئة \"$name\"؟';
  }

  @override
  String errorMessage(String error) {
    return 'حدث خطأ: $error';
  }

  @override
  String statusCategory(String status) {
    return 'الحالة: $status';
  }

  @override
  String get settings => 'الإعدادات';

  @override
  String get companyName => 'اسم الشركة';

  @override
  String get companyEmail => 'بريد الشركة';

  @override
  String get companyPhone => 'هاتف الشركة';

  @override
  String get companyAddress => 'عنوان الشركة';

  @override
  String get language => 'اللغة';

  @override
  String get darkMode => 'الوضع الداكن';

  @override
  String get enableDarkMode => 'تفعيل الوضع الداكن';

  @override
  String get notifications => 'الإشعارات';

  @override
  String get receiveNotifications => 'تلقي الإشعارات';

  @override
  String get appInfo => 'معلومات التطبيق';

  @override
  String get home => 'الرئيسية';

  @override
  String get usersManagement => 'المستخدمين والصلاحيات';

  @override
  String get customersManagement => 'العملاء';

  @override
  String get productsCategoriesManagement => 'المنتجات وفئاتها';

  @override
  String get expensesManagement => 'إدارة المصروفات وفئاتها';

  @override
  String get supportEmail => 'البريد الإلكتروني للدعم';

  @override
  String get website => 'الموقع الإلكتروني';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get termsOfUse => 'شروط الاستخدام';

  @override
  String get saveSettings => 'حفظ الإعدادات';

  @override
  String get savingSettings => 'جاري حفظ الإعدادات...';

  @override
  String get settingsSavedSuccessfully => 'تم حفظ الإعدادات بنجاح';

  @override
  String get companyNameRequired => 'اسم الشركة مطلوب';

  @override
  String get companyEmailRequired => 'بريد الشركة مطلوب';

  @override
  String get companyEmailInvalid => 'بريد الشركة غير صحيح';

  @override
  String get companyPhoneRequired => 'هاتف الشركة مطلوب';

  @override
  String get companyAddressRequired => 'عنوان الشركة مطلوب';

  @override
  String get enterCompanyName => 'أدخل اسم الشركة';

  @override
  String get enterCompanyEmail => 'أدخل بريد الشركة';

  @override
  String get enterCompanyPhone => 'أدخل هاتف الشركة';

  @override
  String get enterCompanyAddress => 'أدخل عنوان الشركة';

  @override
  String get languageChangedToArabic => 'تم تغيير اللغة إلى العربية';

  @override
  String get languageChangedToEnglish => 'Language changed to English';

  @override
  String get darkModeEnabled => 'تم تفعيل الوضع الداكن';

  @override
  String get darkModeDisabled => 'تم إلغاء تفعيل الوضع الداكن';

  @override
  String get notificationsEnabled => 'تم تفعيل الإشعارات';

  @override
  String get notificationsDisabled => 'تم إلغاء تفعيل الإشعارات';

  @override
  String get or => 'أو';

  @override
  String get reports => 'التقارير';

  @override
  String get userManagement => 'إدارة المستخدمين';

  @override
  String get permissionsManagement => 'إدارة الصلاحيات';

  @override
  String get clientsManagement => 'إدارة العملاء';

  @override
  String get productsManagement => 'إدارة المنتجات وفئاتها';

  @override
  String get welcomeToInvotek => 'مرحباً بك في تطبيق Invotek';

  @override
  String get manageInvoicesAndCustomers => 'إدارة الفواتير والعملاء بسهولة';

  @override
  String get quickActions => 'الإجراءات السريعة';

  @override
  String get manageCustomers => 'إدارة العملاء';

  @override
  String get addAndEditCustomers => 'إضافة وتعديل وحذف العملاء';

  @override
  String get manageInvoices => 'إدارة الفواتير';

  @override
  String get createAndEditInvoices => 'إنشاء وتعديل الفواتير';

  @override
  String get viewReportsAndStatistics => 'عرض التقارير والإحصائيات';

  @override
  String get createNewInvoice => 'إنشاء فاتورة جديدة';

  @override
  String get viewAllInvoices => 'عرض جميع الفواتير';

  @override
  String get deviceInfo => 'معلومات الجهاز';

  @override
  String get screenDimensionsAndPerformance => 'أبعاد الشاشة والأداء';

  @override
  String get deviceType => 'نوع الجهاز';

  @override
  String get tablet => 'تابلت';

  @override
  String get phone => 'هاتف';

  @override
  String get themeDemo => 'تجربة الثيمات';

  @override
  String get themeInfo => 'معلومات الثيم';

  @override
  String get type => 'النوع';

  @override
  String get dark => 'داكن';

  @override
  String get light => 'فاتح';

  @override
  String get screenDimensions => 'أبعاد الشاشة';

  @override
  String get textStyles => 'أنماط النصوص';

  @override
  String get mainTitle => 'عنوان رئيسي';

  @override
  String get subTitle => 'عنوان فرعي';

  @override
  String get normalText => 'نص عادي';

  @override
  String get smallText => 'نص صغير';

  @override
  String get link => 'رابط';

  @override
  String get errorText => 'نص خطأ';

  @override
  String get successText => 'نص نجاح';

  @override
  String get buttons => 'الأزرار';

  @override
  String get normalButton => 'زر عادي';

  @override
  String get outlinedButton => 'زر مخطط';

  @override
  String get loadingButton => 'زر تحميل';

  @override
  String get inputFields => 'حقول الإدخال';

  @override
  String get username => 'اسم المستخدم';

  @override
  String get enterUsername => 'أدخل اسم المستخدم';

  @override
  String get cards => 'البطاقات';

  @override
  String get interactiveCard => 'بطاقة تفاعلية';

  @override
  String get interactiveCardDescription => 'هذه بطاقة تفاعلية يمكن الضغط عليها';

  @override
  String get loadingCard => 'بطاقة تحميل';

  @override
  String get responsiveTexts => 'النصوص المتجاوبة';

  @override
  String get smallResponsiveText => 'نص متجاوب صغير';

  @override
  String get mediumResponsiveText => 'نص متجاوب متوسط';

  @override
  String get largeResponsiveText => 'نص متجاوب كبير';

  @override
  String get buttonPressed => 'تم الضغط على الزر العادي';

  @override
  String get outlinedButtonPressed => 'تم الضغط على الزر المخطط';

  @override
  String get cardPressed => 'تم الضغط على البطاقة';

  @override
  String calling(Object phone) {
    return 'جاري الاتصال بـ $phone';
  }

  @override
  String openingEmail(Object email) {
    return 'جاري فتح البريد الإلكتروني إلى $email';
  }

  @override
  String viewingInvoices(Object name) {
    return 'عرض الفواتير لـ $name';
  }

  @override
  String viewingOrders(Object name) {
    return 'عرض الطلبات لـ $name';
  }

  @override
  String get copiedToClipboard => 'تم النسخ إلى الحافظة';

  @override
  String get openingMap => 'جاري فتح الخريطة';

  @override
  String get ok => 'موافق';

  @override
  String get phoneNumberInvalid => 'رقم الهاتف غير صحيح';

  @override
  String get advancedTechCompany => 'شركة التقنية المتقدمة';

  @override
  String get financialServicesInstitution => 'مؤسسة الخدمات المالية';

  @override
  String get constructionDevelopmentCompany => 'شركة البناء والتطوير';

  @override
  String get modernEducationInstitution => 'مؤسسة التعليم الحديث';

  @override
  String get tourismEntertainmentCompany => 'شركة السياحة والترفيه';

  @override
  String get healthcareInstitution => 'مؤسسة الرعاية الصحية';

  @override
  String get transportLogisticsCompany => 'شركة النقل واللوجستيات';

  @override
  String get ecommerceInstitution => 'مؤسسة التجارة الإلكترونية';

  @override
  String get productHelp => 'مساعدة المنتج';

  @override
  String get fillAllRequiredFields => 'يرجى ملء جميع الحقول المطلوبة';

  @override
  String get productNameRequired => 'اسم المنتج مطلوب';

  @override
  String get productPriceRequired => 'سعر المنتج مطلوب';

  @override
  String get productQuantityRequired => 'كمية المنتج مطلوبة';

  @override
  String get enterValidQuantity => 'يرجى إدخال كمية صحيحة';

  @override
  String get add => 'إضافة';

  @override
  String get update => 'تحديث';

  @override
  String areYouSureDelete(Object name) {
    return 'هل أنت متأكد من حذف \"$name\"؟';
  }

  @override
  String get errorLoadingProducts => 'حدث خطأ أثناء تحميل المنتجات';

  @override
  String get errorLoadingProduct => 'حدث خطأ أثناء تحميل بيانات المنتج';

  @override
  String get errorCreatingProduct => 'حدث خطأ أثناء إنشاء المنتج';

  @override
  String get noCategoriesToDelete => 'لا توجد فئات للحذف';

  @override
  String get allCategoriesDeletedSuccessfully => 'تم حذف جميع الفئات بنجاح';

  @override
  String get allStatus => 'جميع الحالات';

  @override
  String get passwordChangedSuccessfully => 'تم تغيير كلمة المرور بنجاح';

  @override
  String get operationCompletedSuccessfully => 'تم إكمال العملية بنجاح';

  @override
  String get editUser => 'تعديل مستخدم';

  @override
  String get addNewRole => 'إضافة دور جديد';

  @override
  String get editRole => 'تعديل الدور';

  @override
  String get noEmail => 'بدون بريد إلكتروني';

  @override
  String get noRole => 'بدون دور';

  @override
  String get accountant => 'محاسب';

  @override
  String get supervisor => 'مشرف';

  @override
  String failedToLoadRoles(Object error) {
    return 'فشل في تحميل الأدوار والصلاحيات: $error';
  }

  @override
  String failedToLoadUserPermissions(Object error) {
    return 'فشل في تحميل صلاحيات المستخدم: $error';
  }

  @override
  String failedToAddRole(Object error) {
    return 'فشل في إضافة الدور: $error';
  }

  @override
  String failedToUpdateRole(Object error) {
    return 'فشل في تحديث الدور: $error';
  }

  @override
  String failedToDeleteRole(Object error) {
    return 'فشل في حذف الدور: $error';
  }

  @override
  String failedToUpdateUserPermissions(Object error) {
    return 'فشل في تحديث صلاحيات المستخدم: $error';
  }

  @override
  String get viewUsers => 'عرض المستخدمين';

  @override
  String get pageNotFound => 'صفحة غير موجودة';

  @override
  String get requestedPageNotFound => 'الصفحة المطلوبة غير موجودة';

  @override
  String get cannotOpenEmailApp => 'لا يمكن فتح تطبيق البريد الإلكتروني';

  @override
  String get cannotOpenWebsite => 'لا يمكن فتح الموقع الإلكتروني';

  @override
  String get privacyPolicyComingSoon => 'سياسة الخصوصية قريباً';

  @override
  String get termsOfUseComingSoon => 'شروط الاستخدام قريباً';

  @override
  String appVersionWithBuild(Object build, Object version) {
    return 'الإصدار $version (Build $build)';
  }

  @override
  String get contactUsForSupport => 'تواصل معنا للحصول على المساعدة';

  @override
  String get visitInvotekWebsite => 'زيارة موقع إنفوتك';

  @override
  String get viewPrivacyPolicy => 'اطلع على سياسة الخصوصية';

  @override
  String get viewTermsOfUse => 'اطلع على شروط الاستخدام';

  @override
  String get welcomeToInvotekApp => 'مرحباً بك في تطبيق Invotek';

  @override
  String get easyInvoiceCustomerManagement => 'إدارة الفواتير والعملاء بسهولة';

  @override
  String get customerManagement => 'إدارة العملاء';

  @override
  String get addEditDeleteCustomers => 'إضافة وتعديل وحذف العملاء';

  @override
  String get invoiceManagement => 'إدارة الفواتير';

  @override
  String get createEditInvoices => 'إنشاء وتعديل الفواتير';

  @override
  String get viewReportsStatistics => 'عرض التقارير والإحصائيات';

  @override
  String get quickActionsTitle => 'إجراءات سريعة';

  @override
  String get screenDimensionsPerformance => 'أبعاد الشاشة والأداء';

  @override
  String get enterProductName => 'أدخل اسم المنتج';

  @override
  String get enterProductDescription => 'أدخل وصف المنتج';

  @override
  String get enterQuantity => 'أدخل الكمية';

  @override
  String get pieceKgMeter => 'قطعة، كيلو، متر...';

  @override
  String get enterProductSku => 'أدخل رمز المنتج';

  @override
  String get enterBarcode => 'أدخل الباركود';

  @override
  String get enterSellingPrice => 'أدخل سعر البيع';

  @override
  String get enterCostPrice => 'أدخل سعر التكلفة';

  @override
  String get enterTaxRatePercentage => 'أدخل نسبة الضريبة';

  @override
  String get enterResponsiblePerson => 'أدخل الشخص المسؤول';

  @override
  String get enterNotes => 'أدخل الملاحظات';

  @override
  String get exampleEmail => 'example@email.com';

  @override
  String get examplePhone => '0500000000';

  @override
  String get enterCity => 'أدخل المدينة';

  @override
  String get enterRegion => 'أدخل المنطقة';

  @override
  String get enterPostalCode => 'أدخل الرمز البريدي';

  @override
  String get enterAddress => 'أدخل عنوان العميل';

  @override
  String get enterDetailedAddress => 'أدخل العنوان التفصيلي';

  @override
  String get enterCustomerName => 'أدخل اسم العميل';

  @override
  String get enterEmailAddress => 'أدخل عنوان البريد الإلكتروني';

  @override
  String get enterTaxNumber => 'أدخل الرقم الضريبي';

  @override
  String get enterCommercialRegister => 'أدخل السجل التجاري';

  @override
  String get enterClientName => 'أدخل اسم العميل';

  @override
  String get enterClientEmail => 'أدخل البريد الإلكتروني';

  @override
  String get enterClientPhone => 'أدخل رقم الهاتف';

  @override
  String get enterClientAddress => 'أدخل عنوان العميل';

  @override
  String get enterClientCompany => 'أدخل اسم الشركة';

  @override
  String areYouSureDeleteClient(Object name) {
    return 'هل أنت متأكد من حذف العميل \"$name\"؟';
  }

  @override
  String get clientUpdatedSuccessfully => 'تم تحديث العميل بنجاح';

  @override
  String get clientAddedSuccessfully => 'تم إضافة العميل بنجاح';

  @override
  String get clientDetails => 'تفاصيل العميل';

  @override
  String get editClient => 'تعديل العميل';

  @override
  String get addNewClient => 'إضافة عميل جديد';

  @override
  String get department => 'القسم';

  @override
  String get emailAddress => 'عنوان البريد الإلكتروني';

  @override
  String get userId => 'معرف المستخدم';

  @override
  String get viewUserDetails => 'عرض تفاصيل المستخدم';

  @override
  String get editUserInformation => 'تعديل معلومات المستخدم';

  @override
  String get deleteUserPermanently => 'حذف المستخدم نهائياً';

  @override
  String get paidInvoices => '8 مدفوعة';

  @override
  String get totalAmount => '15,420 ريال';

  @override
  String get thisMonth => 'هذا الشهر';

  @override
  String get boughtThis => 'تم شراؤها';

  @override
  String get available => 'متوفر';

  @override
  String get productManagement => 'إدارة المنتجات';

  @override
  String get expenseManagement => 'إدارة المصروفات';

  @override
  String get systemAccess => 'الوصول للنظام';

  @override
  String get viewUsersDescription => 'إمكانية عرض قائمة المستخدمين';

  @override
  String get addUserDescription => 'إمكانية إضافة مستخدم جديد';

  @override
  String get editUserDescription => 'إمكانية تعديل بيانات المستخدم';

  @override
  String get deleteUser => 'حذف مستخدم';

  @override
  String get deleteUserDescription => 'إمكانية حذف المستخدم';

  @override
  String get managePermissionsDescription => 'إمكانية إدارة صلاحيات المستخدمين';

  @override
  String get viewClients => 'عرض العملاء';

  @override
  String get viewClientsDescription => 'إمكانية عرض قائمة العملاء';

  @override
  String get addClientDescription => 'إمكانية إضافة عميل جديد';

  @override
  String get editClientDescription => 'إمكانية تعديل بيانات العميل';

  @override
  String get deleteClient => 'حذف عميل';

  @override
  String get deleteClientDescription => 'إمكانية حذف العميل';

  @override
  String get viewProducts => 'عرض المنتجات';

  @override
  String get viewProductsDescription => 'إمكانية عرض قائمة المنتجات';

  @override
  String get addProductDescription => 'إمكانية إضافة منتج جديد';

  @override
  String get editProductDescription => 'إمكانية تعديل بيانات المنتج';

  @override
  String get deleteProductDescription => 'إمكانية حذف المنتج';

  @override
  String get viewInvoices => 'عرض الفواتير';

  @override
  String get viewInvoicesDescription => 'إمكانية عرض قائمة الفواتير';

  @override
  String get createInvoiceDescription => 'إمكانية إنشاء فاتورة جديدة';

  @override
  String get editInvoice => 'تعديل فاتورة';

  @override
  String get editInvoiceDescription => 'إمكانية تعديل الفاتورة';

  @override
  String get deleteInvoice => 'حذف فاتورة';

  @override
  String get deleteInvoiceDescription => 'إمكانية حذف الفاتورة';

  @override
  String get sendInvoice => 'إرسال فاتورة';

  @override
  String get sendInvoiceDescription => 'إمكانية إرسال الفاتورة للعميل';

  @override
  String get viewExpenses => 'عرض المصروفات';

  @override
  String get viewExpensesDescription => 'إمكانية عرض قائمة المصروفات';

  @override
  String get addExpenseDescription => 'إمكانية إضافة مصروف جديد';

  @override
  String get editExpenseDescription => 'إمكانية تعديل المصروف';

  @override
  String get deleteExpense => 'حذف مصروف';

  @override
  String get deleteExpenseDescription => 'إمكانية حذف المصروف';

  @override
  String get viewReports => 'عرض التقارير';

  @override
  String get viewReportsDescription => 'إمكانية عرض التقارير';

  @override
  String get exportReports => 'تصدير التقارير';

  @override
  String get exportReportsDescription => 'إمكانية تصدير التقارير';

  @override
  String get companySettingsDescription => 'إمكانية تعديل إعدادات الشركة';

  @override
  String get systemSettingsDescription => 'إمكانية تعديل إعدادات النظام';

  @override
  String get systemAdministrator => 'مدير النظام';

  @override
  String get systemAdministratorDescription => 'لديه جميع الصلاحيات في النظام';

  @override
  String get accountantDescription =>
      'يدير الفواتير والمصروفات والتقارير المالية';

  @override
  String get userDescription => 'صلاحيات محدودة للعرض والقراءة';

  @override
  String get supervisorDescription => 'يدير المستخدمين والصلاحيات';

  @override
  String get searchInClients => 'البحث في العملاء...';

  @override
  String get noClients => 'لا توجد عملاء';

  @override
  String get pressAddToCreateClient => 'اضغط على زر الإضافة لإنشاء عميل جديد';

  @override
  String get address => 'العنوان';

  @override
  String get companyInformation => 'معلومات الشركة';

  @override
  String get taxNumber => 'الرقم الضريبي';

  @override
  String get contactPersonInformation => 'معلومات شخص الاتصال';

  @override
  String get contactPersonName => 'اسم شخص الاتصال';

  @override
  String get contactPersonPhone => 'هاتف شخص الاتصال';

  @override
  String get contactPersonEmail => 'بريد شخص الاتصال';

  @override
  String get creationDate => 'تاريخ الإنشاء';

  @override
  String get clientName => 'اسم العميل';

  @override
  String get enterWebsite => 'أدخل الموقع الإلكتروني';

  @override
  String get enterContactPersonName => 'أدخل اسم شخص الاتصال';

  @override
  String get enterContactPersonPhone => 'أدخل هاتف شخص الاتصال';

  @override
  String get enterContactPersonEmail => 'أدخل بريد شخص الاتصال';

  @override
  String get enterAdditionalNotes => 'أدخل ملاحظات إضافية';

  @override
  String editClientData(Object name) {
    return 'قم بتعديل بيانات العميل \"$name\"';
  }

  @override
  String get saveChanges => 'حفظ التعديلات';

  @override
  String errorUpdatingClient(Object error) {
    return 'حدث خطأ أثناء تحديث العميل: $error';
  }

  @override
  String get fillFormToAddClient =>
      'املأ النموذج أدناه لإضافة عميل جديد للنظام';

  @override
  String errorCreatingClient(Object error) {
    return 'حدث خطأ أثناء إنشاء العميل: $error';
  }

  @override
  String errorLoadingClients(Object error) {
    return 'حدث خطأ أثناء تحميل العملاء: $error';
  }

  @override
  String errorDeletingClient(Object error) {
    return 'حدث خطأ أثناء حذف العميل: $error';
  }

  @override
  String errorLoadingStatistics(Object error) {
    return 'حدث خطأ أثناء تحميل الإحصائيات: $error';
  }

  @override
  String errorDeletingClients(Object error) {
    return 'حدث خطأ أثناء حذف العملاء: $error';
  }

  @override
  String errorUpdatingClientStatus(Object error) {
    return 'حدث خطأ أثناء تحديث حالة العملاء: $error';
  }

  @override
  String dataConversionError(Object error) {
    return 'خطأ في تحويل البيانات: $error';
  }

  @override
  String get nameMinLength => 'الاسم يجب أن يكون 3 أحرف على الأقل';

  @override
  String get nameMaxLength => 'الاسم يجب أن يكون أقل من 50 حرف';

  @override
  String get phoneRequired => 'رقم الهاتف مطلوب';

  @override
  String get phoneMinLength => 'رقم الهاتف يجب أن يكون 10 أرقام على الأقل';

  @override
  String get phoneMaxLength => 'رقم الهاتف يجب أن يكون أقل من 15 رقم';

  @override
  String get passwordMinLength => 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';

  @override
  String get passwordMaxLength => 'كلمة المرور يجب أن تكون أقل من 50 حرف';

  @override
  String get passwordUppercase =>
      'كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل';

  @override
  String get passwordLowercase =>
      'كلمة المرور يجب أن تحتوي على حرف صغير واحد على الأقل';

  @override
  String get passwordNumber =>
      'كلمة المرور يجب أن تحتوي على رقم واحد على الأقل';

  @override
  String get passwordsDoNotMatch => 'كلمة المرور غير متطابقة';

  @override
  String get thisField => 'هذا الحقل';

  @override
  String get search => 'البحث...';

  @override
  String get loadingUsers => 'جاري تحميل المستخدمين...';
}
