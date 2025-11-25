<!-- 21981b62-b50c-4b5b-8857-0c2125f367f5 d3482be9-d273-4953-92fe-dadc12444482 -->
# إنشاء شاشات About Us, Contact Us, Privacy Policy, FAQ وإعدادات إضافية

## الأهداف

1. إنشاء 4 شاشات أساسية (About Us, Contact Us, Privacy Policy, FAQ)
2. إنشاء شاشات إعدادات إضافية (Language, Notifications, Data & Storage)
3. إضافة بطاقات جديدة في SettingsScreen للوصول إلى جميع الشاشات
4. إضافة Routes و Localization keys المطلوبة

## الشاشات الأساسية المطلوبة

### 1. About Us Screen

- عرض معلومات عن التطبيق والشركة
- استخدام `package_info_plus` لعرض رقم الإصدار
- تصميم بسيط مع `SettingsCard` و `ListView`
- زر مشاركة التطبيق (اختياري باستخدام `share_plus`)

### 2. Contact Us Screen

- نموذج اتصال مع حقول: الاسم، البريد الإلكتروني، الموضوع، الرسالة
- استخدام `url_launcher` لإرسال البريد الإلكتروني
- زر الاتصال/الواتساب (اختياري)
- تصميم باستخدام `SettingsCard` و `EditableField`

### 3. Privacy Policy Screen

- عرض سياسة الخصوصية
- محتوى قابل للتمرير مع `SingleChildScrollView`
- تصميم بسيط مع `SettingsCard`
- يمكن تحميل المحتوى من API أو استخدام نص ثابت

### 4. FAQ Screen (Common Questions)

- قائمة أسئلة شائعة مع إجابات قابلة للطي (ExpansionTile)
- تصميم باستخدام `SettingsCard` و `ExpansionTile`
- بحث في الأسئلة (اختياري)

## الشاشات الإضافية المقترحة

### 5. Language Settings Screen

- شاشة لتغيير اللغة (عربي/إنجليزي)
- استخدام `LocalizationCubit` الموجود بالفعل
- تصميم بسيط مع `SettingsCard` و `RadioListTile`
- حفظ التفضيل في `SharedPreferences` (موجود بالفعل في LocalizationCubit)

### 6. Notifications Settings Screen

- شاشة لإعدادات الإشعارات
- تفعيل/تعطيل أنواع الإشعارات المختلفة
- استخدام `SettingsCard` مع `Switch` لكل نوع إشعار
- حفظ الإعدادات في `SharedPreferences`

### 7. Data & Storage Screen

- شاشة لإدارة التخزين
- عرض حجم البيانات المخزنة محلياً (Cache)
- زر لمسح البيانات المخزنة (Cache)
- زر لمسح جميع البيانات المحلية (مع تأكيد)
- استخدام `path_provider` و `shared_preferences` لحساب الحجم

## البطاقات الجديدة في SettingsScreen

### 1. Help & Support Card

- بطاقة في SettingsScreen
- روابط إلى: FAQ, Contact Us
- تصميم مشابه لـ `AccountSettingsCard`

### 2. Legal Card

- بطاقة في SettingsScreen
- روابط إلى: Privacy Policy, Terms of Service
- تصميم مشابه لـ `AccountSettingsCard`

### 3. App Info Card

- بطاقة في SettingsScreen
- رابط إلى: About Us
- عرض رقم الإصدار مباشرة في البطاقة (من package_info_plus)
- تصميم مشابه لـ `AccountSettingsCard`

### 4. System Settings Card (اختياري)

- بطاقة في SettingsScreen
- روابط إلى: Language Settings, Notifications Settings, Data & Storage
- تصميم مشابه لـ `AccountSettingsCard`

## التصميم

- استخدام نفس نمط `SettingsCard` و `SettingsTile`
- AppBar بنفس التصميم (back button, title, centerTitle: true)
- `AppColors.backgroundLight` للخلفية
- `ListView` أو `SingleChildScrollView` للمحتوى
- استخدام `flutter_screenutil` للـ responsive design

## الملفات المطلوبة

### الشاشات الأساسية

- `lib/features/settings/ui/screens/about_us_screen.dart`
- `lib/features/settings/ui/screens/contact_us_screen.dart`
- `lib/features/settings/ui/screens/privacy_policy_screen.dart`
- `lib/features/settings/ui/screens/faq_screen.dart`

### الشاشات الإضافية

- `lib/features/settings/ui/screens/language_settings_screen.dart`
- `lib/features/settings/ui/screens/notifications_settings_screen.dart`
- `lib/features/settings/ui/screens/data_storage_screen.dart`

### Widgets

- `lib/features/settings/ui/widgets/help_support_card.dart`
- `lib/features/settings/ui/widgets/legal_card.dart`
- `lib/features/settings/ui/widgets/app_info_card.dart`
- `lib/features/settings/ui/widgets/system_settings_card.dart` (اختياري)

### Routes

- إضافة routes في `lib/core/routes/app_routes.dart`

### Localization

- إضافة مفاتيح في `lib/l10n/intl_en.arb` و `lib/l10n/intl_ar.arb`

### To-dos

- [ ] تعديل TaxInvoiceData.fromInvoice لإضافة معامل companyLogoUrl اختياري وإزالة الكود الذي يحصل على logoUrl من StorageService
- [ ] إضافة imports المطلوبة في pos_printer_service.dart (injection, CompanyCubit, StorageService)
- [ ] إنشاء دالة _getCompanyLogoUrl() في PosPrinterService مع fallback mechanism
- [ ] تعديل previewZatca لاستخدام _getCompanyLogoUrl() وتمرير logoUrl إلى TaxInvoiceData.fromInvoice
- [ ] تعديل printZatca لاستخدام _getCompanyLogoUrl() وتمرير logoUrl إلى TaxInvoiceData.fromInvoice
- [ ] اختبار جميع السيناريوهات (CompanyCubit محمل، غير محمل، logoUrl فارغ)
- [x] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [x] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [x] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [x] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [x] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard
- [ ] اختبار جميع السيناريوهات (اختيار صورة، الخروج بدون حفظ، حفظ التغييرات)
- [ ] تعديل tax_integration_card.dart لإضافة منطق التحقق من البيانات وتفعيل التكامل تلقائياً أو التنقل إلى شاشة الإعدادات
- [ ] إنشاء tac_integration_settings_screen.dart بنفس تصميم company_settings_screen.dart مع حقول Merchant Code و Invoice Type
- [ ] إضافة منطق حفظ البيانات في tac_integration_settings_screen.dart وربطه مع TaxIntegrationCubit
- [ ] التحقق من مفاتيح الترجمة وإضافة المفقودة في ملفات ARB
- [ ] اختبار جميع السيناريوهات (تفعيل مع بيانات، تفعيل بدون بيانات، حفظ، تعطيل)
- [x] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [x] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [x] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [x] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [x] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard
- [x] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [x] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [x] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [x] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [x] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard
- [x] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [x] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [x] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [x] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [x] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard
- [ ] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [ ] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [ ] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [ ] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [ ] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard
- [ ] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [ ] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [ ] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [ ] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [ ] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard
- [ ] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [ ] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [ ] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [ ] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [ ] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard
- [ ] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [ ] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [ ] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [ ] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [ ] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard
- [ ] تعديل TaxInvoiceData.fromInvoice لإضافة معامل companyLogoUrl اختياري وإزالة الكود الذي يحصل على logoUrl من StorageService
- [ ] إضافة imports المطلوبة في pos_printer_service.dart (injection, CompanyCubit, StorageService)
- [ ] إنشاء دالة _getCompanyLogoUrl() في PosPrinterService مع fallback mechanism
- [ ] تعديل previewZatca لاستخدام _getCompanyLogoUrl() وتمرير logoUrl إلى TaxInvoiceData.fromInvoice
- [ ] تعديل printZatca لاستخدام _getCompanyLogoUrl() وتمرير logoUrl إلى TaxInvoiceData.fromInvoice
- [ ] اختبار جميع السيناريوهات (CompanyCubit محمل، غير محمل، logoUrl فارغ)
- [x] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [x] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [x] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [x] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [x] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard
- [ ] اختبار جميع السيناريوهات (اختيار صورة، الخروج بدون حفظ، حفظ التغييرات)
- [ ] تعديل tax_integration_card.dart لإضافة منطق التحقق من البيانات وتفعيل التكامل تلقائياً أو التنقل إلى شاشة الإعدادات
- [ ] إنشاء tac_integration_settings_screen.dart بنفس تصميم company_settings_screen.dart مع حقول Merchant Code و Invoice Type
- [ ] إضافة منطق حفظ البيانات في tac_integration_settings_screen.dart وربطه مع TaxIntegrationCubit
- [ ] التحقق من مفاتيح الترجمة وإضافة المفقودة في ملفات ARB
- [ ] اختبار جميع السيناريوهات (تفعيل مع بيانات، تفعيل بدون بيانات، حفظ، تعطيل)
- [x] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [x] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [x] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [x] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [x] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard
- [x] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [x] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [x] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [x] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [x] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard
- [x] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [x] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [x] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [x] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [x] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard
- [ ] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [ ] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [ ] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [ ] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [ ] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard
- [ ] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [ ] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [ ] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [ ] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [ ] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard
- [ ] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [ ] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [ ] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [ ] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [ ] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard
- [ ] التحقق من مفاتيح Localization في company_settings_screen.dart وإضافة المفقودة في ملفات ARB
- [ ] تعديل LogoUploadCard لدعم عرض الصورة المحلية المختارة (FileImage) بالإضافة إلى NetworkImage
- [ ] تعديل company_settings_screen.dart لحفظ الحالة الأصلية للبيانات عند فتح الشاشة
- [ ] إضافة PopScope في company_settings_screen.dart للتحقق من التغييرات وإلغائها عند الخروج بدون حفظ
- [ ] تحديث company_settings_screen.dart لتمرير selectedImagePath إلى LogoUploadCard