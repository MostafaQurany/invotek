// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ar';

  static String m0(version, build) => "الإصدار ${version} (Build ${build})";

  static String m1(name) => "هل أنت متأكد من حذف \"${name}\"؟";

  static String m2(name) => "هل أنت متأكد من حذف العميل \"${name}\"؟";

  static String m3(phone) => "جاري الاتصال بـ ${phone}";

  static String m4(number) => "تغيير طريقة الدفع للفاتورة ${number}";

  static String m5(name) => "هل أنت متأكد من حذف العميل \"${name}\"?";

  static String m6(name) => "تم إنشاء العميل \"${name}\" بنجاح";

  static String m7(name) => "تم تحديث العميل \"${name}\" بنجاح";

  static String m8(error) => "خطأ في تحويل البيانات: ${error}";

  static String m9(name) => "هل أنت متأكد من حذف الفئة \"${name}\"؟";

  static String m10(name) => "هل أنت متأكد من حذف العميل \"${name}\"؟";

  static String m11(name) => "هل أنت متأكد من حذف المنتج \"${name}\"؟";

  static String m12(name) => "هل أنت متأكد من حذف المستخدم ${name}؟";

  static String m13(number) => "تكرار الفاتورة ${number}";

  static String m14(name) => "قم بتعديل بيانات العميل \"${name}\"";

  static String m15(error) => "حدث خطأ أثناء إنشاء العميل: ${error}";

  static String m16(error) => "فشل في إنشاء الملف: ${error}";

  static String m17(error) => "حدث خطأ أثناء حذف العميل: ${error}";

  static String m18(error) => "حدث خطأ أثناء حذف العملاء: ${error}";

  static String m19(error) => "فشل في حذف الفاتورة: ${error}";

  static String m20(error) => "حدث خطأ أثناء تحميل العملاء: ${error}";

  static String m21(error) => "حدث خطأ أثناء تحميل الإحصائيات: ${error}";

  static String m22(error) => "حدث خطأ: ${error}";

  static String m23(error) => "حدث خطأ ${error}";

  static String m24(error) => "فشل في طباعة الفاتورة: ${error}";

  static String m25(error) => "فشل في إرسال الفاتورة: ${error}";

  static String m26(error) => "فشل في مشاركة الفاتورة: ${error}";

  static String m27(error) => "حدث خطأ أثناء تحديث العميل: ${error}";

  static String m28(error) => "حدث خطأ أثناء تحديث حالة العملاء: ${error}";

  static String m29(error) => "فشل في تحديث الحالة: ${error}";

  static String m30(error) => "فشل في إضافة الدور: ${error}";

  static String m31(error) => "فشل في حذف الدور: ${error}";

  static String m32(error) => "فشل في تحميل الأدوار والصلاحيات: ${error}";

  static String m33(error) => "فشل في تحميل صلاحيات المستخدم: ${error}";

  static String m34(error) => "فشل في تحديث الدور: ${error}";

  static String m35(error) => "فشل في تحديث صلاحيات المستخدم: ${error}";

  static String m36(number, timestamp) => "فاتورة_${number}_${timestamp}";

  static String m37(path) => "تم حفظ الملف في: ${path}";

  static String m38(number) => "رقم الفاتورة: ${number}";

  static String m39(status) => "تم تحديث حالة الفاتورة إلى: ${status}";

  static String m40(name, quantity, price, total) =>
      "${name}\t\t${quantity}\t${price}\t${total}";

  static String m41(name) => "جاري تحميل تفاصيل المنتج...";

  static String m42(email) => "جاري فتح البريد الإلكتروني إلى ${email}";

  static String m43(separator, number, date, status, customer, contact, items,
          subtotal, tax, total) =>
      "فاتورة\n${separator}\nرقم الفاتورة: ${number}\nالتاريخ: ${date}\nالحالة: ${status}\n\nبيانات العميل:\nالاسم: ${customer}\n${contact}\n\nعناصر الفاتورة:\n${items}\n\nالمجاميع:\nالمجموع الفرعي: ${subtotal} ر.س\n${tax}\nالمجموع الكلي: ${total} ر.س\n\n${separator}\nشكراً لتعاملكم معنا\nتم إنشاء هذه الفاتورة بواسطة تطبيق Invotek\n${separator}";

  static String m44(number, customer, date, amount, status) =>
      "فاتورة رقم: ${number}\nالعميل: ${customer}\nالتاريخ: ${date}\nالمبلغ: ${amount} ر.س\nالحالة: ${status}\n\nتم إنشاؤها بواسطة تطبيق Invotek";

  static String m45(count) => "إظهار جميع العناصر (${count})";

  static String m46(status) => "الحالة: ${status}";

  static String m47(amount) => "المجموع الفرعي: ${amount} ر.س";

  static String m48(amount) => "الضريبة: ${amount} ر.س";

  static String m49(number) => "معرف الضريبة للفاتورة ${number}:";

  static String m50(amount) => "المجموع الكلي: ${amount} ر.س";

  static String m51(name) => "عرض تفاصيل العميل: ${name}";

  static String m52(name) => "عرض تفاصيل العنصر: ${name}";

  static String m53(name) => "عرض الفواتير لـ ${name}";

  static String m54(name) => "عرض الطلبات لـ ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "accountant": MessageLookupByLibrary.simpleMessage("محاسب"),
        "accountantDescription": MessageLookupByLibrary.simpleMessage(
            "يدير الفواتير والمصروفات والتقارير المالية"),
        "active": MessageLookupByLibrary.simpleMessage("نشط"),
        "add": MessageLookupByLibrary.simpleMessage("إضافة"),
        "addANewUser":
            MessageLookupByLibrary.simpleMessage("إضافة مستخدم جديد"),
        "addAndEditCustomers":
            MessageLookupByLibrary.simpleMessage("إضافة وتعديل وحذف العملاء"),
        "addCategory": MessageLookupByLibrary.simpleMessage("إضافة فئة"),
        "addClient": MessageLookupByLibrary.simpleMessage("إضافة العميل"),
        "addClientDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية إضافة عميل جديد"),
        "addCustomer": MessageLookupByLibrary.simpleMessage("إضافة عميل"),
        "addEditDeleteCustomers":
            MessageLookupByLibrary.simpleMessage("إضافة وتعديل وحذف العملاء"),
        "addExpense": MessageLookupByLibrary.simpleMessage("إضافة مصروف"),
        "addExpenseDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية إضافة مصروف جديد"),
        "addExpenseHelp":
            MessageLookupByLibrary.simpleMessage("مساعدة في إضافة المصروف"),
        "addExpenseHelpDescription": MessageLookupByLibrary.simpleMessage(
            "يسمح لك هذا الشاشة بإنشاء وتتبع المصروفات التجارية. هذا ما يمكنك فعله:"),
        "addFirstInvoice":
            MessageLookupByLibrary.simpleMessage("إضافة أول فاتورة"),
        "addInvoice": MessageLookupByLibrary.simpleMessage("إضافة فاتورة"),
        "addItemsToInvoice":
            MessageLookupByLibrary.simpleMessage("إضافة عناصر للفاتورة"),
        "addNewClient": MessageLookupByLibrary.simpleMessage("إضافة عميل جديد"),
        "addNewCustomer":
            MessageLookupByLibrary.simpleMessage("إضافة عميل جديد"),
        "addNewExpenseCategory":
            MessageLookupByLibrary.simpleMessage("إضافة فئة مصروفات جديدة"),
        "addNewRole": MessageLookupByLibrary.simpleMessage("إضافة دور جديد"),
        "addNewUserMessage": MessageLookupByLibrary.simpleMessage(
            "اضغط على زر الإضافة لإنشاء مستخدم جديد"),
        "addNotes": MessageLookupByLibrary.simpleMessage("إضافة ملاحظات"),
        "addProduct": MessageLookupByLibrary.simpleMessage("إضافة منتج"),
        "addProductDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية إضافة منتج جديد"),
        "addReferenceNumberAndNotes":
            MessageLookupByLibrary.simpleMessage("إضافة رقم المرجع والملاحظات"),
        "addUser": MessageLookupByLibrary.simpleMessage("إضافة مستخدم"),
        "addUserDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية إضافة مستخدم جديد"),
        "additionalInfo":
            MessageLookupByLibrary.simpleMessage("معلومات إضافية"),
        "additionalInformation":
            MessageLookupByLibrary.simpleMessage("معلومات إضافية"),
        "additionalSettings":
            MessageLookupByLibrary.simpleMessage("إعدادات إضافية"),
        "address": MessageLookupByLibrary.simpleMessage("العنوان"),
        "addressInformation":
            MessageLookupByLibrary.simpleMessage("معلومات العنوان"),
        "admin": MessageLookupByLibrary.simpleMessage("مدير"),
        "advancedTechCompany":
            MessageLookupByLibrary.simpleMessage("شركة التقنية المتقدمة"),
        "all": MessageLookupByLibrary.simpleMessage("الكل"),
        "allCategories": MessageLookupByLibrary.simpleMessage("جميع الفئات"),
        "allCategoriesDeletedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم حذف جميع الفئات بنجاح"),
        "allCustomers": MessageLookupByLibrary.simpleMessage("جميع العملاء"),
        "allPaymentMethods":
            MessageLookupByLibrary.simpleMessage("جميع طرق الدفع"),
        "allStatus": MessageLookupByLibrary.simpleMessage("جميع الحالات"),
        "allStatuses": MessageLookupByLibrary.simpleMessage("جميع الحالات"),
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("لديك حساب؟"),
        "amount": MessageLookupByLibrary.simpleMessage("المبلغ"),
        "amountHelperText": MessageLookupByLibrary.simpleMessage(
            "أدخل إجمالي المبلغ المنفق بما في ذلك الضرائب"),
        "amountHint": MessageLookupByLibrary.simpleMessage("0.00"),
        "amountInformation":
            MessageLookupByLibrary.simpleMessage("معلومات المبلغ"),
        "amountIsRequired":
            MessageLookupByLibrary.simpleMessage("المبلغ مطلوب"),
        "appInfo": MessageLookupByLibrary.simpleMessage("معلومات التطبيق"),
        "appVersionWithBuild": m0,
        "apply": MessageLookupByLibrary.simpleMessage("تطبيق"),
        "applyTaxToProduct": MessageLookupByLibrary.simpleMessage(
            "تطبيق الضريبة على هذا المنتج"),
        "arabic": MessageLookupByLibrary.simpleMessage("العربية"),
        "areYouSureDelete": m1,
        "areYouSureDeleteClient": m2,
        "authError": MessageLookupByLibrary.simpleMessage(
            "فشل في تسجيل الدخول. يرجى التحقق من البريد الإلكتروني وكلمة المرور."),
        "available": MessageLookupByLibrary.simpleMessage("متوفر"),
        "backToCategories":
            MessageLookupByLibrary.simpleMessage("العودة للفئات"),
        "backup": MessageLookupByLibrary.simpleMessage("النسخ الاحتياطي"),
        "bankTransfer": MessageLookupByLibrary.simpleMessage("تحويل بنكي"),
        "barcode": MessageLookupByLibrary.simpleMessage("الباركود"),
        "basicInformation":
            MessageLookupByLibrary.simpleMessage("المعلومات الأساسية"),
        "boughtThis": MessageLookupByLibrary.simpleMessage("تم شراؤها"),
        "brand": MessageLookupByLibrary.simpleMessage("العلامة التجارية"),
        "buttonPressed":
            MessageLookupByLibrary.simpleMessage("تم الضغط على الزر العادي"),
        "buttons": MessageLookupByLibrary.simpleMessage("الأزرار"),
        "calling": m3,
        "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
        "cannotOpenEmailApp": MessageLookupByLibrary.simpleMessage(
            "لا يمكن فتح تطبيق البريد الإلكتروني"),
        "cannotOpenWebsite": MessageLookupByLibrary.simpleMessage(
            "لا يمكن فتح الموقع الإلكتروني"),
        "card": MessageLookupByLibrary.simpleMessage("بطاقة"),
        "cardPressed":
            MessageLookupByLibrary.simpleMessage("تم الضغط على البطاقة"),
        "cards": MessageLookupByLibrary.simpleMessage("البطاقات"),
        "cash": MessageLookupByLibrary.simpleMessage("نقدي"),
        "categories": MessageLookupByLibrary.simpleMessage("الفئات"),
        "categoriesAppbar":
            MessageLookupByLibrary.simpleMessage("فئات المنتجات"),
        "categorization": MessageLookupByLibrary.simpleMessage("التصنيف"),
        "category": MessageLookupByLibrary.simpleMessage("الفئة"),
        "categoryAddedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم إضافة الفئة بنجاح"),
        "categoryCreatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم إنشاء الفئة بنجاح"),
        "categoryDeletedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم حذف الفئة بنجاح"),
        "categoryDescription":
            MessageLookupByLibrary.simpleMessage("وصف الفئة"),
        "categoryName": MessageLookupByLibrary.simpleMessage("اسم الفئة"),
        "categoryNameRequired":
            MessageLookupByLibrary.simpleMessage("اسم الفئة مطلوب"),
        "categoryPreview": MessageLookupByLibrary.simpleMessage("معاينة الفئة"),
        "categoryUpdatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم تحديث الفئة بنجاح"),
        "centimeters": MessageLookupByLibrary.simpleMessage("سم"),
        "changePaymentMethod":
            MessageLookupByLibrary.simpleMessage("تغيير طريقة الدفع"),
        "changePaymentMethodForInvoice": m4,
        "changeStatus": MessageLookupByLibrary.simpleMessage("تغيير الحالة"),
        "check": MessageLookupByLibrary.simpleMessage("شيك"),
        "chooseFeature": MessageLookupByLibrary.simpleMessage(
            "اختر الميزة التي تريد إدارتها"),
        "city": MessageLookupByLibrary.simpleMessage("المدينة"),
        "clearFilters": MessageLookupByLibrary.simpleMessage("مسح المرشحات"),
        "clientAddedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم إضافة العميل بنجاح"),
        "clientDetails": MessageLookupByLibrary.simpleMessage("تفاصيل العميل"),
        "clientName": MessageLookupByLibrary.simpleMessage("اسم العميل"),
        "clientUpdatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم تحديث العميل بنجاح"),
        "clientsList": MessageLookupByLibrary.simpleMessage("قائمة العملاء"),
        "clientsManagement":
            MessageLookupByLibrary.simpleMessage("إدارة العملاء"),
        "clientsProducts":
            MessageLookupByLibrary.simpleMessage("العملاء والمنتجات"),
        "clientsProductsDesc":
            MessageLookupByLibrary.simpleMessage("التحكم في العملاء والمنتجات"),
        "clientsProductsTitle":
            MessageLookupByLibrary.simpleMessage("العملاء والمنتجات"),
        "close": MessageLookupByLibrary.simpleMessage("إغلاق"),
        "color": MessageLookupByLibrary.simpleMessage("اللون"),
        "company": MessageLookupByLibrary.simpleMessage("الشركة"),
        "companyAddress": MessageLookupByLibrary.simpleMessage("عنوان الشركة"),
        "companyAddressRequired":
            MessageLookupByLibrary.simpleMessage("عنوان الشركة مطلوب"),
        "companyEmail": MessageLookupByLibrary.simpleMessage("بريد الشركة"),
        "companyEmailInvalid":
            MessageLookupByLibrary.simpleMessage("بريد الشركة غير صحيح"),
        "companyEmailRequired":
            MessageLookupByLibrary.simpleMessage("بريد الشركة مطلوب"),
        "companyInformation":
            MessageLookupByLibrary.simpleMessage("معلومات الشركة"),
        "companyName": MessageLookupByLibrary.simpleMessage("اسم الشركة"),
        "companyNameRequired":
            MessageLookupByLibrary.simpleMessage("اسم الشركة مطلوب"),
        "companyPhone": MessageLookupByLibrary.simpleMessage("هاتف الشركة"),
        "companyPhoneRequired":
            MessageLookupByLibrary.simpleMessage("هاتف الشركة مطلوب"),
        "companySettings":
            MessageLookupByLibrary.simpleMessage("إعدادات الشركة"),
        "companySettingsDescription": MessageLookupByLibrary.simpleMessage(
            "إمكانية تعديل إعدادات الشركة"),
        "completeRequiredFields":
            MessageLookupByLibrary.simpleMessage("أكمل الحقول المطلوبة"),
        "configureTaxIntegration":
            MessageLookupByLibrary.simpleMessage("تكوين التكامل الضريبي"),
        "confirmDelete": MessageLookupByLibrary.simpleMessage("تأكيد الحذف"),
        "confirmDeleteCustomer":
            MessageLookupByLibrary.simpleMessage("تأكيد الحذف"),
        "confirmDeleteCustomerMessage": m5,
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("تأكيد كلمة المرور"),
        "confirmPasswordRequired":
            MessageLookupByLibrary.simpleMessage("تأكيد كلمة المرور مطلوب"),
        "constructionDevelopmentCompany":
            MessageLookupByLibrary.simpleMessage("شركة البناء والتطوير"),
        "contactInfo": MessageLookupByLibrary.simpleMessage("معلومات الاتصال"),
        "contactInformation":
            MessageLookupByLibrary.simpleMessage("معلومات الاتصال"),
        "contactPersonEmail":
            MessageLookupByLibrary.simpleMessage("بريد شخص الاتصال"),
        "contactPersonInformation":
            MessageLookupByLibrary.simpleMessage("معلومات شخص الاتصال"),
        "contactPersonName":
            MessageLookupByLibrary.simpleMessage("اسم شخص الاتصال"),
        "contactPersonPhone":
            MessageLookupByLibrary.simpleMessage("هاتف شخص الاتصال"),
        "contactUsForSupport": MessageLookupByLibrary.simpleMessage(
            "تواصل معنا للحصول على المساعدة"),
        "copiedToClipboard":
            MessageLookupByLibrary.simpleMessage("تم النسخ إلى الحافظة"),
        "copy": MessageLookupByLibrary.simpleMessage("نسخ"),
        "costPrice": MessageLookupByLibrary.simpleMessage("سعر التكلفة"),
        "country": MessageLookupByLibrary.simpleMessage("البلد"),
        "create": MessageLookupByLibrary.simpleMessage("إنشاء"),
        "createAnAccount": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
        "createAndEditInvoices":
            MessageLookupByLibrary.simpleMessage("إنشاء وتعديل الفواتير"),
        "createEditInvoices":
            MessageLookupByLibrary.simpleMessage("إنشاء وتعديل الفواتير"),
        "createExpense": MessageLookupByLibrary.simpleMessage("إنشاء مصروف"),
        "createInvoice": MessageLookupByLibrary.simpleMessage("إنشاء فاتورة"),
        "createInvoiceDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية إنشاء فاتورة جديدة"),
        "createInvoiceStep1": MessageLookupByLibrary.simpleMessage(
            "1. أدخل معلومات العميل الأساسية"),
        "createInvoiceStep2":
            MessageLookupByLibrary.simpleMessage("2. أضف العناصر والكميات"),
        "createInvoiceStep3":
            MessageLookupByLibrary.simpleMessage("3. حدد طريقة الدفع والتاريخ"),
        "createInvoiceStep4":
            MessageLookupByLibrary.simpleMessage("4. راجع الفاتورة واحفظها"),
        "createNewInvoice":
            MessageLookupByLibrary.simpleMessage("إنشاء فاتورة جديدة"),
        "createYourFirstExpenseCategory":
            MessageLookupByLibrary.simpleMessage("إنشاء فئة مصروفات جديدة"),
        "createdAt": MessageLookupByLibrary.simpleMessage("تاريخ الإنشاء"),
        "createdBy": MessageLookupByLibrary.simpleMessage("أنشأ بواسطة"),
        "createdByInvotek": MessageLookupByLibrary.simpleMessage(
            "تم إنشاء هذه الفاتورة بواسطة تطبيق Invotek"),
        "createdDate": MessageLookupByLibrary.simpleMessage("تاريخ الإنشاء"),
        "creatingFile":
            MessageLookupByLibrary.simpleMessage("جاري إنشاء ملف..."),
        "creatingInvoices":
            MessageLookupByLibrary.simpleMessage("إنشاء الفواتير"),
        "creationDate": MessageLookupByLibrary.simpleMessage("تاريخ الإنشاء"),
        "creditCard": MessageLookupByLibrary.simpleMessage("بطاقة ائتمان"),
        "customer": MessageLookupByLibrary.simpleMessage("العميل"),
        "customerAdditionalInfo":
            MessageLookupByLibrary.simpleMessage("معلومات إضافية"),
        "customerAddress": MessageLookupByLibrary.simpleMessage("عنوان العميل"),
        "customerBasicInfo":
            MessageLookupByLibrary.simpleMessage("معلومات العميل"),
        "customerBasicInfoSection":
            MessageLookupByLibrary.simpleMessage("المعلومات الأساسية"),
        "customerCity": MessageLookupByLibrary.simpleMessage("المدينة"),
        "customerCommercialRegister":
            MessageLookupByLibrary.simpleMessage("رقم السجل التجاري"),
        "customerCompanyName":
            MessageLookupByLibrary.simpleMessage("اسم الشركة/المؤسسة"),
        "customerCreatedSuccessfully": m6,
        "customerDataCopied": MessageLookupByLibrary.simpleMessage(
            "تم نسخ بيانات العميل إلى الحافظة"),
        "customerDeletedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم حذف العميل بنجاح"),
        "customerDetailedAddress":
            MessageLookupByLibrary.simpleMessage("العنوان التفصيلي"),
        "customerDetails":
            MessageLookupByLibrary.simpleMessage("تفاصيل العميل"),
        "customerEmail": MessageLookupByLibrary.simpleMessage("بريد العميل"),
        "customerInformation":
            MessageLookupByLibrary.simpleMessage("معلومات العميل"),
        "customerManagement":
            MessageLookupByLibrary.simpleMessage("إدارة العملاء"),
        "customerName": MessageLookupByLibrary.simpleMessage("اسم العميل"),
        "customerNameRequired":
            MessageLookupByLibrary.simpleMessage("اسم العميل مطلوب"),
        "customerNotes": MessageLookupByLibrary.simpleMessage("ملاحظات"),
        "customerPhone": MessageLookupByLibrary.simpleMessage("هاتف العميل"),
        "customerPhoneRequired":
            MessageLookupByLibrary.simpleMessage("رقم الهاتف مطلوب"),
        "customerPostalCode":
            MessageLookupByLibrary.simpleMessage("الرمز البريدي"),
        "customerRegion":
            MessageLookupByLibrary.simpleMessage("المنطقة/المحافظة"),
        "customerResponsiblePerson":
            MessageLookupByLibrary.simpleMessage("الشخص المسؤول"),
        "customerStatus": MessageLookupByLibrary.simpleMessage("الحالة"),
        "customerStatusActive": MessageLookupByLibrary.simpleMessage("نشط"),
        "customerStatusInactive":
            MessageLookupByLibrary.simpleMessage("غير نشط"),
        "customerTaxNumber":
            MessageLookupByLibrary.simpleMessage("الرقم الضريبي"),
        "customerUpdatedSuccessfully": m7,
        "customers": MessageLookupByLibrary.simpleMessage("العملاء"),
        "customersList": MessageLookupByLibrary.simpleMessage("قائمة العملاء"),
        "customersManagement": MessageLookupByLibrary.simpleMessage("العملاء"),
        "customersReport":
            MessageLookupByLibrary.simpleMessage("تقرير العملاء"),
        "dark": MessageLookupByLibrary.simpleMessage("داكن"),
        "darkMode": MessageLookupByLibrary.simpleMessage("الوضع الداكن"),
        "darkModeDisabled":
            MessageLookupByLibrary.simpleMessage("تم إلغاء تفعيل الوضع الداكن"),
        "darkModeEnabled":
            MessageLookupByLibrary.simpleMessage("تم تفعيل الوضع الداكن"),
        "dataConversionError": m8,
        "date": MessageLookupByLibrary.simpleMessage("التاريخ"),
        "debitCard": MessageLookupByLibrary.simpleMessage("بطاقة ائتمان"),
        "delete": MessageLookupByLibrary.simpleMessage("حذف"),
        "deleteAllCategories":
            MessageLookupByLibrary.simpleMessage("حذف جميع الفئات"),
        "deleteCategory": MessageLookupByLibrary.simpleMessage("حذف الفئة"),
        "deleteCategoryConfirmation": m9,
        "deleteClient": MessageLookupByLibrary.simpleMessage("حذف عميل"),
        "deleteClientDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية حذف العميل"),
        "deleteConfirmation":
            MessageLookupByLibrary.simpleMessage("تأكيد الحذف"),
        "deleteCustomer": MessageLookupByLibrary.simpleMessage("حذف العميل"),
        "deleteCustomerConfirmation": m10,
        "deleteExpense": MessageLookupByLibrary.simpleMessage("حذف مصروف"),
        "deleteExpenseDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية حذف المصروف"),
        "deleteInvoice": MessageLookupByLibrary.simpleMessage("حذف الفاتورة"),
        "deleteInvoiceConfirmation":
            MessageLookupByLibrary.simpleMessage("تأكيد حذف الفاتورة"),
        "deleteInvoiceDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية حذف الفاتورة"),
        "deleteInvoiceWarning": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد من حذف هذه الفاتورة؟ لا يمكن التراجع عن هذا الإجراء."),
        "deleteProduct": MessageLookupByLibrary.simpleMessage("حذف منتج"),
        "deleteProductConfirmation": m11,
        "deleteProductDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية حذف المنتج"),
        "deleteUser": MessageLookupByLibrary.simpleMessage("حذف مستخدم"),
        "deleteUserConfirmation": m12,
        "deleteUserDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية حذف المستخدم"),
        "deleteUserPermanently":
            MessageLookupByLibrary.simpleMessage("حذف المستخدم نهائياً"),
        "deletingInvoice":
            MessageLookupByLibrary.simpleMessage("جاري حذف الفاتورة..."),
        "department": MessageLookupByLibrary.simpleMessage("القسم"),
        "description": MessageLookupByLibrary.simpleMessage("الوصف"),
        "descriptionHint": MessageLookupByLibrary.simpleMessage(
            "أضف المزيد من التفاصيل حول هذا المصروف"),
        "deviceInfo": MessageLookupByLibrary.simpleMessage("معلومات الجهاز"),
        "deviceType": MessageLookupByLibrary.simpleMessage("نوع الجهاز"),
        "dimensions": MessageLookupByLibrary.simpleMessage("الأبعاد"),
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("ليس لديك حساب؟"),
        "downloadPDF": MessageLookupByLibrary.simpleMessage("تحميل PDF"),
        "draft": MessageLookupByLibrary.simpleMessage("مسودة"),
        "duplicate": MessageLookupByLibrary.simpleMessage("نسخ"),
        "duplicateInvoice":
            MessageLookupByLibrary.simpleMessage("تكرار الفاتورة"),
        "duplicateInvoiceMessage": m13,
        "easyInvoiceCustomerManagement": MessageLookupByLibrary.simpleMessage(
            "إدارة الفواتير والعملاء بسهولة"),
        "ecommerceInstitution":
            MessageLookupByLibrary.simpleMessage("مؤسسة التجارة الإلكترونية"),
        "edit": MessageLookupByLibrary.simpleMessage("تعديل"),
        "editCategory": MessageLookupByLibrary.simpleMessage("تعديل الفئة"),
        "editClient": MessageLookupByLibrary.simpleMessage("تعديل العميل"),
        "editClientData": m14,
        "editClientDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية تعديل بيانات العميل"),
        "editCustomer": MessageLookupByLibrary.simpleMessage("تعديل العميل"),
        "editExpense": MessageLookupByLibrary.simpleMessage("تعديل مصروف"),
        "editExpenseCategory":
            MessageLookupByLibrary.simpleMessage("تعديل فئة المصروفات"),
        "editExpenseDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية تعديل المصروف"),
        "editInvoice": MessageLookupByLibrary.simpleMessage("تعديل فاتورة"),
        "editInvoiceDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية تعديل الفاتورة"),
        "editProduct": MessageLookupByLibrary.simpleMessage("تعديل منتج"),
        "editProductDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية تعديل بيانات المنتج"),
        "editRole": MessageLookupByLibrary.simpleMessage("تعديل الدور"),
        "editUser": MessageLookupByLibrary.simpleMessage("تعديل مستخدم"),
        "editUserDescription": MessageLookupByLibrary.simpleMessage(
            "إمكانية تعديل بيانات المستخدم"),
        "editUserInformation":
            MessageLookupByLibrary.simpleMessage("تعديل معلومات المستخدم"),
        "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
        "emailAddress":
            MessageLookupByLibrary.simpleMessage("عنوان البريد الإلكتروني"),
        "emailDetails":
            MessageLookupByLibrary.simpleMessage("تفاصيل البريد الإلكتروني"),
        "emailInvalid":
            MessageLookupByLibrary.simpleMessage("البريد الإلكتروني غير صحيح"),
        "emailRequired":
            MessageLookupByLibrary.simpleMessage("البريد الإلكتروني مطلوب"),
        "enableDarkMode":
            MessageLookupByLibrary.simpleMessage("تفعيل الوضع الداكن"),
        "enableDisableProduct":
            MessageLookupByLibrary.simpleMessage("تفعيل/إلغاء تفعيل المنتج"),
        "enableTaxIntegration":
            MessageLookupByLibrary.simpleMessage("تفعيل التكامل الضريبي"),
        "english": MessageLookupByLibrary.simpleMessage("الإنجليزية"),
        "enterAdditionalNotes":
            MessageLookupByLibrary.simpleMessage("أدخل ملاحظات إضافية"),
        "enterAddress": MessageLookupByLibrary.simpleMessage("أدخل العنوان"),
        "enterBarcode": MessageLookupByLibrary.simpleMessage("أدخل الباركود"),
        "enterCategoryDescription":
            MessageLookupByLibrary.simpleMessage("أدخل وصفاً مختصراً للفئة"),
        "enterCategoryName":
            MessageLookupByLibrary.simpleMessage("أدخل اسم الفئة"),
        "enterCity": MessageLookupByLibrary.simpleMessage("أدخل المدينة"),
        "enterClientAddress":
            MessageLookupByLibrary.simpleMessage("أدخل عنوان العميل"),
        "enterClientCompany":
            MessageLookupByLibrary.simpleMessage("أدخل اسم الشركة"),
        "enterClientEmail":
            MessageLookupByLibrary.simpleMessage("أدخل البريد الإلكتروني"),
        "enterClientName":
            MessageLookupByLibrary.simpleMessage("أدخل اسم العميل"),
        "enterClientPhone":
            MessageLookupByLibrary.simpleMessage("أدخل رقم الهاتف"),
        "enterCommercialRegister":
            MessageLookupByLibrary.simpleMessage("أدخل السجل التجاري"),
        "enterCompanyAddress":
            MessageLookupByLibrary.simpleMessage("أدخل عنوان الشركة"),
        "enterCompanyEmail":
            MessageLookupByLibrary.simpleMessage("أدخل بريد الشركة"),
        "enterCompanyName":
            MessageLookupByLibrary.simpleMessage("أدخل اسم الشركة"),
        "enterCompanyPhone":
            MessageLookupByLibrary.simpleMessage("أدخل هاتف الشركة"),
        "enterContactPersonEmail":
            MessageLookupByLibrary.simpleMessage("أدخل بريد شخص الاتصال"),
        "enterContactPersonName":
            MessageLookupByLibrary.simpleMessage("أدخل اسم شخص الاتصال"),
        "enterContactPersonPhone":
            MessageLookupByLibrary.simpleMessage("أدخل هاتف شخص الاتصال"),
        "enterCostPrice":
            MessageLookupByLibrary.simpleMessage("أدخل سعر التكلفة"),
        "enterCustomerEmail":
            MessageLookupByLibrary.simpleMessage("أدخل بريد العميل الإلكتروني"),
        "enterCustomerName":
            MessageLookupByLibrary.simpleMessage("أدخل اسم العميل"),
        "enterCustomerPhone":
            MessageLookupByLibrary.simpleMessage("أدخل هاتف العميل"),
        "enterDescription": MessageLookupByLibrary.simpleMessage("أدخل الوصف"),
        "enterDetailedAddress":
            MessageLookupByLibrary.simpleMessage("أدخل العنوان التفصيلي"),
        "enterEmail":
            MessageLookupByLibrary.simpleMessage("أدخل البريد الإلكتروني"),
        "enterEmailAddress": MessageLookupByLibrary.simpleMessage(
            "أدخل عنوان البريد الإلكتروني"),
        "enterExpenseTitleAndDescription":
            MessageLookupByLibrary.simpleMessage("أدخل عنوان المصروف والوصف"),
        "enterFullName":
            MessageLookupByLibrary.simpleMessage("أدخل الاسم الكامل"),
        "enterInvoiceNumber":
            MessageLookupByLibrary.simpleMessage("أدخل رقم الفاتورة"),
        "enterMessage": MessageLookupByLibrary.simpleMessage("أدخل الرسالة"),
        "enterNotes": MessageLookupByLibrary.simpleMessage("أدخل الملاحظات"),
        "enterPassword":
            MessageLookupByLibrary.simpleMessage("أدخل كلمة المرور"),
        "enterPhone": MessageLookupByLibrary.simpleMessage("أدخل الهاتف"),
        "enterPhoneNumber":
            MessageLookupByLibrary.simpleMessage("أدخل رقم الهاتف"),
        "enterPostalCode":
            MessageLookupByLibrary.simpleMessage("أدخل الرمز البريدي"),
        "enterProductDescription":
            MessageLookupByLibrary.simpleMessage("أدخل وصف المنتج"),
        "enterProductName":
            MessageLookupByLibrary.simpleMessage("أدخل اسم المنتج"),
        "enterProductSku":
            MessageLookupByLibrary.simpleMessage("أدخل رمز المنتج"),
        "enterQuantity": MessageLookupByLibrary.simpleMessage("أدخل الكمية"),
        "enterRegion": MessageLookupByLibrary.simpleMessage("أدخل المنطقة"),
        "enterResponsiblePerson":
            MessageLookupByLibrary.simpleMessage("أدخل الشخص المسؤول"),
        "enterSellingPrice":
            MessageLookupByLibrary.simpleMessage("أدخل سعر البيع"),
        "enterSubject": MessageLookupByLibrary.simpleMessage("أدخل الموضوع"),
        "enterSubtotal":
            MessageLookupByLibrary.simpleMessage("أدخل المجموع الفرعي"),
        "enterTaxAmount":
            MessageLookupByLibrary.simpleMessage("أدخل مبلغ الضريبة"),
        "enterTaxNumber":
            MessageLookupByLibrary.simpleMessage("أدخل الرقم الضريبي"),
        "enterTaxRatePercentage":
            MessageLookupByLibrary.simpleMessage("أدخل نسبة الضريبة"),
        "enterUsername":
            MessageLookupByLibrary.simpleMessage("أدخل اسم المستخدم"),
        "enterValidQuantity":
            MessageLookupByLibrary.simpleMessage("يرجى إدخال كمية صحيحة"),
        "enterVatNumber": MessageLookupByLibrary.simpleMessage(
            "أدخل رقم ضريبة القيمة المضافة"),
        "enterWebsite":
            MessageLookupByLibrary.simpleMessage("أدخل الموقع الإلكتروني"),
        "errorAddingCategory":
            MessageLookupByLibrary.simpleMessage("خطأ في إضافة الفئة"),
        "errorAddingProduct":
            MessageLookupByLibrary.simpleMessage("خطأ في إضافة المنتج"),
        "errorCreatingClient": m15,
        "errorCreatingFile": m16,
        "errorCreatingProduct":
            MessageLookupByLibrary.simpleMessage("حدث خطأ أثناء إنشاء المنتج"),
        "errorCreatingUser": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ أثناء إنشاء المستخدم: \$e"),
        "errorDeletingCategory":
            MessageLookupByLibrary.simpleMessage("خطأ في حذف الفئة"),
        "errorDeletingClient": m17,
        "errorDeletingClients": m18,
        "errorDeletingInvoice": m19,
        "errorDeletingProduct":
            MessageLookupByLibrary.simpleMessage("خطأ في حذف المنتج"),
        "errorDeletingUser":
            MessageLookupByLibrary.simpleMessage("خطأ في حذف المستخدم"),
        "errorLoadingCategories":
            MessageLookupByLibrary.simpleMessage("خطأ في تحميل الفئات"),
        "errorLoadingClients": m20,
        "errorLoadingInvoice":
            MessageLookupByLibrary.simpleMessage("خطأ في تحميل الفاتورة"),
        "errorLoadingProduct": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ أثناء تحميل بيانات المنتج"),
        "errorLoadingProducts": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ أثناء تحميل المنتجات"),
        "errorLoadingStatistics": m21,
        "errorLoadingUsers":
            MessageLookupByLibrary.simpleMessage("خطأ في تحميل المستخدمين"),
        "errorMessage": m22,
        "errorOccurred": m23,
        "errorParsingUserData": MessageLookupByLibrary.simpleMessage(
            "خطأ في معالجة بيانات المستخدم"),
        "errorPrintingInvoice": m24,
        "errorSendingInvoice": m25,
        "errorSharingInvoice": m26,
        "errorText": MessageLookupByLibrary.simpleMessage("نص خطأ"),
        "errorUpdatingCategory":
            MessageLookupByLibrary.simpleMessage("خطأ في تحديث الفئة"),
        "errorUpdatingClient": m27,
        "errorUpdatingClientStatus": m28,
        "errorUpdatingProduct":
            MessageLookupByLibrary.simpleMessage("حدث خطأ أثناء تحديث المنتج"),
        "errorUpdatingStatus": m29,
        "exampleEmail":
            MessageLookupByLibrary.simpleMessage("example@email.com"),
        "examplePhone": MessageLookupByLibrary.simpleMessage("0500000000"),
        "exitAppConfirmation":
            MessageLookupByLibrary.simpleMessage("إغلاق التطبيق"),
        "exitAppConfirmationMessage": MessageLookupByLibrary.simpleMessage(
            "هل أنت متأكد من إغلاق التطبيق؟"),
        "expenseCategories":
            MessageLookupByLibrary.simpleMessage("فئات المصروفات"),
        "expenseCreatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم إنشاء المصروف بنجاح!"),
        "expenseDate": MessageLookupByLibrary.simpleMessage("تاريخ المصروف"),
        "expenseDetails":
            MessageLookupByLibrary.simpleMessage("تفاصيل المصروف"),
        "expenseManagement":
            MessageLookupByLibrary.simpleMessage("إدارة المصروفات"),
        "expenseTitle": MessageLookupByLibrary.simpleMessage("عنوان المصروف"),
        "expenseTitleHint": MessageLookupByLibrary.simpleMessage(
            "مثال: مستلزمات مكتبية، مصروفات سفر"),
        "expenseUpdatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم تحديث المصروف بنجاح"),
        "expenses": MessageLookupByLibrary.simpleMessage("المصروفات"),
        "expensesDesc": MessageLookupByLibrary.simpleMessage(
            "فئات المصروفات وإدارة المصروفات"),
        "expensesList": MessageLookupByLibrary.simpleMessage("قائمة المصروفات"),
        "expensesManagement":
            MessageLookupByLibrary.simpleMessage("المصروفات وفئاتها"),
        "expensesReport":
            MessageLookupByLibrary.simpleMessage("تقرير المصروفات"),
        "expensesTitle": MessageLookupByLibrary.simpleMessage("المصروفات"),
        "exportReports": MessageLookupByLibrary.simpleMessage("تصدير التقارير"),
        "exportReportsDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية تصدير التقارير"),
        "failedToAddRole": m30,
        "failedToDeleteRole": m31,
        "failedToGetUserData": MessageLookupByLibrary.simpleMessage(
            "فشل في الحصول على بيانات المستخدم"),
        "failedToLoadRoles": m32,
        "failedToLoadUserPermissions": m33,
        "failedToUpdateRole": m34,
        "failedToUpdateUser":
            MessageLookupByLibrary.simpleMessage("فشل في تحديث المستخدم"),
        "failedToUpdateUserPermissions": m35,
        "fileName": m36,
        "fileSavedSuccessfully": m37,
        "fillAllRequiredFields": MessageLookupByLibrary.simpleMessage(
            "يرجى ملء جميع الحقول المطلوبة"),
        "fillFormToAddClient": MessageLookupByLibrary.simpleMessage(
            "املأ النموذج أدناه لإضافة عميل جديد للنظام"),
        "fillTheFormBelowToAddANewUserTo": MessageLookupByLibrary.simpleMessage(
            "املأ النموذج أدناه لإضافة مستخدم جديد للنظام"),
        "financialDetails":
            MessageLookupByLibrary.simpleMessage("التفاصيل المالية"),
        "financialInformation":
            MessageLookupByLibrary.simpleMessage("المعلومات المالية"),
        "financialServicesInstitution":
            MessageLookupByLibrary.simpleMessage("مؤسسة الخدمات المالية"),
        "formHelpDescription": MessageLookupByLibrary.simpleMessage(
            "هذا النموذج مقسم إلى ثلاث خطوات:\n\n1. المعلومات الأساسية\n2. معلومات العنوان\n3. المعلومات الإضافية"),
        "formHelpTitle":
            MessageLookupByLibrary.simpleMessage("نموذج تعديل العميل"),
        "fullName": MessageLookupByLibrary.simpleMessage("الاسم الكامل"),
        "googleSignInError":
            MessageLookupByLibrary.simpleMessage("خطأ في تسجيل الدخول بالجوجل"),
        "gotIt": MessageLookupByLibrary.simpleMessage("فهمت!"),
        "hasTax": MessageLookupByLibrary.simpleMessage("يخضع للضريبة"),
        "haveAccountLogin":
            MessageLookupByLibrary.simpleMessage("لديك حساب؟ تسجيل الدخول"),
        "healthcareInstitution":
            MessageLookupByLibrary.simpleMessage("مؤسسة الرعاية الصحية"),
        "help": MessageLookupByLibrary.simpleMessage("مساعدة"),
        "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
        "icon": MessageLookupByLibrary.simpleMessage("الأيقونة"),
        "inactive": MessageLookupByLibrary.simpleMessage("غير نشط"),
        "includePDF": MessageLookupByLibrary.simpleMessage("تضمين PDF"),
        "inputFields": MessageLookupByLibrary.simpleMessage("حقول الإدخال"),
        "interactiveCard":
            MessageLookupByLibrary.simpleMessage("بطاقة تفاعلية"),
        "interactiveCardDescription": MessageLookupByLibrary.simpleMessage(
            "هذه بطاقة تفاعلية يمكن الضغط عليها"),
        "invalidNumber": MessageLookupByLibrary.simpleMessage("رقم غير صحيح"),
        "inventory": MessageLookupByLibrary.simpleMessage("المخزون"),
        "inventorySettings":
            MessageLookupByLibrary.simpleMessage("إعدادات المخزون"),
        "invoiceCopiedForPrinting": MessageLookupByLibrary.simpleMessage(
            "تم نسخ تفاصيل الفاتورة للطباعة"),
        "invoiceCopiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "تم نسخ تفاصيل الفاتورة إلى الحافظة"),
        "invoiceDeletedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم حذف الفاتورة بنجاح"),
        "invoiceDetails":
            MessageLookupByLibrary.simpleMessage("تفاصيل الفاتورة"),
        "invoiceHelp": MessageLookupByLibrary.simpleMessage("مساعدة الفواتير"),
        "invoiceItems": MessageLookupByLibrary.simpleMessage("عناصر الفاتورة"),
        "invoiceManagement":
            MessageLookupByLibrary.simpleMessage("إدارة الفواتير"),
        "invoiceNumber": MessageLookupByLibrary.simpleMessage("رقم الفاتورة"),
        "invoiceNumberLabel": m38,
        "invoiceSentSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم إرسال الفاتورة بنجاح"),
        "invoiceStatusUpdated": m39,
        "invoices": MessageLookupByLibrary.simpleMessage("الفواتير"),
        "invoicesList": MessageLookupByLibrary.simpleMessage("قائمة الفواتير"),
        "isActive": MessageLookupByLibrary.simpleMessage("نشط"),
        "issueDate": MessageLookupByLibrary.simpleMessage("تاريخ الإصدار"),
        "itemDetails": MessageLookupByLibrary.simpleMessage("تفاصيل العنصر"),
        "itemHeader": MessageLookupByLibrary.simpleMessage(
            "الاسم\t\tالكمية\tالسعر\tالمجموع"),
        "itemName": MessageLookupByLibrary.simpleMessage("الاسم"),
        "itemPrice": MessageLookupByLibrary.simpleMessage("السعر"),
        "itemQuantity": MessageLookupByLibrary.simpleMessage("الكمية"),
        "itemRow": m40,
        "itemSeparator": MessageLookupByLibrary.simpleMessage("-"),
        "itemTotal": MessageLookupByLibrary.simpleMessage("المجموع"),
        "items": MessageLookupByLibrary.simpleMessage("العناصر"),
        "kilogram": MessageLookupByLibrary.simpleMessage("كجم"),
        "kuwait": MessageLookupByLibrary.simpleMessage("دولة الكويت"),
        "language": MessageLookupByLibrary.simpleMessage("اللغة"),
        "languageChangedToArabic":
            MessageLookupByLibrary.simpleMessage("تم تغيير اللغة إلى العربية"),
        "languageChangedToEnglish":
            MessageLookupByLibrary.simpleMessage("Language changed to English"),
        "largeResponsiveText":
            MessageLookupByLibrary.simpleMessage("نص متجاوب كبير"),
        "lastUpdated": MessageLookupByLibrary.simpleMessage("آخر تحديث"),
        "light": MessageLookupByLibrary.simpleMessage("فاتح"),
        "link": MessageLookupByLibrary.simpleMessage("رابط"),
        "loading": MessageLookupByLibrary.simpleMessage("جاري التحميل..."),
        "loadingButton": MessageLookupByLibrary.simpleMessage("زر تحميل"),
        "loadingCard": MessageLookupByLibrary.simpleMessage("بطاقة تحميل"),
        "loadingExpenses":
            MessageLookupByLibrary.simpleMessage("جاري تحميل المصروفات..."),
        "loadingInvoiceDetails": MessageLookupByLibrary.simpleMessage(
            "جاري تحميل تفاصيل الفاتورة..."),
        "loadingMore":
            MessageLookupByLibrary.simpleMessage("جاري تحميل المزيد..."),
        "loadingProductDetails": m41,
        "loadingUsers":
            MessageLookupByLibrary.simpleMessage("جاري تحميل المستخدمين..."),
        "loggingIn": MessageLookupByLibrary.simpleMessage("تسجيل الدخول..."),
        "login": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "loginCancelled": MessageLookupByLibrary.simpleMessage("تم الإلغاء"),
        "loginError":
            MessageLookupByLibrary.simpleMessage("خطأ في تسجيل الدخول"),
        "loginLoadin": MessageLookupByLibrary.simpleMessage("التسجيل..."),
        "loginSuccess":
            MessageLookupByLibrary.simpleMessage("تم تسجيل الدخول بنجاح"),
        "loginSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم تسجيل الدخول بنجاح"),
        "logout": MessageLookupByLibrary.simpleMessage("تسجيل الخروج"),
        "lowStockAlert":
            MessageLookupByLibrary.simpleMessage("تنبيه المخزون المنخفض"),
        "mainTitle": MessageLookupByLibrary.simpleMessage("عنوان رئيسي"),
        "manageCustomers":
            MessageLookupByLibrary.simpleMessage("إدارة العملاء"),
        "manageInvoiceStep1": MessageLookupByLibrary.simpleMessage(
            "1. استخدم البحث والفلترة للعثور على الفواتير"),
        "manageInvoiceStep2": MessageLookupByLibrary.simpleMessage(
            "2. اضغط على الفاتورة لعرض التفاصيل"),
        "manageInvoiceStep3": MessageLookupByLibrary.simpleMessage(
            "3. استخدم الأزرار للتحرير أو الحذف"),
        "manageInvoiceStep4": MessageLookupByLibrary.simpleMessage(
            "4. أرسل الفاتورة للعميل عند الحاجة"),
        "manageInvoices":
            MessageLookupByLibrary.simpleMessage("إدارة الفواتير"),
        "manageInvoicesAndCustomers": MessageLookupByLibrary.simpleMessage(
            "إدارة الفواتير والعملاء بسهولة"),
        "managePermissions":
            MessageLookupByLibrary.simpleMessage("إدارة الصلاحيات"),
        "managePermissionsDescription": MessageLookupByLibrary.simpleMessage(
            "إمكانية إدارة صلاحيات المستخدمين"),
        "manageProducts":
            MessageLookupByLibrary.simpleMessage("إدارة المنتجات"),
        "manager": MessageLookupByLibrary.simpleMessage("مشرف"),
        "managingInvoices":
            MessageLookupByLibrary.simpleMessage("إدارة الفواتير"),
        "markAsPaid": MessageLookupByLibrary.simpleMessage("تحديد كمدفوعة"),
        "material": MessageLookupByLibrary.simpleMessage("المادة"),
        "maximumQuantity":
            MessageLookupByLibrary.simpleMessage("الحد الأقصى للكمية"),
        "mediumResponsiveText":
            MessageLookupByLibrary.simpleMessage("نص متجاوب متوسط"),
        "message": MessageLookupByLibrary.simpleMessage("الرسالة"),
        "metadata": MessageLookupByLibrary.simpleMessage("البيانات الوصفية"),
        "meter": MessageLookupByLibrary.simpleMessage("متر"),
        "minimumQuantity":
            MessageLookupByLibrary.simpleMessage("الكمية الدنيا"),
        "model": MessageLookupByLibrary.simpleMessage("الموديل"),
        "modernEducationInstitution":
            MessageLookupByLibrary.simpleMessage("مؤسسة التعليم الحديث"),
        "moreOptions": MessageLookupByLibrary.simpleMessage("خيارات إضافية"),
        "name": MessageLookupByLibrary.simpleMessage("الاسم"),
        "nameInvalid": MessageLookupByLibrary.simpleMessage(
            "الاسم يجب أن يحتوي على أحرف فقط"),
        "nameMaxLength": MessageLookupByLibrary.simpleMessage(
            "الاسم يجب أن يكون أقل من 50 حرف"),
        "nameMinLength": MessageLookupByLibrary.simpleMessage(
            "الاسم يجب أن يكون 3 أحرف على الأقل"),
        "nameRequired": MessageLookupByLibrary.simpleMessage("الاسم مطلوب"),
        "nameShort": MessageLookupByLibrary.simpleMessage(
            "الاسم يجب أن يكون حرفين على الأقل"),
        "networkError":
            MessageLookupByLibrary.simpleMessage("خطأ في الإتصال بالشبكة"),
        "newCategoryDetails":
            MessageLookupByLibrary.simpleMessage("بيانات الفئة الجديدة"),
        "newExpense": MessageLookupByLibrary.simpleMessage("مصروف جديد"),
        "next": MessageLookupByLibrary.simpleMessage("التالي"),
        "no": MessageLookupByLibrary.simpleMessage("لا"),
        "noCategoriesFound":
            MessageLookupByLibrary.simpleMessage("لا توجد فئات"),
        "noCategoriesToDelete":
            MessageLookupByLibrary.simpleMessage("لا توجد فئات للحذف"),
        "noClients": MessageLookupByLibrary.simpleMessage("لا توجد عملاء"),
        "noCustomersFound":
            MessageLookupByLibrary.simpleMessage("لا يوجد عملاء"),
        "noCustomersFoundMessage": MessageLookupByLibrary.simpleMessage(
            "اضغط على زر الإضافة لإنشاء عميل جديد"),
        "noDataReceived": MessageLookupByLibrary.simpleMessage(
            "لم يتم استلام بيانات من الخادم"),
        "noEmail": MessageLookupByLibrary.simpleMessage("بدون بريد إلكتروني"),
        "noHaveAccountRejester": MessageLookupByLibrary.simpleMessage(
            "ليس لديك حساب؟ إنشاء حساب جديد"),
        "noInvoiceData":
            MessageLookupByLibrary.simpleMessage("لا توجد بيانات للفاتورة"),
        "noInvoices": MessageLookupByLibrary.simpleMessage("لا توجد فواتير"),
        "noInvoicesDescription": MessageLookupByLibrary.simpleMessage(
            "اضغط على زر الإضافة لإنشاء فاتورة جديدة"),
        "noItems": MessageLookupByLibrary.simpleMessage("لا توجد عناصر"),
        "noName": MessageLookupByLibrary.simpleMessage("بدون اسم"),
        "noProductsFound":
            MessageLookupByLibrary.simpleMessage("لا توجد منتجات"),
        "noQRCodeAvailable": MessageLookupByLibrary.simpleMessage(
            "لا يوجد رمز QR متاح لهذه الفاتورة"),
        "noRole": MessageLookupByLibrary.simpleMessage("بدون دور"),
        "noTaxUIDAvailable": MessageLookupByLibrary.simpleMessage(
            "لا يوجد معرف ضريبة متاح لهذه الفاتورة"),
        "noUsersFound":
            MessageLookupByLibrary.simpleMessage("لا يوجد مستخدمين"),
        "normalButton": MessageLookupByLibrary.simpleMessage("زر عادي"),
        "normalText": MessageLookupByLibrary.simpleMessage("نص عادي"),
        "notAMember": MessageLookupByLibrary.simpleMessage("ليس عضوا؟"),
        "notes": MessageLookupByLibrary.simpleMessage("ملاحظات"),
        "notesHint":
            MessageLookupByLibrary.simpleMessage("أي معلومات إضافية أو سياق"),
        "notifications": MessageLookupByLibrary.simpleMessage("الإشعارات"),
        "notificationsDisabled":
            MessageLookupByLibrary.simpleMessage("تم إلغاء تفعيل الإشعارات"),
        "notificationsEnabled":
            MessageLookupByLibrary.simpleMessage("تم تفعيل الإشعارات"),
        "ok": MessageLookupByLibrary.simpleMessage("موافق"),
        "onboardingClients":
            MessageLookupByLibrary.simpleMessage("إدارة العملاء والمنتجات"),
        "onboardingClientsDesc": MessageLookupByLibrary.simpleMessage(
            "إدارة شاملة للعملاء والمنتجات مع تتبع المخزون"),
        "onboardingExpenses":
            MessageLookupByLibrary.simpleMessage("إدارة المصروفات"),
        "onboardingExpensesDesc": MessageLookupByLibrary.simpleMessage(
            "تتبع وإدارة المصروفات مع تصنيفات متعددة"),
        "onboardingInvoices":
            MessageLookupByLibrary.simpleMessage("الفواتير الضريبية"),
        "onboardingInvoicesDesc": MessageLookupByLibrary.simpleMessage(
            "إنشاء وإدارة الفواتير الضريبية مع التكامل مع نظام فاتورة الوطني"),
        "onboardingOne": MessageLookupByLibrary.simpleMessage(
            "تابع فواتيرك كلها في مكان واحد"),
        "onboardingOneDec": MessageLookupByLibrary.simpleMessage(
            "نظم فواتيرك الشهرية، وتابع مواعيد الدفع، من غير ورق ولا صداع."),
        "onboardingStartNow": MessageLookupByLibrary.simpleMessage("ابدا الان"),
        "onboardingThree":
            MessageLookupByLibrary.simpleMessage("ادفع وتابع كل حاجة في ثواني"),
        "onboardingThreeDec": MessageLookupByLibrary.simpleMessage(
            "ادفع إلكترونيًا، واحفظ سجلاتك تلقائيًا لمراجعتها في أي وقت."),
        "onboardingTwo":
            MessageLookupByLibrary.simpleMessage("ما تنساش ولا فاتورة تاني"),
        "onboardingTwoDec": MessageLookupByLibrary.simpleMessage(
            "يوصلك تنبيه قبل ميعاد الدفع، علشان تتجنب أي تأخير أو غرامات."),
        "onboardingUsers":
            MessageLookupByLibrary.simpleMessage("إدارة المستخدمين والصلاحيات"),
        "onboardingUsersDesc": MessageLookupByLibrary.simpleMessage(
            "تحكم كامل في المستخدمين وصلاحياتهم داخل الشركة"),
        "onboardingWelcome":
            MessageLookupByLibrary.simpleMessage("مرحباً بك في Invotek"),
        "onboardingWelcomeDesc": MessageLookupByLibrary.simpleMessage(
            "نظام متكامل لإدارة الفواتير الإلكترونية مع التكامل مع نظام الفوترة الوطني الأردني"),
        "openingEmail": m42,
        "openingMap": MessageLookupByLibrary.simpleMessage("جاري فتح الخريطة"),
        "operationCompletedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم إكمال العملية بنجاح"),
        "or": MessageLookupByLibrary.simpleMessage("أو"),
        "other": MessageLookupByLibrary.simpleMessage("أخرى"),
        "outOfStock": MessageLookupByLibrary.simpleMessage("نفدت الكمية"),
        "outlinedButton": MessageLookupByLibrary.simpleMessage("زر مخطط"),
        "outlinedButtonPressed":
            MessageLookupByLibrary.simpleMessage("تم الضغط على الزر المخطط"),
        "overdue": MessageLookupByLibrary.simpleMessage("متأخرة"),
        "pageNotFound": MessageLookupByLibrary.simpleMessage("صفحة غير موجودة"),
        "paid": MessageLookupByLibrary.simpleMessage("مدفوعة"),
        "paidInvoices": MessageLookupByLibrary.simpleMessage("8 مدفوعة"),
        "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
        "passwordChangedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم تغيير كلمة المرور بنجاح"),
        "passwordLowercase": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور يجب أن تحتوي على حرف صغير واحد على الأقل"),
        "passwordMaxLength": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور يجب أن تكون أقل من 50 حرف"),
        "passwordMinLength": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور يجب أن تكون 8 أحرف على الأقل"),
        "passwordNumber": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور يجب أن تحتوي على رقم واحد على الأقل"),
        "passwordRequired":
            MessageLookupByLibrary.simpleMessage("كلمة المرور مطلوبة"),
        "passwordShort": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور يجب أن تكون 6 أحرف على الأقل"),
        "passwordUppercase": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل"),
        "passwordWeak": MessageLookupByLibrary.simpleMessage(
            "كلمة المرور يجب أن تحتوي على حرف كبير وحرف صغير ورقم"),
        "passwordsDoNotMatch":
            MessageLookupByLibrary.simpleMessage("كلمة المرور غير متطابقة"),
        "passwordsNotMatch":
            MessageLookupByLibrary.simpleMessage("كلمة المرور غير متطابقة"),
        "payment": MessageLookupByLibrary.simpleMessage("الدفع"),
        "paymentDate": MessageLookupByLibrary.simpleMessage("تاريخ الدفع"),
        "paymentDetails": MessageLookupByLibrary.simpleMessage("تفاصيل الدفع"),
        "paymentInformation":
            MessageLookupByLibrary.simpleMessage("معلومات الدفع"),
        "paymentMethod": MessageLookupByLibrary.simpleMessage("طريقة الدفع"),
        "paymentMethodBank": MessageLookupByLibrary.simpleMessage("تحويل بنكي"),
        "paymentMethodCard":
            MessageLookupByLibrary.simpleMessage("بطاقة ائتمان"),
        "paymentMethodCash": MessageLookupByLibrary.simpleMessage("نقدي"),
        "paymentMethodCheck": MessageLookupByLibrary.simpleMessage("شيك"),
        "paymentMethods": MessageLookupByLibrary.simpleMessage("طرق الدفع"),
        "pending": MessageLookupByLibrary.simpleMessage("معلقة"),
        "permissionsManagement":
            MessageLookupByLibrary.simpleMessage("إدارة الصلاحيات"),
        "personalInformation":
            MessageLookupByLibrary.simpleMessage("المعلومات الشخصية"),
        "phone": MessageLookupByLibrary.simpleMessage("الهاتف"),
        "phoneMaxLength": MessageLookupByLibrary.simpleMessage(
            "رقم الهاتف يجب أن يكون أقل من 15 رقم"),
        "phoneMinLength": MessageLookupByLibrary.simpleMessage(
            "رقم الهاتف يجب أن يكون 10 أرقام على الأقل"),
        "phoneNumber": MessageLookupByLibrary.simpleMessage("رقم الهاتف"),
        "phoneNumberInvalid":
            MessageLookupByLibrary.simpleMessage("رقم الهاتف غير صحيح"),
        "phoneRequired":
            MessageLookupByLibrary.simpleMessage("رقم الهاتف مطلوب"),
        "piece": MessageLookupByLibrary.simpleMessage("قطعة"),
        "pieceKgMeter":
            MessageLookupByLibrary.simpleMessage("قطعة، كيلو، متر..."),
        "playServicesNotAvailable":
            MessageLookupByLibrary.simpleMessage("خطأ في الخدمات المتاحة"),
        "pleaseEnterValidAmount":
            MessageLookupByLibrary.simpleMessage("يرجى إدخال مبلغ صحيح"),
        "pleaseSelectCategory":
            MessageLookupByLibrary.simpleMessage("يرجى اختيار فئة"),
        "postalCode": MessageLookupByLibrary.simpleMessage("الرمز البريدي"),
        "postedInvoices":
            MessageLookupByLibrary.simpleMessage("الفواتير المعلنة"),
        "pressAddToCreateClient": MessageLookupByLibrary.simpleMessage(
            "اضغط على زر الإضافة لإنشاء عميل جديد"),
        "previous": MessageLookupByLibrary.simpleMessage("السابق"),
        "price": MessageLookupByLibrary.simpleMessage("السعر"),
        "pricing": MessageLookupByLibrary.simpleMessage("التسعير"),
        "printInvoice": MessageLookupByLibrary.simpleMessage("طباعة الفاتورة"),
        "printInvoiceText": m43,
        "privacyPolicy": MessageLookupByLibrary.simpleMessage("سياسة الخصوصية"),
        "privacyPolicyComingSoon":
            MessageLookupByLibrary.simpleMessage("سياسة الخصوصية قريباً"),
        "productAddedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم إضافة المنتج بنجاح"),
        "productCategories":
            MessageLookupByLibrary.simpleMessage("فئات المنتجات"),
        "productDeletedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم حذف المنتج بنجاح"),
        "productDetails": MessageLookupByLibrary.simpleMessage("تفاصيل المنتج"),
        "productHelp": MessageLookupByLibrary.simpleMessage("مساعدة المنتج"),
        "productIsActive": MessageLookupByLibrary.simpleMessage("المنتج نشط"),
        "productIsTaxable":
            MessageLookupByLibrary.simpleMessage("يخضع للضريبة"),
        "productManagement":
            MessageLookupByLibrary.simpleMessage("إدارة المنتجات"),
        "productNameRequired":
            MessageLookupByLibrary.simpleMessage("اسم المنتج مطلوب"),
        "productPriceRequired":
            MessageLookupByLibrary.simpleMessage("سعر المنتج مطلوب"),
        "productQuantityRequired":
            MessageLookupByLibrary.simpleMessage("كمية المنتج مطلوبة"),
        "productSku": MessageLookupByLibrary.simpleMessage("رمز المنتج (SKU)"),
        "productUpdatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم تحديث المنتج بنجاح"),
        "products": MessageLookupByLibrary.simpleMessage("المنتجات"),
        "productsCategories": MessageLookupByLibrary.simpleMessage("المنتجات"),
        "productsCategoriesManagement":
            MessageLookupByLibrary.simpleMessage("المنتجات وفئاتها"),
        "productsList": MessageLookupByLibrary.simpleMessage("قائمة المنتجات"),
        "productsManagement":
            MessageLookupByLibrary.simpleMessage("إدارة المنتجات وفئاتها"),
        "productsReport":
            MessageLookupByLibrary.simpleMessage("تقرير المنتجات"),
        "qty": MessageLookupByLibrary.simpleMessage("الكمية"),
        "quantity": MessageLookupByLibrary.simpleMessage("الكمية"),
        "quantityMustBeAPositiveInteger": MessageLookupByLibrary.simpleMessage(
            "يجب أن تكون الكمية رقم صحيح غير سالب"),
        "quickActions":
            MessageLookupByLibrary.simpleMessage("الإجراءات السريعة"),
        "quickActionsTitle":
            MessageLookupByLibrary.simpleMessage("إجراءات سريعة"),
        "receiveNotifications":
            MessageLookupByLibrary.simpleMessage("تلقي الإشعارات"),
        "referenceNumber": MessageLookupByLibrary.simpleMessage("رقم المرجع"),
        "referenceNumberHint": MessageLookupByLibrary.simpleMessage(
            "رقم الفاتورة، معرف الإيصال، إلخ"),
        "refreshData": MessageLookupByLibrary.simpleMessage("تحديث البيانات"),
        "register": MessageLookupByLibrary.simpleMessage("التسجيل"),
        "registerSuccess": MessageLookupByLibrary.simpleMessage(
            "تم التسجيل بنجاح! يرجى تسجيل الدخول."),
        "registering": MessageLookupByLibrary.simpleMessage("التسجيل..."),
        "rejester": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "rejesterLoading":
            MessageLookupByLibrary.simpleMessage("تسجيل الدخول..."),
        "rejesterSuccessfully": MessageLookupByLibrary.simpleMessage(
            "تم التسجيل بنجاح! يرجى تسجيل الدخول."),
        "reports": MessageLookupByLibrary.simpleMessage("التقارير"),
        "requestedPageNotFound":
            MessageLookupByLibrary.simpleMessage("الصفحة المطلوبة غير موجودة"),
        "responsiveTexts":
            MessageLookupByLibrary.simpleMessage("النصوص المتجاوبة"),
        "retry": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
        "returnedInvoices":
            MessageLookupByLibrary.simpleMessage("الفواتير المرتجعة"),
        "role": MessageLookupByLibrary.simpleMessage("الدور"),
        "rule": MessageLookupByLibrary.simpleMessage("الدور"),
        "salesReport": MessageLookupByLibrary.simpleMessage("تقرير المبيعات"),
        "salesTax": MessageLookupByLibrary.simpleMessage("ضريبة المبيعات"),
        "saudiArabia":
            MessageLookupByLibrary.simpleMessage("المملكة العربية السعودية"),
        "save": MessageLookupByLibrary.simpleMessage("حفظ"),
        "saveCategory": MessageLookupByLibrary.simpleMessage("حفظ الفئة"),
        "saveChanges": MessageLookupByLibrary.simpleMessage("حفظ التعديلات"),
        "saveSettings": MessageLookupByLibrary.simpleMessage("حفظ الإعدادات"),
        "saving": MessageLookupByLibrary.simpleMessage("جاري الحفظ..."),
        "savingSettings":
            MessageLookupByLibrary.simpleMessage("جاري حفظ الإعدادات..."),
        "screenDimensions":
            MessageLookupByLibrary.simpleMessage("أبعاد الشاشة"),
        "screenDimensionsAndPerformance":
            MessageLookupByLibrary.simpleMessage("أبعاد الشاشة والأداء"),
        "screenDimensionsPerformance":
            MessageLookupByLibrary.simpleMessage("أبعاد الشاشة والأداء"),
        "search": MessageLookupByLibrary.simpleMessage("البحث..."),
        "searchCustomers":
            MessageLookupByLibrary.simpleMessage("البحث في العملاء..."),
        "searchForUser":
            MessageLookupByLibrary.simpleMessage("البحث عن مستخدم..."),
        "searchInClients":
            MessageLookupByLibrary.simpleMessage("البحث في العملاء..."),
        "searchInInvoices":
            MessageLookupByLibrary.simpleMessage("البحث في الفواتير..."),
        "searchInvoices":
            MessageLookupByLibrary.simpleMessage("البحث في الفواتير..."),
        "searchItems":
            MessageLookupByLibrary.simpleMessage("البحث في العناصر..."),
        "searchProducts":
            MessageLookupByLibrary.simpleMessage("البحث في المنتجات..."),
        "securityInformation":
            MessageLookupByLibrary.simpleMessage("معلومات الأمان"),
        "selectAppropriateExpenseCategory":
            MessageLookupByLibrary.simpleMessage(
                "اختيار الفئة المناسبة للمصروف"),
        "selectCategory": MessageLookupByLibrary.simpleMessage("إختار الفئة"),
        "selectDate": MessageLookupByLibrary.simpleMessage("اختر التاريخ"),
        "selectTheDateThisExpenseOccurred":
            MessageLookupByLibrary.simpleMessage(
                "اختر التاريخ الذي حدث فيه المصروف"),
        "sellingPrice": MessageLookupByLibrary.simpleMessage("سعر البيع"),
        "send": MessageLookupByLibrary.simpleMessage("إرسال"),
        "sendInvoice": MessageLookupByLibrary.simpleMessage("إرسال الفاتورة"),
        "sendInvoiceDescription": MessageLookupByLibrary.simpleMessage(
            "إمكانية إرسال الفاتورة للعميل"),
        "sendMethod": MessageLookupByLibrary.simpleMessage("طريقة الإرسال"),
        "sendingInvoice":
            MessageLookupByLibrary.simpleMessage("جاري إرسال الفاتورة..."),
        "separator": MessageLookupByLibrary.simpleMessage("="),
        "serverError": MessageLookupByLibrary.simpleMessage(
            "خطأ في الخادم. يرجى المحاولة لاحقاً."),
        "setAmountDateAndPaymentMethod": MessageLookupByLibrary.simpleMessage(
            "ضبط المبلغ، التاريخ، وطريقة الدفع"),
        "settings": MessageLookupByLibrary.simpleMessage("الإعدادات"),
        "settingsSavedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم حفظ الإعدادات بنجاح"),
        "shareInvoice": MessageLookupByLibrary.simpleMessage("مشاركة الفاتورة"),
        "shareInvoiceText": m44,
        "showAllItems": m45,
        "showLess": MessageLookupByLibrary.simpleMessage("إظهار أقل"),
        "signIn": MessageLookupByLibrary.simpleMessage("تسجيل الدخول"),
        "signInFailed":
            MessageLookupByLibrary.simpleMessage("فشل تسجيل الدخول"),
        "signInWithGoogle":
            MessageLookupByLibrary.simpleMessage("تسجيل الدخول بالجوجل"),
        "sku": MessageLookupByLibrary.simpleMessage("رمز المنتج"),
        "smallResponsiveText":
            MessageLookupByLibrary.simpleMessage("نص متجاوب صغير"),
        "smallText": MessageLookupByLibrary.simpleMessage("نص صغير"),
        "sms": MessageLookupByLibrary.simpleMessage("رسالة نصية"),
        "somethingWentWrong": MessageLookupByLibrary.simpleMessage("حدث خطأ"),
        "startNow": MessageLookupByLibrary.simpleMessage("ابدأ الآن"),
        "state": MessageLookupByLibrary.simpleMessage("الحالة"),
        "status": MessageLookupByLibrary.simpleMessage("الحالة"),
        "statusCategory": m46,
        "statusDraft": MessageLookupByLibrary.simpleMessage("مسودة"),
        "statusInfo": MessageLookupByLibrary.simpleMessage("معلومات الحالة"),
        "statusOverdue": MessageLookupByLibrary.simpleMessage("متأخرة"),
        "statusPaid": MessageLookupByLibrary.simpleMessage("مدفوعة"),
        "statusPending": MessageLookupByLibrary.simpleMessage("معلقة"),
        "subTitle": MessageLookupByLibrary.simpleMessage("عنوان فرعي"),
        "subject": MessageLookupByLibrary.simpleMessage("الموضوع"),
        "subtotal": MessageLookupByLibrary.simpleMessage("المجموع الفرعي"),
        "subtotalLine": m47,
        "successText": MessageLookupByLibrary.simpleMessage("نص نجاح"),
        "supervisor": MessageLookupByLibrary.simpleMessage("مشرف"),
        "supervisorDescription":
            MessageLookupByLibrary.simpleMessage("يدير المستخدمين والصلاحيات"),
        "supportEmail":
            MessageLookupByLibrary.simpleMessage("البريد الإلكتروني للدعم"),
        "systemAccess": MessageLookupByLibrary.simpleMessage("الوصول للنظام"),
        "systemAdministrator":
            MessageLookupByLibrary.simpleMessage("مدير النظام"),
        "systemAdministratorDescription": MessageLookupByLibrary.simpleMessage(
            "لديه جميع الصلاحيات في النظام"),
        "systemSettings":
            MessageLookupByLibrary.simpleMessage("إعدادات النظام"),
        "systemSettingsDescription": MessageLookupByLibrary.simpleMessage(
            "إمكانية تعديل إعدادات النظام"),
        "tablet": MessageLookupByLibrary.simpleMessage("تابلت"),
        "tax": MessageLookupByLibrary.simpleMessage("الضريبة"),
        "taxAmount": MessageLookupByLibrary.simpleMessage("الضريبة"),
        "taxIntegration":
            MessageLookupByLibrary.simpleMessage("التكامل الضريبي"),
        "taxIntegrationSettings":
            MessageLookupByLibrary.simpleMessage("إعدادات التكامل الضريبي"),
        "taxIntegrationStep1": MessageLookupByLibrary.simpleMessage(
            "1. قم بتفعيل التكامل الضريبي"),
        "taxIntegrationStep2": MessageLookupByLibrary.simpleMessage(
            "2. أدخل معلومات الشركة الضريبية"),
        "taxIntegrationStep3": MessageLookupByLibrary.simpleMessage(
            "3. اختبر الاتصال واحفظ الإعدادات"),
        "taxInvoices":
            MessageLookupByLibrary.simpleMessage("الفواتير الضريبية"),
        "taxInvoicesDesc": MessageLookupByLibrary.simpleMessage(
            "الفواتير غير المعلنة والفواتير المدفوعة والفواتير المرتجعة وإنشاء فاتورة جديدة"),
        "taxInvoicesTitle":
            MessageLookupByLibrary.simpleMessage("الفواتير الضريبية"),
        "taxLine": m48,
        "taxNumber": MessageLookupByLibrary.simpleMessage("الرقم الضريبي"),
        "taxRate": MessageLookupByLibrary.simpleMessage("نسبة الضريبة"),
        "taxSettings": MessageLookupByLibrary.simpleMessage("إعدادات الضريبة"),
        "taxType": MessageLookupByLibrary.simpleMessage("نوع الضريبة"),
        "taxUID": MessageLookupByLibrary.simpleMessage("معرف الضريبة"),
        "taxUIDCopied":
            MessageLookupByLibrary.simpleMessage("تم نسخ معرف الضريبة"),
        "taxUIDForInvoice": m49,
        "tekpart": MessageLookupByLibrary.simpleMessage("تك بارت"),
        "termsOfUse": MessageLookupByLibrary.simpleMessage("شروط الاستخدام"),
        "termsOfUseComingSoon":
            MessageLookupByLibrary.simpleMessage("شروط الاستخدام قريباً"),
        "testConnection":
            MessageLookupByLibrary.simpleMessage("اختبار الاتصال"),
        "testingConnection":
            MessageLookupByLibrary.simpleMessage("جاري اختبار الاتصال..."),
        "textStyles": MessageLookupByLibrary.simpleMessage("أنماط النصوص"),
        "thankYouMessage":
            MessageLookupByLibrary.simpleMessage("شكراً لتعاملكم معنا"),
        "themeDemo": MessageLookupByLibrary.simpleMessage("تجربة الثيمات"),
        "themeInfo": MessageLookupByLibrary.simpleMessage("معلومات الثيم"),
        "thisField": MessageLookupByLibrary.simpleMessage("هذا الحقل"),
        "thisFieldIsRequired":
            MessageLookupByLibrary.simpleMessage("هذا الحقل مطلوب"),
        "thisMonth": MessageLookupByLibrary.simpleMessage("هذا الشهر"),
        "title": MessageLookupByLibrary.simpleMessage("العنوان"),
        "titleIsRequired":
            MessageLookupByLibrary.simpleMessage("العنوان مطلوب"),
        "total": MessageLookupByLibrary.simpleMessage("الإجمالي"),
        "totalAmount": MessageLookupByLibrary.simpleMessage("المجموع الكلي"),
        "totalLine": m50,
        "tourismEntertainmentCompany":
            MessageLookupByLibrary.simpleMessage("شركة السياحة والترفيه"),
        "trackAvailableProductQuantity": MessageLookupByLibrary.simpleMessage(
            "تتبع الكمية المتوفرة من المنتج"),
        "trackInventory": MessageLookupByLibrary.simpleMessage("تتبع المخزون"),
        "trackYourBusinessExpenses":
            MessageLookupByLibrary.simpleMessage("تتبع مصروفات عملك"),
        "transportLogisticsCompany":
            MessageLookupByLibrary.simpleMessage("شركة النقل واللوجستيات"),
        "tryAgain": MessageLookupByLibrary.simpleMessage("إعادة المحاولة"),
        "type": MessageLookupByLibrary.simpleMessage("النوع"),
        "uae": MessageLookupByLibrary.simpleMessage(
            "دولة الإمارات العربية المتحدة"),
        "undefined": MessageLookupByLibrary.simpleMessage("غير محدد"),
        "unit": MessageLookupByLibrary.simpleMessage("الوحدة"),
        "unknownError": MessageLookupByLibrary.simpleMessage(
            "حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى."),
        "update": MessageLookupByLibrary.simpleMessage("تحديث"),
        "updateCategory": MessageLookupByLibrary.simpleMessage("تحديث الفئة"),
        "updateStatus": MessageLookupByLibrary.simpleMessage("تحديث الحالة"),
        "updatedAt": MessageLookupByLibrary.simpleMessage("تاريخ التحديث"),
        "updatingStatus":
            MessageLookupByLibrary.simpleMessage("جاري تحديث الحالة..."),
        "user": MessageLookupByLibrary.simpleMessage("مستخدم"),
        "userAddedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم إضافة المستخدم بنجاح"),
        "userCreatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم إنشاء المستخدم بنجاح"),
        "userDeletedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم حذف المستخدم بنجاح"),
        "userDescription": MessageLookupByLibrary.simpleMessage(
            "صلاحيات محدودة للعرض والقراءة"),
        "userId": MessageLookupByLibrary.simpleMessage("معرف المستخدم"),
        "userManagement":
            MessageLookupByLibrary.simpleMessage("إدارة المستخدمين"),
        "userNotFound":
            MessageLookupByLibrary.simpleMessage("المستخدم غير موجود"),
        "userSettings":
            MessageLookupByLibrary.simpleMessage("إعدادات المستخدم"),
        "userUpdatedSuccessfully":
            MessageLookupByLibrary.simpleMessage("تم تحديث المستخدم بنجاح"),
        "username": MessageLookupByLibrary.simpleMessage("اسم المستخدم"),
        "usersAndPermissionsDescription": MessageLookupByLibrary.simpleMessage(
            "عرض وإدارة المستخدمين وصلاحياتهم"),
        "usersAndPermissionsManagement":
            MessageLookupByLibrary.simpleMessage("إدارة المستخدمين والصلاحيات"),
        "usersList": MessageLookupByLibrary.simpleMessage("قائمة المستخدمين"),
        "usersManagement":
            MessageLookupByLibrary.simpleMessage("المستخدمين والصلاحيات"),
        "usersPermissions":
            MessageLookupByLibrary.simpleMessage("المستخدمين والصلاحيات"),
        "usersPermissionsDesc": MessageLookupByLibrary.simpleMessage(
            "التحكم في العملاء والصلاحيات"),
        "usersPermissionsTitle":
            MessageLookupByLibrary.simpleMessage("المستخدمين والصلاحيات"),
        "validationError": MessageLookupByLibrary.simpleMessage(
            "يرجى التحقق من صحة البيانات المدخلة"),
        "vat": MessageLookupByLibrary.simpleMessage("ضريبة القيمة المضافة"),
        "vatNumber":
            MessageLookupByLibrary.simpleMessage("رقم ضريبة القيمة المضافة"),
        "view": MessageLookupByLibrary.simpleMessage("عرض"),
        "viewAllInvoices":
            MessageLookupByLibrary.simpleMessage("عرض جميع الفواتير"),
        "viewClients": MessageLookupByLibrary.simpleMessage("عرض العملاء"),
        "viewClientsDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية عرض قائمة العملاء"),
        "viewCustomerDetails": m51,
        "viewDetails": MessageLookupByLibrary.simpleMessage("عرض التفاصيل"),
        "viewExpenses": MessageLookupByLibrary.simpleMessage("عرض المصروفات"),
        "viewExpensesDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية عرض قائمة المصروفات"),
        "viewInvoices": MessageLookupByLibrary.simpleMessage("عرض الفواتير"),
        "viewInvoicesDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية عرض قائمة الفواتير"),
        "viewItemDetails": m52,
        "viewPrivacyPolicy":
            MessageLookupByLibrary.simpleMessage("اطلع على سياسة الخصوصية"),
        "viewProducts": MessageLookupByLibrary.simpleMessage("عرض المنتجات"),
        "viewProductsDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية عرض قائمة المنتجات"),
        "viewQRCode": MessageLookupByLibrary.simpleMessage("عرض رمز QR"),
        "viewReports": MessageLookupByLibrary.simpleMessage("عرض التقارير"),
        "viewReportsAndStatistics":
            MessageLookupByLibrary.simpleMessage("عرض التقارير والإحصائيات"),
        "viewReportsDescription":
            MessageLookupByLibrary.simpleMessage("إمكانية عرض التقارير"),
        "viewReportsStatistics":
            MessageLookupByLibrary.simpleMessage("عرض التقارير والإحصائيات"),
        "viewTaxUID": MessageLookupByLibrary.simpleMessage("عرض معرف الضريبة"),
        "viewTermsOfUse":
            MessageLookupByLibrary.simpleMessage("اطلع على شروط الاستخدام"),
        "viewUserDetails":
            MessageLookupByLibrary.simpleMessage("عرض تفاصيل المستخدم"),
        "viewUsers": MessageLookupByLibrary.simpleMessage("عرض المستخدمين"),
        "viewUsersDescription": MessageLookupByLibrary.simpleMessage(
            "إمكانية عرض قائمة المستخدمين"),
        "viewingInvoices": m53,
        "viewingOrders": m54,
        "visitInvotekWebsite":
            MessageLookupByLibrary.simpleMessage("زيارة موقع إنفوتك"),
        "website": MessageLookupByLibrary.simpleMessage("الموقع الإلكتروني"),
        "weight": MessageLookupByLibrary.simpleMessage("الوزن"),
        "welcome": MessageLookupByLibrary.simpleMessage("مرحباً!"),
        "welcomeToInvotek":
            MessageLookupByLibrary.simpleMessage("مرحباً بك في تطبيق Invotek"),
        "welcomeToInvotekApp":
            MessageLookupByLibrary.simpleMessage("مرحباً بك في تطبيق Invotek"),
        "yes": MessageLookupByLibrary.simpleMessage("نعم")
      };
}
