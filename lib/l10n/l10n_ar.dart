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
  String get newExpense => 'مصروف جديد';

  @override
  String get trackYourBusinessExpenses => 'تتبع مصروفات عملك';

  @override
  String get basicInformation => 'معلومات أساسية';

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
  String get active => 'نشطة';

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
  String get editProduct => 'تعديل المنتج';

  @override
  String get deleteProduct => 'حذف المنتج';

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
  String get editExpense => 'تعديل المصروف';

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
    return 'خطأ: $error';
  }

  @override
  String statusCategory(String status) {
    return 'الحالة: $status';
  }
}
