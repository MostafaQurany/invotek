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
  String get validationError => 'خطأ في التحقق من البيانات';

  @override
  String get networkError => 'خطأ في الإتصال بالشبكة';

  @override
  String get serverError => 'خطأ في الخادم. يرجى المحاولة لاحقاً.';

  @override
  String get authError =>
      'فشل في تسجيل الدخول. يرجى التحقق من البريد الإلكتروني وكلمة المرور.';

  @override
  String get unknownError => 'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.';

  @override
  String get cacheError => 'خطأ في التخزين المحلي';

  @override
  String get timeoutError => 'انتهت مهلة الطلب';

  @override
  String get unauthorizedError => 'غير مصرح بالوصول';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get customersLoadError => 'خطأ في تحميل العملاء';

  @override
  String get customersNetworkError => 'خطأ في الشبكة - العملاء';

  @override
  String get customersValidationError => 'خطأ في التحقق - العملاء';

  @override
  String get customersUnknownError => 'خطأ غير معروف - العملاء';

  @override
  String get customersTimeoutError => 'انتهت مهلة الطلب - العملاء';

  @override
  String get customersUnauthorizedError => 'غير مصرح بالوصول - العملاء';

  @override
  String get customersCacheError => 'خطأ في التخزين - العملاء';

  @override
  String get productsLoadError => 'خطأ في تحميل المنتجات';

  @override
  String get productsNetworkError => 'خطأ في الشبكة - المنتجات';

  @override
  String get productsValidationError => 'خطأ في التحقق - المنتجات';

  @override
  String get productsUnknownError => 'خطأ غير معروف - المنتجات';

  @override
  String get productsTimeoutError => 'انتهت مهلة الطلب - المنتجات';

  @override
  String get productsUnauthorizedError => 'غير مصرح بالوصول - المنتجات';

  @override
  String get productsCacheError => 'خطأ في التخزين - المنتجات';

  @override
  String get expensesLoadError => 'خطأ في تحميل المصروفات';

  @override
  String get expensesNetworkError => 'خطأ في الشبكة - المصروفات';

  @override
  String get expensesValidationError => 'خطأ في التحقق - المصروفات';

  @override
  String get expensesUnknownError => 'خطأ غير معروف - المصروفات';

  @override
  String get expensesTimeoutError => 'انتهت مهلة الطلب - المصروفات';

  @override
  String get expensesUnauthorizedError => 'غير مصرح بالوصول - المصروفات';

  @override
  String get expensesCacheError => 'خطأ في التخزين - المصروفات';

  @override
  String get invoicesLoadError => 'خطأ في تحميل الفواتير';

  @override
  String get invoicesNetworkError => 'خطأ في الشبكة - الفواتير';

  @override
  String get invoicesValidationError => 'خطأ في التحقق - الفواتير';

  @override
  String get invoicesUnknownError => 'خطأ غير معروف - الفواتير';

  @override
  String get invoicesTimeoutError => 'انتهت مهلة الطلب - الفواتير';

  @override
  String get invoicesUnauthorizedError => 'غير مصرح بالوصول - الفواتير';

  @override
  String get invoicesCacheError => 'خطأ في التخزين - الفواتير';

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
  String get signInWithGoogle => 'تسجيل الدخول بالجوجل';

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
  String get cannotEditInvoice => 'لا يمكن تعديل الفاتورة';

  @override
  String get invoiceAlreadySent => 'تم إرسال الفاتورة بالفعل';

  @override
  String get cannotEditSentInvoice => 'لا يمكن تعديل الفواتير المرسلة';

  @override
  String get noData => 'لا توجد بيانات';

  @override
  String get selectCustomer => 'اختيار العميل';

  @override
  String get searchCustomers => 'البحث عن العملاء';

  @override
  String get loadingCustomers => 'جاري تحميل العملاء...';

  @override
  String get errorLoadingCustomers => 'خطأ في تحميل العملاء';

  @override
  String get noCustomersFound => 'لا توجد عملاء';

  @override
  String get noCustomersMatchSearch => 'لا توجد عملاء يطابقون البحث';

  @override
  String get addFirstCustomer => 'أضف أول عميل';

  @override
  String get tryDifferentSearch => 'جرب بحث مختلف';

  @override
  String get addNewCustomer => 'إضافة عميل جديد';

  @override
  String get companyInformation => 'معلومات الشركة';

  @override
  String get companyName => 'اسم الشركة';

  @override
  String get enterCompanyName => 'أدخل اسم الشركة';

  @override
  String get address => 'العنوان';

  @override
  String get enterAddress => 'أدخل العنوان';

  @override
  String get errorCreatingCustomer => 'خطأ في إنشاء العميل';

  @override
  String get selectProduct => 'اختيار المنتج';

  @override
  String get searchProducts => 'البحث في المنتجات...';

  @override
  String get loadingProducts => 'جاري تحميل المنتجات...';

  @override
  String get errorLoadingProducts => 'حدث خطأ أثناء تحميل المنتجات';

  @override
  String get noProductsFound => 'لا توجد منتجات';

  @override
  String get noProductsMatchSearch => 'لا توجد منتجات تطابق البحث';

  @override
  String get addFirstProduct => 'أضف أول منتج';

  @override
  String get addNewProduct => 'إضافة منتج جديد';

  @override
  String get productName => 'اسم المنتج';

  @override
  String get enterProductName => 'أدخل اسم المنتج';

  @override
  String get sku => 'رمز المنتج';

  @override
  String get enterSku => 'أدخل رمز المنتج';

  @override
  String get pricingInformation => 'معلومات التسعير';

  @override
  String get price => 'السعر';

  @override
  String get enterPrice => 'أدخل السعر';

  @override
  String get priceRequired => 'السعر مطلوب';

  @override
  String get invalidPrice => 'سعر غير صحيح';

  @override
  String get quantity => 'الكمية';

  @override
  String get enterQuantity => 'أدخل الكمية';

  @override
  String get quantityRequired => 'الكمية مطلوبة';

  @override
  String get invalidQuantity => 'كمية غير صحيحة';

  @override
  String get errorCreatingProduct => 'حدث خطأ أثناء إنشاء المنتج';

  @override
  String get invoiceItems => 'عناصر الفاتورة';

  @override
  String get items => 'العناصر';

  @override
  String get noItemsAdded => 'لم يتم إضافة أي عناصر بعد';

  @override
  String get addItemsToInvoice => 'إضافة عناصر للفاتورة';

  @override
  String get manualItem => 'عنصر يدوي';

  @override
  String get discount => 'الخصم';

  @override
  String get addFromProducts => 'إضافة من المنتجات';

  @override
  String get addManualItem => 'إضافة عنصر يدوي';

  @override
  String get customerSelection => 'اختيار العميل';

  @override
  String get noCustomerSelected => 'لم يتم اختيار عميل';

  @override
  String get invoiceUpdatedSuccessfully => 'تم تحديث الفاتورة بنجاح';

  @override
  String get errorUpdatingInvoice => 'خطأ في تحديث الفاتورة';

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
  String get category => 'الفئة';

  @override
  String get allCategories => 'جميع الفئات';

  @override
  String get allStatuses => 'جميع الحالات';

  @override
  String get outOfStock => 'نفدت الكمية';

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
  String get customerBasicInfo => 'المعلومات الأساسية';

  @override
  String get customerBasicInfoSection => 'المعلومات الأساسية';

  @override
  String get customerCompanyName => 'اسم الشركة/المؤسسة';

  @override
  String get customerPhoneRequired => 'رقم الهاتف مطلوب';

  @override
  String get phoneInvalid => 'تنسيق رقم الهاتف غير صحيح';

  @override
  String get customerCommercialRegister => 'السجل التجاري';

  @override
  String get customerCity => 'المدينة';

  @override
  String get customerRegion => 'المنطقة';

  @override
  String get customerPostalCode => 'الرمز البريدي';

  @override
  String get customerDetailedAddress => 'العنوان التفصيلي';

  @override
  String get customerAdditionalInfo => 'معلومات إضافية';

  @override
  String get customerResponsiblePerson => 'الشخص المسؤول';

  @override
  String customerCreatedSuccessfully(String name) {
    return 'تم إنشاء العميل \"$name\" بنجاح';
  }

  @override
  String customerUpdatedSuccessfully(String name) {
    return 'تم تحديث العميل \"$name\" بنجاح';
  }

  @override
  String get customerDeletedSuccessfully => 'تم حذف العميل بنجاح';

  @override
  String get confirmDeleteCustomer => 'تأكيد حذف العميل';

  @override
  String confirmDeleteCustomerMessage(String name) {
    return 'هل أنت متأكد من حذف العميل \"$name\"؟';
  }

  @override
  String get view => 'عرض';

  @override
  String get edit => 'تعديل';

  @override
  String errorOccurred(Object error) {
    return 'حدث خطأ $error';
  }

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
  String get cash => 'نقداً';

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
  String get expensesManagement => 'المصروفات وفئاتها';

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
  String get accountSettings => 'إعدادات الحساب';

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get deleteAccount => 'حذف الحساب';

  @override
  String get currentPassword => 'كلمة المرور الحالية';

  @override
  String get newPassword => 'كلمة المرور الجديدة';

  @override
  String get confirmNewPassword => 'تأكيد كلمة المرور';

  @override
  String get passwordChangedSuccessfully => 'تم تغيير كلمة المرور بنجاح';

  @override
  String get deleteAccountWarning => 'تحذير: سيتم حذف حسابك نهائياً';

  @override
  String get enterPasswordToConfirm => 'أدخل كلمة المرور للتأكيد';

  @override
  String get accountDeletedSuccessfully => 'تم حذف الحساب بنجاح';

  @override
  String get deleteAccountConfirmation => 'هل أنت متأكد من حذف حسابك؟';

  @override
  String get changePasswordConfirmation => 'هل أنت متأكد من تغيير كلمة المرور؟';

  @override
  String get deleteAccountFinalConfirmation =>
      'هل أنت متأكد تماماً من حذف حسابك؟ هذا الإجراء لا يمكن التراجع عنه';

  @override
  String get yesDeleteAccount => 'نعم، احذف حسابي';

  @override
  String get changePasswordButton => 'تغيير كلمة المرور';

  @override
  String get deleteAccountButton => 'حذف الحساب نهائياً';

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
  String get phone => 'الهاتف';

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
  String get ok => 'حسناً';

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
  String get errorLoadingProduct => 'حدث خطأ أثناء تحميل بيانات المنتج';

  @override
  String get noCategoriesToDelete => 'لا توجد فئات للحذف';

  @override
  String get allCategoriesDeletedSuccessfully => 'تم حذف جميع الفئات بنجاح';

  @override
  String get allStatus => 'جميع الحالات';

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
  String get enterProductDescription => 'أدخل وصف المنتج';

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
  String get totalAmount => 'إجمالي المبلغ';

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
  String get deleteInvoice => 'حذف الفاتورة';

  @override
  String get deleteInvoiceDescription => 'إمكانية حذف الفاتورة';

  @override
  String get sendInvoice => 'إرسال الفاتورة';

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

  @override
  String get signInFailed => 'فشل تسجيل الدخول';

  @override
  String get loginCancelled => 'تم الإلغاء';

  @override
  String get failedToGetUserData => 'فشل في الحصول على بيانات المستخدم';

  @override
  String get loginError => 'خطأ في تسجيل الدخول';

  @override
  String get playServicesNotAvailable => 'خطأ في الخدمات المتاحة';

  @override
  String get googleSignInError => 'خطأ في تسجيل الدخول بالجوجل';

  @override
  String get addInvoice => 'إضافة فاتورة';

  @override
  String get invoices => 'الفواتير';

  @override
  String get searchInInvoices => 'البحث في الفواتير...';

  @override
  String get allPaymentMethods => 'جميع طرق الدفع';

  @override
  String get customer => 'العميل';

  @override
  String get allCustomers => 'جميع العملاء';

  @override
  String get paid => 'مدفوعة';

  @override
  String get pending => 'معلقة';

  @override
  String get overdue => 'متأخرة';

  @override
  String get draft => 'مسودة';

  @override
  String get card => 'بطاقة';

  @override
  String get total => 'المجموع الكلي';

  @override
  String get subtotal => 'المجموع الفرعي';

  @override
  String get tax => 'الضريبة';

  @override
  String get noItems => 'لا توجد عناصر';

  @override
  String get qty => 'الكمية';

  @override
  String get searchItems => 'البحث في العناصر...';

  @override
  String get showLess => 'إظهار أقل';

  @override
  String showAllItems(Object count) {
    return 'إظهار جميع العناصر ($count)';
  }

  @override
  String get payment => 'الدفع';

  @override
  String get paymentDetails => 'تفاصيل الدفع';

  @override
  String get markAsPaid => 'تحديد كمدفوعة';

  @override
  String get send => 'إرسال';

  @override
  String get duplicate => 'نسخ';

  @override
  String get downloadPDF => 'تحميل PDF';

  @override
  String get noInvoices => 'لا توجد فواتير';

  @override
  String get noInvoicesDescription => 'اضغط على زر الإضافة لإنشاء فاتورة جديدة';

  @override
  String get addFirstInvoice => 'إضافة أول فاتورة';

  @override
  String get deleteInvoiceConfirmation => 'تأكيد حذف الفاتورة';

  @override
  String get deleteInvoiceWarning =>
      'هل أنت متأكد من حذف هذه الفاتورة؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get sendMethod => 'طريقة الإرسال';

  @override
  String get sms => 'رسالة نصية';

  @override
  String get emailDetails => 'تفاصيل البريد الإلكتروني';

  @override
  String get subject => 'الموضوع';

  @override
  String get enterSubject => 'أدخل الموضوع';

  @override
  String get message => 'الرسالة';

  @override
  String get enterMessage => 'أدخل الرسالة';

  @override
  String get includePDF => 'تضمين PDF';

  @override
  String get paymentDate => 'تاريخ الدفع';

  @override
  String get addNotes => 'إضافة ملاحظات';

  @override
  String get invoiceHelp => 'مساعدة الفواتير';

  @override
  String get creatingInvoices => 'إنشاء الفواتير';

  @override
  String get createInvoiceStep1 => '1. أدخل معلومات العميل الأساسية';

  @override
  String get createInvoiceStep2 => '2. أضف العناصر والكميات';

  @override
  String get createInvoiceStep3 => '3. حدد طريقة الدفع والتاريخ';

  @override
  String get createInvoiceStep4 => '4. راجع الفاتورة واحفظها';

  @override
  String get managingInvoices => 'إدارة الفواتير';

  @override
  String get manageInvoiceStep1 =>
      '1. استخدم البحث والفلترة للعثور على الفواتير';

  @override
  String get manageInvoiceStep2 => '2. اضغط على الفاتورة لعرض التفاصيل';

  @override
  String get manageInvoiceStep3 => '3. استخدم الأزرار للتحرير أو الحذف';

  @override
  String get manageInvoiceStep4 => '4. أرسل الفاتورة للعميل عند الحاجة';

  @override
  String get paymentMethods => 'طرق الدفع';

  @override
  String get paymentMethodCash => 'نقدي';

  @override
  String get paymentMethodCard => 'بطاقة ائتمان';

  @override
  String get paymentMethodBank => 'تحويل بنكي';

  @override
  String get paymentMethodCheck => 'شيك';

  @override
  String get taxIntegration => 'التكامل الضريبي';

  @override
  String get taxIntegrationStep1 => '1. قم بتفعيل التكامل الضريبي';

  @override
  String get taxIntegrationStep2 => '2. أدخل معلومات الشركة الضريبية';

  @override
  String get taxIntegrationStep3 => '3. اختبر الاتصال واحفظ الإعدادات';

  @override
  String get invoiceDetails => 'تفاصيل الفاتورة';

  @override
  String get customerInformation => 'معلومات العميل';

  @override
  String get amountInformation => 'معلومات المبلغ';

  @override
  String get invoiceNumber => 'رقم الفاتورة';

  @override
  String get enterInvoiceNumber => 'أدخل رقم الفاتورة';

  @override
  String get issueDate => 'تاريخ الإصدار';

  @override
  String get selectDate => 'اختر التاريخ';

  @override
  String get enterCustomerEmail => 'أدخل البريد الإلكتروني';

  @override
  String get enterCustomerPhone => 'أدخل رقم الهاتف';

  @override
  String get enterSubtotal => 'أدخل المجموع الفرعي';

  @override
  String get enterTaxAmount => 'أدخل مبلغ الضريبة';

  @override
  String get taxIntegrationSettings => 'إعدادات التكامل الضريبي';

  @override
  String get configureTaxIntegration => 'تكوين التكامل الضريبي';

  @override
  String get enableTaxIntegration => 'تفعيل التكامل الضريبي';

  @override
  String get taxType => 'نوع الضريبة';

  @override
  String get vat => 'ضريبة القيمة المضافة';

  @override
  String get salesTax => 'ضريبة المبيعات';

  @override
  String get country => 'البلد';

  @override
  String get saudiArabia => 'المملكة العربية السعودية';

  @override
  String get uae => 'دولة الإمارات العربية المتحدة';

  @override
  String get kuwait => 'دولة الكويت';

  @override
  String get testConnection => 'اختبار الاتصال';

  @override
  String get vatNumber => 'رقم ضريبة القيمة المضافة';

  @override
  String get enterVatNumber => 'أدخل رقم ضريبة القيمة المضافة';

  @override
  String get city => 'المدينة';

  @override
  String get postalCode => 'الرمز البريدي';

  @override
  String get contactInformation => 'معلومات الاتصال';

  @override
  String get enterPhone => 'أدخل الهاتف';

  @override
  String get testingConnection => 'جاري اختبار الاتصال...';

  @override
  String get taxAmount => 'مبلغ الضريبة';

  @override
  String get enterDescription => 'أدخل الوصف';

  @override
  String get searchInvoices => 'البحث في الفواتير...';

  @override
  String get loadingInvoiceDetails => 'جاري تحميل تفاصيل الفاتورة...';

  @override
  String get errorLoadingInvoice => 'خطأ في تحميل الفاتورة';

  @override
  String get noInvoiceData => 'لا توجد بيانات للفاتورة';

  @override
  String invoiceNumberLabel(String number) {
    return 'رقم الفاتورة: $number';
  }

  @override
  String get shareInvoice => 'مشاركة الفاتورة';

  @override
  String get printInvoice => 'طباعة الفاتورة';

  @override
  String get duplicateInvoice => 'تكرار الفاتورة';

  @override
  String get viewQRCode => 'عرض رمز QR';

  @override
  String get viewTaxUID => 'عرض معرف الضريبة';

  @override
  String get updateStatus => 'تحديث الحالة';

  @override
  String get changeStatus => 'تغيير الحالة';

  @override
  String get moreOptions => 'خيارات إضافية';

  @override
  String get refreshData => 'تحديث البيانات';

  @override
  String get invoiceCopiedToClipboard => 'تم نسخ تفاصيل الفاتورة إلى الحافظة';

  @override
  String get invoiceCopiedForPrinting => 'تم نسخ تفاصيل الفاتورة للطباعة';

  @override
  String get invoiceSentSuccessfully => 'تم إرسال الفاتورة بنجاح';

  @override
  String get invoiceDeletedSuccessfully => 'تم حذف الفاتورة بنجاح';

  @override
  String invoiceStatusUpdated(String status) {
    return 'تم تحديث حالة الفاتورة إلى: $status';
  }

  @override
  String fileSavedSuccessfully(String path) {
    return 'تم حفظ الملف في: $path';
  }

  @override
  String get noQRCodeAvailable => 'لا يوجد رمز QR متاح لهذه الفاتورة';

  @override
  String get noTaxUIDAvailable => 'لا يوجد معرف ضريبة متاح لهذه الفاتورة';

  @override
  String get taxUIDCopied => 'تم نسخ معرف الضريبة';

  @override
  String shareInvoiceText(
    String number,
    String customer,
    String date,
    String amount,
    String status,
  ) {
    return 'فاتورة رقم: $number\nالعميل: $customer\nالتاريخ: $date\nالمبلغ: $amount ر.س\nالحالة: $status\n\nتم إنشاؤها بواسطة تطبيق Invotek';
  }

  @override
  String printInvoiceText(
    String separator,
    String number,
    String date,
    String status,
    String customer,
    String contact,
    String items,
    String subtotal,
    String tax,
    String total,
  ) {
    return 'فاتورة\n$separator\nرقم الفاتورة: $number\nالتاريخ: $date\nالحالة: $status\n\nبيانات العميل:\nالاسم: $customer\n$contact\n\nعناصر الفاتورة:\n$items\n\nالمجاميع:\nالمجموع الفرعي: $subtotal ر.س\n$tax\nالمجموع الكلي: $total ر.س\n\n$separator\nشكراً لتعاملكم معنا\nتم إنشاء هذه الفاتورة بواسطة تطبيق Invotek\n$separator';
  }

  @override
  String get statusPaid => 'مدفوعة';

  @override
  String get statusPending => 'معلقة';

  @override
  String get statusOverdue => 'متأخرة';

  @override
  String get statusDraft => 'مسودة';

  @override
  String get itemDetails => 'تفاصيل العنصر';

  @override
  String get changePaymentMethod => 'تغيير طريقة الدفع';

  @override
  String get creatingFile => 'جاري إنشاء ملف...';

  @override
  String get sendingInvoice => 'جاري إرسال الفاتورة...';

  @override
  String get deletingInvoice => 'جاري حذف الفاتورة...';

  @override
  String get updatingStatus => 'جاري تحديث الحالة...';

  @override
  String errorSharingInvoice(String error) {
    return 'فشل في مشاركة الفاتورة: $error';
  }

  @override
  String errorPrintingInvoice(String error) {
    return 'فشل في طباعة الفاتورة: $error';
  }

  @override
  String errorSendingInvoice(String error) {
    return 'فشل في إرسال الفاتورة: $error';
  }

  @override
  String errorDeletingInvoice(String error) {
    return 'فشل في حذف الفاتورة: $error';
  }

  @override
  String errorCreatingFile(String error) {
    return 'فشل في إنشاء الملف: $error';
  }

  @override
  String errorUpdatingStatus(String error) {
    return 'فشل في تحديث الحالة: $error';
  }

  @override
  String duplicateInvoiceMessage(String number) {
    return 'تكرار الفاتورة $number';
  }

  @override
  String viewCustomerDetails(String name) {
    return 'عرض تفاصيل العميل: $name';
  }

  @override
  String viewItemDetails(String name) {
    return 'عرض تفاصيل العنصر: $name';
  }

  @override
  String changePaymentMethodForInvoice(String number) {
    return 'تغيير طريقة الدفع للفاتورة $number';
  }

  @override
  String get taxUID => 'معرف الضريبة';

  @override
  String taxUIDForInvoice(String number) {
    return 'معرف الضريبة للفاتورة $number:';
  }

  @override
  String get itemName => 'اسم العنصر';

  @override
  String get itemQuantity => 'الكمية';

  @override
  String get itemPrice => 'السعر';

  @override
  String get itemTotal => 'المجموع';

  @override
  String get thankYouMessage => 'شكراً لتعاملكم معنا';

  @override
  String get createdByInvotek => 'تم إنشاء هذه الفاتورة بواسطة تطبيق Invotek';

  @override
  String get separator => '=';

  @override
  String get itemSeparator => '-';

  @override
  String get itemHeader => 'الاسم\t\tالكمية\tالسعر\tالمجموع';

  @override
  String itemRow(String name, String quantity, String price, String total) {
    return '$name\t\t$quantity\t$price\t$total';
  }

  @override
  String taxLine(String amount) {
    return 'الضريبة: $amount ر.س';
  }

  @override
  String subtotalLine(String amount) {
    return 'المجموع الفرعي: $amount ر.س';
  }

  @override
  String totalLine(String amount) {
    return 'المجموع الكلي: $amount ر.س';
  }

  @override
  String fileName(String number, String timestamp) {
    return 'فاتورة_${number}_$timestamp';
  }

  @override
  String loadingProductDetails(String name) {
    return 'جاري تحميل تفاصيل المنتج...';
  }

  @override
  String get createNewInvoiceStepper => 'إنشاء فاتورة جديدة';

  @override
  String get invoiceBasicInfo => 'معلومات الفاتورة';

  @override
  String get reviewCalculations => 'مراجعة الحسابات';

  @override
  String get invoiceCreationHelp =>
      'هذا النموذج يساعدك في إنشاء فاتورة جديدة خطوة بخطوة:\n\n1. معلومات الفاتورة: اختر الإجراء وطريقة الدفع والحالة\n2. اختيار العميل: اختر عميل موجود أو أضف عميل جديد\n3. عناصر الفاتورة: أضف العناصر والكميات والأسعار\n4. مراجعة الحسابات: راجع التفاصيل النهائية قبل الحفظ';

  @override
  String get invoiceCreatedSuccessfully => 'تم إنشاء الفاتورة بنجاح';

  @override
  String errorCreatingInvoice(String error) {
    return 'خطأ: $error';
  }

  @override
  String get fillRequiredFieldsBasicInfo =>
      'يرجى ملء جميع الحقول المطلوبة في معلومات الفاتورة';

  @override
  String get selectOrAddCustomer => 'يرجى اختيار عميل أو إدخال بيانات العميل';

  @override
  String get addAtLeastOneItem => 'يرجى إضافة عنصر واحد على الأقل';

  @override
  String get actionRequired => 'الإجراء مطلوب';

  @override
  String get paymentMethodRequired => 'طريقة الدفع مطلوبة';

  @override
  String get statusRequired => 'حالة الفاتورة مطلوبة';

  @override
  String get customerRequired => 'يرجى اختيار عميل أو إدخال بيانات العميل';

  @override
  String get itemsRequired => 'يرجى إضافة عنصر واحد على الأقل';

  @override
  String get action => 'الإجراء';

  @override
  String get saveOnly => 'حفظ فقط';

  @override
  String get saveAndSend => 'حفظ وإرسال';

  @override
  String get invoiceStatus => 'حالة الفاتورة';

  @override
  String get sent => 'مرسلة';

  @override
  String get invoiceDescription => 'وصف الفاتورة';

  @override
  String get enterInvoiceDescription => 'أدخل وصف الفاتورة (اختياري)';

  @override
  String get customerType => 'نوع العميل';

  @override
  String get existingCustomer => 'عميل موجود';

  @override
  String get newCustomer => 'عميل جديد';

  @override
  String get enterCustomerAddress => 'أدخل العنوان';

  @override
  String get addItem => 'إضافة عنصر';

  @override
  String get addFirstItem => 'أضف أول عنصر';

  @override
  String get taxPercent => 'نسبة الضريبة';

  @override
  String get enterItemName => 'أدخل اسم العنصر';

  @override
  String get enterDiscount => 'أدخل الخصم';

  @override
  String get enterTaxPercent => 'أدخل نسبة الضريبة';

  @override
  String get enterTotal => 'أدخل المجموع';

  @override
  String get removeItem => 'حذف العنصر';

  @override
  String get editItem => 'تعديل العنصر';

  @override
  String get invoiceInfo => 'معلومات الفاتورة';

  @override
  String get customerInfo => 'معلومات العميل';

  @override
  String get itemsInfo => 'معلومات العناصر';

  @override
  String get financialInfo => 'المعلومات المالية';

  @override
  String get actionType => 'نوع الإجراء';

  @override
  String get paymentMethodType => 'نوع طريقة الدفع';

  @override
  String get statusType => 'نوع الحالة';

  @override
  String get issueDateValue => 'تاريخ الإصدار';

  @override
  String get descriptionValue => 'الوصف';

  @override
  String get customerNameValue => 'اسم العميل';

  @override
  String get customerEmailValue => 'البريد الإلكتروني';

  @override
  String get customerPhoneValue => 'رقم الهاتف';

  @override
  String get customerAddressValue => 'العنوان';

  @override
  String get itemDiscount => 'الخصم';

  @override
  String get itemTax => 'الضريبة';

  @override
  String get clearSearch => 'مسح البحث';

  @override
  String get loadMore => 'تحميل المزيد';

  @override
  String get dashboard => 'لوحة التحكم';

  @override
  String get statistics => 'الإحصائيات';

  @override
  String get totalInvoices => 'إجمالي الفواتير';

  @override
  String get newInvoices => 'فواتير جديدة';

  @override
  String get totalSales => 'إجمالي المبيعات';

  @override
  String get totalExpenses => 'إجمالي المصروفات';

  @override
  String get monthlyExpenses => 'مصروفات هذا الشهر';

  @override
  String get totalCustomers => 'إجمالي العملاء';

  @override
  String get newCustomers => 'عملاء جدد';

  @override
  String get totalProducts => 'إجمالي المنتجات';

  @override
  String get newProducts => 'منتجات جديدة';

  @override
  String get netProfit => 'صافي الربح';

  @override
  String get salesGrowth => 'نمو المبيعات';

  @override
  String get profitGrowth => 'نمو الأرباح';

  @override
  String get topSellingProducts => 'المنتجات الأكثر مبيعاً';

  @override
  String get loadingDashboard => 'جاري تحميل بيانات لوحة التحكم...';

  @override
  String get errorLoadingDashboard => 'خطأ في تحميل لوحة التحكم';

  @override
  String get dashboardError => 'خطأ في تحميل البيانات';

  @override
  String get dashboardErrorMessage => 'حدث خطأ أثناء تحميل بيانات لوحة التحكم';

  @override
  String get noDataAvailable => 'لا توجد بيانات متاحة';

  @override
  String get currency => 'دينار';

  @override
  String get growth => 'نمو';

  @override
  String get decrease => 'انخفاض';

  @override
  String get increase => 'زيادة';

  @override
  String get newThisMonth => 'جديد هذا الشهر';

  @override
  String get productsInStock => 'منتجات في المخزون';

  @override
  String get salesDistribution => 'توزيع المبيعات';

  @override
  String get invoiceStatistics => 'إحصائيات الفواتير';

  @override
  String get allInvoices => 'جميع الفواتير';

  @override
  String get regularInvoices => 'الفواتير العادية';

  @override
  String get monthlySalesStatistics => 'إحصائيات المبيعات الشهرية';

  @override
  String get salesCategories => 'فئات المبيعات';

  @override
  String get firstCategory => 'فئة أولى';

  @override
  String get uncategorized => 'غير مصنف';

  @override
  String get printOptions => 'خيارات الطباعة';

  @override
  String get thermalPrint => 'طباعة حرارية';

  @override
  String get thermalPrintDesc => 'للطابعات الحرارية - 80mm';

  @override
  String get pdfPrint => 'طباعة PDF';

  @override
  String get pdfPrintDesc => 'عرض وحفظ PDF';

  @override
  String get printerStatus => 'حالة الطابعة';

  @override
  String get printerConnected => 'متصل بالطابعة';

  @override
  String get printerDisconnected => 'غير متصل بالطابعة';

  @override
  String get checkingConnection => 'جاري فحص الاتصال...';

  @override
  String get searchingPrinter => 'جاري البحث عن الطابعة...';

  @override
  String get printReceipt => 'طباعة الإيصال';

  @override
  String get retryConnection => 'إعادة فحص';

  @override
  String get pdfPreview => 'معاينة PDF';

  @override
  String get savePDF => 'حفظ PDF';

  @override
  String get generatingPDF => 'جاري إنشاء PDF...';

  @override
  String get pdfGenerated => 'تم إنشاء PDF بنجاح';

  @override
  String get pdfSaved => 'تم حفظ PDF بنجاح';

  @override
  String get printError => 'خطأ في الطباعة';

  @override
  String get connectionError => 'خطأ في الاتصال';

  @override
  String get thermalReceipt => 'إيصال حرارية';

  @override
  String get thankYou => 'شكراً لتعاملكم معنا';

  @override
  String get printSuccess => 'تمت الطباعة بنجاح';

  @override
  String get printFailed => 'فشلت الطباعة';

  @override
  String get pdfError => 'خطأ في إنشاء PDF';

  @override
  String get saveError => 'خطأ في حفظ PDF';

  @override
  String get printSettings => 'إعدادات الطباعة';

  @override
  String get paperSize => 'حجم الورق';

  @override
  String get printerName => 'اسم الطابعة';

  @override
  String get connectionType => 'نوع الاتصال';

  @override
  String get bluetooth => 'بلوتوث';

  @override
  String get usb => 'USB';

  @override
  String get network => 'شبكة';

  @override
  String get selectPrinter => 'اختر الطابعة';

  @override
  String get noPrintersFound => 'لم يتم العثور على طابعات';

  @override
  String get refreshPrinters => 'تحديث الطابعات';

  @override
  String get printerSettings => 'إعدادات الطابعة';

  @override
  String get testPrint => 'طباعة تجريبية';

  @override
  String get printQuality => 'جودة الطباعة';

  @override
  String get high => 'عالية';

  @override
  String get medium => 'متوسطة';

  @override
  String get low => 'منخفضة';

  @override
  String get searchExpenses => '....البحث عن المصروفات';

  @override
  String get forgetPassword => 'هل نسيت كلمة المرور ؟';

  @override
  String get forgetPasswordTitle => 'نسيت كلمة المرور';

  @override
  String get forgetPasswordDesc => 'أدخل بريدك الإلكتروني لإرسال كود التحقق';

  @override
  String get sendVerificationCode => 'إرسال كود التحقق';

  @override
  String get verifyCodeTitle => 'التحقق من الكود';

  @override
  String verifyCodeDesc(Object email) {
    return 'أدخل الكود المرسل إلى $email';
  }

  @override
  String get enterCode => 'أدخل الكود';

  @override
  String get verifyCode => 'تحقق من الكود';

  @override
  String get resendCode => 'إعادة إرسال الكود';

  @override
  String resendCodeIn(Object seconds) {
    return 'إعادة الإرسال خلال $seconds ثانية';
  }

  @override
  String get codeResent => 'تم إعادة إرسال الكود';

  @override
  String get resetPasswordTitle => 'إعادة تعيين كلمة المرور';

  @override
  String get resetPasswordDesc => 'أدخل كلمة المرور الجديدة';

  @override
  String get resetPassword => 'إعادة تعيين';

  @override
  String get passwordStrengthWeak => 'ضعيفة';

  @override
  String get passwordStrengthMedium => 'متوسطة';

  @override
  String get passwordStrengthStrong => 'قوية';

  @override
  String get resetPasswordSuccess => 'تم إعادة تعيين كلمة المرور بنجاح';

  @override
  String get accessDenied => 'الوصول مرفوض';

  @override
  String noPermissionMessage(Object feature) {
    return 'عذراً، ليس لديك صلاحية للوصول إلى $feature';
  }

  @override
  String get contactAdminForAccess =>
      'يرجى التواصل مع مدير النظام للحصول على الصلاحية';

  @override
  String get pasteCode => 'لصق الكود';

  @override
  String get invalidCode => 'الكود غير صحيح';

  @override
  String get codeMustBe6Digits => 'الكود يجب أن يكون 6 أرقام';

  @override
  String get enterVerificationCode => 'أدخل رمز التحقق';

  @override
  String get checkYourEmail => 'تحقق من بريدك الإلكتروني';

  @override
  String get otpSentToEmail => 'تم إرسال رمز التحقق إلى بريدك الإلكتروني';

  @override
  String get copyCodeFromEmail => 'انسخ الكود من البريد الإلكتروني والصقه هنا';

  @override
  String get dismiss => 'إغلاق';

  @override
  String get backToLoginScreen => 'العودة إلى شاشة التسجيل';

  @override
  String get welcomeBack => 'مرحباً بك، 👋';

  @override
  String welcomeBackWithName(String name) {
    return 'مرحباً $name، 👋';
  }

  @override
  String get subscriptionRequired => 'اختيار الباقة مطلوب';

  @override
  String get subscriptionRequiredMessage =>
      'يجب عليك اختيار باقة مناسبة لاستخدام هذه الميزة';

  @override
  String get chooseSubscription => 'اختيار الباقة';

  @override
  String get cannotOpenSubscriptionLink => 'لا يمكن فتح رابط الباقة';

  @override
  String get noProductsSoldYet => 'لا توجد منتجات مبيعة بعد';

  @override
  String get noProductsSoldMessage =>
      'ابدأ بإنشاء فواتيرك الأولى لرؤية المنتجات الأكثر مبيعاً';

  @override
  String get undefinedProduct => 'منتج غير محدد';

  @override
  String get customerAnalytics => 'تحليلات العملاء';

  @override
  String get lastInvoices => 'آخر الفواتير';

  @override
  String get lastFiveInvoices => 'آخر 5 فواتير';

  @override
  String get saudiRiyal => 'ريال سعودي';

  @override
  String get loadingInvoices => 'جاري تحميل الفواتير...';

  @override
  String get errorLoadingInvoices => 'خطأ في تحميل الفواتير';

  @override
  String get invoiceAmount => 'مبلغ الفاتورة';

  @override
  String get invoiceDate => 'تاريخ الفاتورة';

  @override
  String get invoicePaid => 'مدفوعة';

  @override
  String get invoicePending => 'معلقة';

  @override
  String get invoiceCancelled => 'ملغية';

  @override
  String get invoiceDraft => 'مسودة';

  @override
  String get invoiceOverdue => 'متأخرة';

  @override
  String get invoiceSent => 'مرسلة';

  @override
  String get invoiceReturned => 'مرتجعة';

  @override
  String get invoiceUnknown => 'غير محدد';

  @override
  String andMoreInvoices(int count) {
    return 'و $count فاتورة أخرى...';
  }

  @override
  String get customerContactInfo => 'معلومات الاتصال';

  @override
  String get customerAccountStatus => 'حالة الحساب';

  @override
  String get customerQuickActions => 'الإجراءات السريعة';

  @override
  String get customerCompany => 'الشركة';

  @override
  String get customerActive => 'نشط';

  @override
  String get customerInactive => 'غير نشط';

  @override
  String get customerCreatedDate => 'تاريخ الإنشاء';

  @override
  String get customerLastUpdated => 'آخر تحديث';

  @override
  String get customerAddressInfo => 'معلومات العنوان';

  @override
  String get customerFormHelp => 'مساعدة نموذج العميل';

  @override
  String get customerFormHelpDescription =>
      'هذا النموذج مقسم إلى ثلاث خطوات:\n\n1. المعلومات الأساسية\n2. معلومات العنوان\n3. المعلومات الإضافية';

  @override
  String get errorUpdatingCustomer => 'خطأ في تحديث العميل';

  @override
  String get errorDeletingCustomer => 'خطأ في حذف العميل';

  @override
  String get errorLoadingCustomer => 'خطأ في تحميل العميل';

  @override
  String get customerEmailRequired => 'البريد الإلكتروني مطلوب';

  @override
  String get customerAddressRequired => 'العنوان مطلوب';

  @override
  String get customerCompanyRequired => 'اسم الشركة مطلوب';

  @override
  String get customerTaxNumberRequired => 'الرقم الضريبي مطلوب';

  @override
  String get customerCommercialRegisterRequired => 'السجل التجاري مطلوب';

  @override
  String get customerCityRequired => 'المدينة مطلوبة';

  @override
  String get customerRegionRequired => 'المنطقة مطلوبة';

  @override
  String get customerPostalCodeRequired => 'الرمز البريدي مطلوب';

  @override
  String get customerDetailedAddressRequired => 'العنوان التفصيلي مطلوب';

  @override
  String get customerResponsiblePersonRequired => 'الشخص المسؤول مطلوب';

  @override
  String get customerNotesRequired => 'الملاحظات مطلوبة';

  @override
  String get customerStatusRequired => 'الحالة مطلوبة';

  @override
  String get enterCustomerCompany => 'أدخل اسم الشركة';

  @override
  String get enterCustomerTaxNumber => 'أدخل الرقم الضريبي';

  @override
  String get enterCustomerCommercialRegister => 'أدخل السجل التجاري';

  @override
  String get enterCustomerCity => 'أدخل المدينة';

  @override
  String get enterCustomerRegion => 'أدخل المنطقة';

  @override
  String get enterCustomerPostalCode => 'أدخل الرمز البريدي';

  @override
  String get enterCustomerDetailedAddress => 'أدخل العنوان التفصيلي';

  @override
  String get enterCustomerResponsiblePerson => 'أدخل الشخص المسؤول';

  @override
  String get enterCustomerNotes => 'أدخل الملاحظات';

  @override
  String get selectCustomerStatus => 'اختر حالة العميل';

  @override
  String get customerFormTitle => 'نموذج العميل';

  @override
  String get customerFormDescription =>
      'املأ النموذج أدناه لإضافة عميل جديد للنظام';

  @override
  String get viewCustomer => 'عرض العميل';

  @override
  String get customerOptions => 'خيارات العميل';

  @override
  String get customerActions => 'إجراءات العميل';

  @override
  String get customerList => 'قائمة العملاء';

  @override
  String get customerSearch => 'البحث في العملاء';

  @override
  String get customerFilters => 'مرشحات العملاء';

  @override
  String get customerSort => 'ترتيب العملاء';

  @override
  String get customerExport => 'تصدير العملاء';

  @override
  String get customerImport => 'استيراد العملاء';

  @override
  String get customerReports => 'تقارير العملاء';

  @override
  String get customerStatistics => 'إحصائيات العملاء';

  @override
  String get customerPerformance => 'أداء العميل';

  @override
  String get customerSatisfaction => 'رضا العملاء';

  @override
  String get customerRetention => 'الاحتفاظ بالعملاء';

  @override
  String get customerLoyalty => 'ولاء العملاء';

  @override
  String get customerValue => 'قيمة العميل';

  @override
  String get customerLifetimeValue => 'قيمة العميل مدى الحياة';

  @override
  String get customerAcquisition => 'اكتساب العملاء';

  @override
  String get customerConversion => 'تحويل العملاء';

  @override
  String get customerEngagement => 'تفاعل العملاء';

  @override
  String get customerFeedback => 'ملاحظات العميل';

  @override
  String get customerSupport => 'دعم العملاء';

  @override
  String get customerService => 'خدمة العملاء';

  @override
  String get customerSuccess => 'نجاح العميل';

  @override
  String get customerOnboarding => 'إعداد العملاء';

  @override
  String get customerTraining => 'تدريب العملاء';

  @override
  String get customerDocumentation => 'وثائق العملاء';

  @override
  String get customerResources => 'موارد العميل';

  @override
  String get customerPortal => 'بوابة العملاء';

  @override
  String get customerDashboard => 'لوحة تحكم العملاء';

  @override
  String get customerProfile => 'ملف العميل';

  @override
  String get customerHistory => 'تاريخ العميل';

  @override
  String get customerTransactions => 'معاملات العميل';

  @override
  String get customerOrders => 'طلبات العميل';

  @override
  String get customerInvoices => 'فواتير العميل';

  @override
  String get customerPayments => 'مدفوعات العميل';

  @override
  String get customerCredits => 'ائتمانات العميل';

  @override
  String get customerDebits => 'مديونيات العميل';

  @override
  String get customerBalance => 'رصيد العميل';

  @override
  String get customerCreditLimit => 'حد الائتمان';

  @override
  String get customerPaymentTerms => 'شروط الدفع';

  @override
  String get customerDiscount => 'خصم العميل';

  @override
  String get customerTaxExempt => 'معفى من الضريبة';

  @override
  String get customerVip => 'عميل مميز';

  @override
  String get customerPriority => 'أولوية العميل';

  @override
  String get customerSegment => 'قطاع العميل';

  @override
  String get customerCategory => 'فئة العميل';

  @override
  String get customerSize => 'حجم العميل';

  @override
  String get customerIndustry => 'صناعة العميل';

  @override
  String get customerLocation => 'موقع العميل';

  @override
  String get customerTimezone => 'المنطقة الزمنية';

  @override
  String get customerLanguage => 'لغة العميل';

  @override
  String get customerCurrency => 'عملة العميل';

  @override
  String get customerPreferences => 'تفضيلات العميل';

  @override
  String get customerSettings => 'إعدادات العميل';

  @override
  String get customerNotifications => 'إشعارات العميل';

  @override
  String get customerAlerts => 'تنبيهات العميل';

  @override
  String get customerReminders => 'تذكيرات العميل';

  @override
  String get customerFollowUp => 'متابعة العميل';

  @override
  String get customerCommunication => 'تواصل العميل';

  @override
  String get customerMeetings => 'اجتماعات العميل';

  @override
  String get customerCalls => 'مكالمات العميل';

  @override
  String get customerEmails => 'رسائل العميل';

  @override
  String get customerMessages => 'رسائل العميل';

  @override
  String get customerChats => 'محادثات العميل';

  @override
  String get customerTickets => 'تذاكر العميل';

  @override
  String get customerIssues => 'مشاكل العميل';

  @override
  String get customerComplaints => 'شكاوى العميل';

  @override
  String get customerRequests => 'طلبات العميل';

  @override
  String get customerSuggestions => 'اقتراحات العميل';

  @override
  String get customerReviews => 'مراجعات العميل';

  @override
  String get customerRatings => 'تقييمات العميل';

  @override
  String get customerTestimonials => 'شهادات العميل';

  @override
  String get customerReferences => 'مراجع العميل';

  @override
  String get customerRecommendations => 'توصيات العميل';

  @override
  String get customerReferrals => 'إحالات العميل';

  @override
  String get customerPartnerships => 'شراكات العميل';

  @override
  String get customerContracts => 'عقود العميل';

  @override
  String get customerAgreements => 'اتفاقيات العميل';

  @override
  String get customerTerms => 'شروط العميل';

  @override
  String get customerPolicies => 'سياسات العميل';

  @override
  String get customerProcedures => 'إجراءات العميل';

  @override
  String get customerGuidelines => 'إرشادات العميل';

  @override
  String get customerStandards => 'معايير العميل';

  @override
  String get customerRequirements => 'متطلبات العميل';

  @override
  String get customerSpecifications => 'مواصفات العميل';

  @override
  String get customerExpectations => 'توقعات العميل';

  @override
  String get customerGoals => 'أهداف العميل';

  @override
  String get customerObjectives => 'أهداف العميل';

  @override
  String get customerTargets => 'أهداف العميل';

  @override
  String get customerMilestones => 'معالم العميل';

  @override
  String get customerDeadlines => 'مواعيد العميل';

  @override
  String get customerSchedules => 'جداول العميل';

  @override
  String get customerTimelines => 'الجدول الزمني';

  @override
  String get customerCalendars => 'تقويمات العميل';

  @override
  String get customerEvents => 'أحداث العميل';

  @override
  String get customerActivities => 'أنشطة العميل';

  @override
  String get customerTasks => 'مهام العميل';

  @override
  String get customerProjects => 'مشاريع العميل';

  @override
  String get customerCampaigns => 'حملات العميل';

  @override
  String get customerPromotions => 'عروض العميل';

  @override
  String get customerOffers => 'عروض العميل';

  @override
  String get customerDeals => 'صفقات العميل';

  @override
  String get customerSales => 'مبيعات العميل';

  @override
  String get customerRevenue => 'إيرادات العميل';

  @override
  String get customerProfit => 'ربح العميل';

  @override
  String get customerMargin => 'هامش العميل';

  @override
  String get customerCost => 'تكلفة العميل';

  @override
  String get customerExpense => 'مصروف العميل';

  @override
  String get customerInvestment => 'استثمار العميل';

  @override
  String get customerReturn => 'عائد العميل';

  @override
  String get customerRisk => 'مخاطر العميل';

  @override
  String get customerOpportunity => 'فرص العميل';

  @override
  String get customerThreat => 'تهديدات العميل';

  @override
  String get customerStrengths => 'نقاط القوة';

  @override
  String get customerWeaknesses => 'نقاط الضعف';

  @override
  String get customerOpportunities => 'الفرص';

  @override
  String get customerThreats => 'التهديدات';

  @override
  String get customerAnalysis => 'تحليل العميل';

  @override
  String get customerAssessment => 'تقييم العميل';

  @override
  String get customerEvaluation => 'تقييم العميل';

  @override
  String get customerReview => 'مراجعة العميل';

  @override
  String get customerAudit => 'تدقيق العميل';

  @override
  String get customerInspection => 'فحص العميل';

  @override
  String get customerVerification => 'التحقق من العميل';

  @override
  String get customerValidation => 'التحقق من صحة العميل';

  @override
  String get customerAuthentication => 'مصادقة العميل';

  @override
  String get customerAuthorization => 'تفويض العميل';

  @override
  String get customerPermission => 'إذن العميل';

  @override
  String get customerAccess => 'وصول العميل';

  @override
  String get customerSecurity => 'أمان العميل';

  @override
  String get customerPrivacy => 'خصوصية العميل';

  @override
  String get customerConfidentiality => 'سرية العميل';

  @override
  String get customerData => 'بيانات العميل';

  @override
  String get customerRecords => 'سجلات العميل';

  @override
  String get customerFiles => 'ملفات العميل';

  @override
  String get customerDocuments => 'وثائق العميل';

  @override
  String get customerArchives => 'أرشيف العميل';

  @override
  String get customerDatabase => 'قاعدة بيانات العميل';

  @override
  String get customerRepository => 'مستودع العميل';

  @override
  String get customerStorage => 'تخزين العميل';

  @override
  String get customerBackup => 'نسخ احتياطي للعميل';

  @override
  String get customerRecovery => 'استرداد العميل';

  @override
  String get customerRestore => 'استعادة العميل';

  @override
  String get customerMigration => 'هجرة العميل';

  @override
  String get customerIntegration => 'تكامل العميل';

  @override
  String get customerSynchronization => 'مزامنة العميل';

  @override
  String get customerReplication => 'نسخ العميل';

  @override
  String get customerDistribution => 'توزيع العميل';

  @override
  String get customerDeployment => 'نشر العميل';

  @override
  String get customerImplementation => 'تنفيذ العميل';

  @override
  String get customerInstallation => 'تثبيت العميل';

  @override
  String get customerConfiguration => 'تكوين العميل';

  @override
  String get customerCustomization => 'تخصيص العميل';

  @override
  String get customerPersonalization => 'تخصيص العميل';

  @override
  String get customerLocalization => 'محلية العميل';

  @override
  String get customerInternationalization => 'عولمة العميل';

  @override
  String get customerTranslation => 'ترجمة العميل';

  @override
  String get customerRegionalization => 'إقليمية العميل';

  @override
  String get customerGlobalization => 'عولمة العميل';

  @override
  String get customerMultilingual => 'متعدد اللغات';

  @override
  String get customerMulticultural => 'متعدد الثقافات';

  @override
  String get customerDiversity => 'تنوع العميل';

  @override
  String get customerInclusion => 'شمول العميل';

  @override
  String get customerEquity => 'إنصاف العميل';

  @override
  String get customerFairness => 'عدالة العميل';

  @override
  String get customerTransparency => 'شفافية العميل';

  @override
  String get customerAccountability => 'مساءلة العميل';

  @override
  String get customerResponsibility => 'مسؤولية العميل';

  @override
  String get customerLiability => 'مسؤولية العميل';

  @override
  String get customerObligation => 'التزام العميل';

  @override
  String get customerDuty => 'واجب العميل';

  @override
  String get customerCommitment => 'التزام العميل';

  @override
  String get customerPromise => 'وعد العميل';

  @override
  String get customerGuarantee => 'ضمان العميل';

  @override
  String get customerWarranty => 'ضمان العميل';

  @override
  String get customerAssurance => 'تأكيد العميل';

  @override
  String get customerConfidence => 'ثقة العميل';

  @override
  String get customerTrust => 'ثقة العميل';

  @override
  String get customerReliability => 'موثوقية العميل';

  @override
  String get customerDependability => 'اعتمادية العميل';

  @override
  String get customerConsistency => 'اتساق العميل';

  @override
  String get customerStability => 'استقرار العميل';

  @override
  String get customerPredictability => 'قابلية التنبؤ بالعميل';

  @override
  String get customerFlexibility => 'مرونة العميل';

  @override
  String get customerAdaptability => 'قابلية التكيف';

  @override
  String get customerScalability => 'قابلية التوسع';

  @override
  String get customerSustainability => 'استدامة العميل';

  @override
  String get customerGrowth => 'نمو العميل';

  @override
  String get customerDevelopment => 'تطوير العميل';

  @override
  String get customerImprovement => 'تحسين العميل';

  @override
  String get customerEnhancement => 'تحسين العميل';

  @override
  String get customerOptimization => 'تحسين العميل';

  @override
  String get customerEfficiency => 'كفاءة العميل';

  @override
  String get customerEffectiveness => 'فعالية العميل';

  @override
  String get customerProductivity => 'إنتاجية العميل';

  @override
  String get customerQuality => 'جودة العميل';

  @override
  String get customerExcellence => 'تميز العميل';

  @override
  String get customerInnovation => 'ابتكار العميل';

  @override
  String get customerCreativity => 'إبداع العميل';

  @override
  String get customerOriginality => 'أصالة العميل';

  @override
  String get customerUniqueness => 'تفرد العميل';

  @override
  String get customerDistinctiveness => 'تميز العميل';

  @override
  String get customerSpecialization => 'تخصص العميل';

  @override
  String get customerExpertise => 'خبرة العميل';

  @override
  String get customerKnowledge => 'معرفة العميل';

  @override
  String get customerSkills => 'مهارات العميل';

  @override
  String get customerAbilities => 'قدرات العميل';

  @override
  String get customerCapabilities => 'إمكانيات العميل';

  @override
  String get customerCompetencies => 'كفاءات العميل';

  @override
  String get customerQualifications => 'مؤهلات العميل';

  @override
  String get customerCredentials => 'أوراق اعتماد العميل';

  @override
  String get customerCertifications => 'شهادات العميل';

  @override
  String get customerLicenses => 'تراخيص العميل';

  @override
  String get customerPermits => 'تصاريح العميل';

  @override
  String get customerApprovals => 'موافقات العميل';

  @override
  String get customerAuthorizations => 'تفويضات العميل';

  @override
  String get customerEndorsements => 'تأييدات العميل';

  @override
  String get customerComments => 'تعليقات العميل';

  @override
  String get customerIdeas => 'أفكار العميل';

  @override
  String get customerProposals => 'اقتراحات العميل';

  @override
  String get customerPlans => 'خطط العميل';

  @override
  String get customerStrategies => 'استراتيجيات العميل';

  @override
  String get customerTactics => 'تكتيكات العميل';

  @override
  String get customerMethods => 'طرق العميل';

  @override
  String get customerApproaches => 'مناهج العميل';

  @override
  String get customerTechniques => 'تقنيات العميل';

  @override
  String get customerTools => 'أدوات العميل';

  @override
  String get customerAssets => 'أصول العميل';

  @override
  String get customerCapital => 'رأس مال العميل';

  @override
  String get customerFunding => 'تمويل العميل';

  @override
  String get customerFinancing => 'تمويل العميل';

  @override
  String get customerBudget => 'ميزانية العميل';

  @override
  String get customerPrice => 'سعر العميل';

  @override
  String get customerWorth => 'قيمة العميل';

  @override
  String get customerBenefit => 'فائدة العميل';

  @override
  String get customerAdvantage => 'ميزة العميل';

  @override
  String get customerGain => 'مكسب العميل';

  @override
  String get customerIncome => 'دخل العميل';

  @override
  String get customerEarnings => 'أرباح العميل';

  @override
  String get customerSavings => 'مدخرات العميل';

  @override
  String get customerWealth => 'ثروة العميل';

  @override
  String get customerFortune => 'ثروة العميل';

  @override
  String get customerAchievement => 'إنجاز العميل';

  @override
  String get customerAccomplishment => 'إنجاز العميل';

  @override
  String get customerVictory => 'انتصار العميل';

  @override
  String get customerTriumph => 'انتصار العميل';

  @override
  String get customerWin => 'فوز العميل';

  @override
  String get customerEdge => 'ميزة العميل';

  @override
  String get customerSuperiority => 'تفوق العميل';

  @override
  String get customerPerfection => 'كمال العميل';

  @override
  String get customerFlawlessness => 'كمال العميل';

  @override
  String get customerIdeal => 'مثالي العميل';

  @override
  String get customerOptimal => 'أمثل العميل';

  @override
  String get customerBest => 'أفضل العميل';

  @override
  String get customerTop => 'أعلى العميل';

  @override
  String get customerHighest => 'أعلى العميل';

  @override
  String get customerMaximum => 'أقصى العميل';

  @override
  String get customerPeak => 'ذروة العميل';

  @override
  String get customerSummit => 'قمة العميل';

  @override
  String get customerPinnacle => 'قمة العميل';

  @override
  String get customerCrown => 'تاج العميل';

  @override
  String get customerJewel => 'جوهرة العميل';

  @override
  String get customerGem => 'جوهرة العميل';

  @override
  String get customerTreasure => 'كنز العميل';

  @override
  String get customerGold => 'ذهب العميل';

  @override
  String get customerDiamond => 'ماس العميل';

  @override
  String get customerPearl => 'لؤلؤة العميل';

  @override
  String get customerRuby => 'ياقوت العميل';

  @override
  String get customerEmerald => 'زمرد العميل';

  @override
  String get customerSapphire => 'ياقوت أزرق العميل';

  @override
  String get customerAmethyst => 'أرجواني العميل';

  @override
  String get customerTopaz => 'توباز العميل';

  @override
  String get customerGarnet => 'العقيق العميل';

  @override
  String get customerOpal => 'أوبال العميل';

  @override
  String get customerTurquoise => 'فيروز العميل';

  @override
  String get customerCoral => 'مرجان العميل';

  @override
  String get customerJade => 'يشم العميل';

  @override
  String get customerAgate => 'عقيق العميل';

  @override
  String get customerOnyx => 'عقيق أسود العميل';

  @override
  String get customerQuartz => 'كوارتز العميل';

  @override
  String get customerCrystal => 'كريستال العميل';

  @override
  String get customerAmber => 'كهرمان العميل';

  @override
  String get customerJet => 'جيت العميل';

  @override
  String get customerIvory => 'عاج العميل';

  @override
  String get customerBone => 'عظم العميل';

  @override
  String get customerWood => 'خشب العميل';

  @override
  String get customerStone => 'حجر العميل';

  @override
  String get customerRock => 'صخر العميل';

  @override
  String get customerMetal => 'معدن العميل';

  @override
  String get customerIron => 'حديد العميل';

  @override
  String get customerSteel => 'صلب العميل';

  @override
  String get customerCopper => 'نحاس العميل';

  @override
  String get customerBronze => 'برونزي العميل';

  @override
  String get customerSilver => 'فضة العميل';

  @override
  String get customerPlatinum => 'بلاتين العميل';

  @override
  String get customerTitanium => 'تيتانيوم العميل';

  @override
  String get customerAluminum => 'ألومنيوم العميل';

  @override
  String get customerZinc => 'زنك العميل';

  @override
  String get customerLead => 'رصاص العميل';

  @override
  String get customerTin => 'قصدير العميل';

  @override
  String get customerNickel => 'نيكل العميل';

  @override
  String get customerChromium => 'كروم العميل';

  @override
  String get customerManganese => 'منجنيز العميل';

  @override
  String get customerCobalt => 'كوبالت العميل';

  @override
  String get customerVanadium => 'فاناديوم العميل';

  @override
  String get customerTungsten => 'تنجستن العميل';

  @override
  String get customerMolybdenum => 'موليبدينوم العميل';

  @override
  String get customerTantalum => 'تانتالوم العميل';

  @override
  String get customerNiobium => 'نيوبيوم العميل';

  @override
  String get customerHafnium => 'هافنيوم العميل';

  @override
  String get customerZirconium => 'زركونيوم العميل';

  @override
  String get customerRuthenium => 'روثينيوم العميل';

  @override
  String get customerRhodium => 'روديوم العميل';

  @override
  String get customerPalladium => 'بالاديوم العميل';

  @override
  String get customerOsmium => 'أوزميوم العميل';

  @override
  String get customerIridium => 'إيريديوم العميل';

  @override
  String get customerRhenium => 'رينيوم العميل';

  @override
  String get customerTechnetium => 'تكنيتيوم العميل';

  @override
  String get customerPromethium => 'بروميثيوم العميل';

  @override
  String get customerPolonium => 'بولونيوم العميل';

  @override
  String get customerAstatine => 'أستاتين العميل';

  @override
  String get customerRadon => 'رادون العميل';

  @override
  String get customerFrancium => 'فرانسيوم العميل';

  @override
  String get customerRadium => 'راديوم العميل';

  @override
  String get customerActinium => 'أكتينيوم العميل';

  @override
  String get customerThorium => 'ثوريوم العميل';

  @override
  String get customerProtactinium => 'بروتاكتينيوم العميل';

  @override
  String get customerUranium => 'يورانيوم العميل';

  @override
  String get customerNeptunium => 'نيبتونيوم العميل';

  @override
  String get customerPlutonium => 'بلوتونيوم العميل';

  @override
  String get customerAmericium => 'أمريكيوم العميل';

  @override
  String get customerCurium => 'كوريوم العميل';

  @override
  String get customerBerkelium => 'بيركيليوم العميل';

  @override
  String get customerCalifornium => 'كاليفورنيوم العميل';

  @override
  String get customerEinsteinium => 'أينشتاينيوم العميل';

  @override
  String get customerFermium => 'فيرميوم العميل';

  @override
  String get customerMendelevium => 'مندليفيوم العميل';

  @override
  String get customerNobelium => 'نوبليوم العميل';

  @override
  String get customerLawrencium => 'لورنسيوم العميل';

  @override
  String get customerRutherfordium => 'رذرفورديوم العميل';

  @override
  String get customerDubnium => 'دوبنيوم العميل';

  @override
  String get customerSeaborgium => 'سيبورغيوم العميل';

  @override
  String get customerBohrium => 'بوريوم العميل';

  @override
  String get customerHassium => 'هاسيوم العميل';

  @override
  String get customerMeitnerium => 'مايتنريوم العميل';

  @override
  String get customerDarmstadtium => 'دارمشتاتيوم العميل';

  @override
  String get customerRoentgenium => 'رونتجينيوم العميل';

  @override
  String get customerCopernicium => 'كوبرنيسيوم العميل';

  @override
  String get customerNihonium => 'نيهونيوم العميل';

  @override
  String get customerFlerovium => 'فليروفيوم العميل';

  @override
  String get customerMoscovium => 'موسكوفيوم العميل';

  @override
  String get customerLivermorium => 'ليفرموريوم العميل';

  @override
  String get customerTennessine => 'تينيسين العميل';

  @override
  String get customerOganesson => 'أوجانيسون العميل';

  @override
  String get filterCustomers => 'فلترة العملاء';

  @override
  String get filters => 'الفلاتر';

  @override
  String get sortBy => 'ترتيب حسب';

  @override
  String get sortOrder => 'اتجاه الترتيب';

  @override
  String get sortByName => 'الاسم';

  @override
  String get sortByEmail => 'البريد الإلكتروني';

  @override
  String get sortByCreatedAt => 'تاريخ الإنشاء';

  @override
  String get sortByUpdatedAt => 'تاريخ التحديث';

  @override
  String get ascending => 'تصاعدي';

  @override
  String get descending => 'تنازلي';

  @override
  String get applyFilters => 'تطبيق الفلاتر';

  @override
  String get resetFilters => 'إعادة تعيين';

  @override
  String get activeStatus => 'نشط';

  @override
  String get inactiveStatus => 'غير نشط';
}
