# 🖨️ ميزة الطباعة في تطبيق Invotek

## نظرة عامة

تم تطوير ميزة طباعة شاملة لتطبيق Invotek تدعم كلاً من الطباعة الحرارية وطباعة PDF مع واجهة مستخدم حديثة ومهنية.

## المميزات الرئيسية

### 🖨️ أنواع الطباعة المدعومة

- **الطباعة الحرارية**: للطابعات الحرارية (80mm, 58mm)
- **طباعة PDF**: إنشاء وعرض وحفظ PDF
- **طباعة الشبكة**: اكتشاف وطباعة على طابعات الشبكة
- **طباعة البلوتوث**: دعم طابعات البلوتوث

### 📱 الشاشات المتوفرة

1. **شاشة خيارات الطباعة** (`PrintOptionsScreen`)
2. **شاشة الطباعة الحرارية** (`ThermalPrintScreen`)
3. **شاشة معاينة PDF** (`PDFPreviewScreen`)
4. **شاشة إعدادات الطابعة** (`PrinterSettingsScreen`)

### 🧩 الـ Widgets المساعدة

- `PrinterDiscoveryWidget`: اكتشاف الطابعات
- `PrinterStatusWidget`: عرض حالة الطابعة
- `ReceiptPreviewWidget`: معاينة الإيصال
- `ReceiptPreviewCard`: بطاقة معاينة الإيصال

## البنية التقنية

### 📁 هيكل الملفات

```
lib/
├── core/
│   └── services/
│       ├── printing_service.dart          # خدمة الطباعة الأساسية
│       └── thermal_printer_service.dart   # خدمة الطابعات الحرارية
├── features/
│   └── invoices/
│       ├── data/
│       │   └── models/
│       │       └── print_settings_model.dart
│       ├── ui/
│       │   ├── controllers/
│       │   │   └── printing_controller.dart
│       │   ├── screens/
│       │   │   ├── print_options_screen.dart
│       │   │   ├── thermal_print_screen.dart
│       │   │   ├── pdf_preview_screen.dart
│       │   │   └── printer_settings_screen.dart
│       │   └── widgets/
│       │       ├── printer_discovery_widget.dart
│       │       ├── printer_status_widget.dart
│       │       └── receipt_preview_widget.dart
```

### 🔧 الحزم المستخدمة

```yaml
dependencies:
  printing: ^5.11.1 # الطباعة الأساسية
  pdf: ^3.10.7 # إنشاء PDF
  quick_print: ^1.0.0 # الطباعة السريعة
  flutter_net_printer: ^1.0.0 # طابعات الشبكة
  path_provider: ^2.1.1 # إدارة الملفات
  permission_handler: ^11.0.1 # الأذونات
  share_plus: ^7.2.1 # مشاركة الملفات
```

## الاستخدام

### 1. إضافة زر الطباعة

```dart
// في شاشة تفاصيل الفاتورة
FloatingActionButton(
  heroTag: "print_${invoice.id}",
  onPressed: _showPrintOptions,
  backgroundColor: AppColors.warning,
  child: const Icon(Icons.print, color: Colors.white),
),
```

### 2. التنقل لخيارات الطباعة

```dart
void _showPrintOptions() {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PrintOptionsScreen(invoice: invoice),
    ),
  );
}
```

### 3. استخدام Controller

```dart
// تحميل الإعدادات
await _controller.loadSettings();

// طباعة الفاتورة
final success = await _controller.printInvoice(invoice);

// إنشاء PDF
final filePath = await _controller.createAndSavePDF(invoice);
```

## الإعدادات

### الأذونات المطلوبة

#### Android (android/app/src/main/AndroidManifest.xml)

```xml
<uses-permission android:name="android.permission.BLUETOOTH" />
<uses-permission android:name="android.permission.BLUETOOTH_ADMIN" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```

#### iOS (ios/Runner/Info.plist)

```xml
<key>NSBluetoothAlwaysUsageDescription</key>
<string>This app needs Bluetooth to connect to printers</string>
<key>NSBluetoothPeripheralUsageDescription</key>
<string>This app needs Bluetooth to connect to printers</string>
```

## المميزات المتقدمة

### 🎨 واجهة المستخدم

- تصميم حديث ومهني
- دعم الـ localization (العربية والإنجليزية)
- استخدام ScreenUtil للاستجابة
- ألوان متسقة مع AppColors
- Animations سلسة

### 🔧 إدارة الحالة

- PrintingController لإدارة حالة الطباعة
- حفظ الإعدادات في SharedPreferences
- معالجة الأخطاء الشاملة
- مؤشرات التحميل والحالة

### 📄 تنسيق الطباعة

- تنسيق مخصص للطباعة الحرارية
- تنسيق احترافي لـ PDF
- دعم الخطوط العربية
- تخطيط متجاوب

## الاختبار

### قائمة الاختبار

- [ ] اختبار اكتشاف الطابعات
- [ ] اختبار الطباعة الحرارية
- [ ] اختبار إنشاء PDF
- [ ] اختبار حفظ ومشاركة PDF
- [ ] اختبار الأذونات
- [ ] اختبار UI على أحجام شاشات مختلفة
- [ ] اختبار الأداء مع فواتير كبيرة

### تحسينات الأداء

- [ ] Cache للـ PDF المُنشأ
- [ ] تحسين استهلاك الذاكرة
- [ ] تحسين سرعة اكتشاف الطابعات
- [ ] تحسين تجربة المستخدم

## استكشاف الأخطاء

### مشاكل شائعة

1. **الطابعة غير متصلة**: تحقق من إعدادات الشبكة والطابعة
2. **خطأ في الأذونات**: تأكد من منح الأذونات المطلوبة
3. **فشل في إنشاء PDF**: تحقق من مساحة التخزين المتاحة
4. **بطء في اكتشاف الطابعات**: تحقق من إعدادات الشبكة

### حلول مقترحة

- إعادة تشغيل التطبيق
- التحقق من اتصال الإنترنت
- إعادة تعيين إعدادات الطابعة
- مسح cache التطبيق

## التطوير المستقبلي

### ميزات مخططة

- [ ] دعم طابعات USB
- [ ] طباعة متعددة اللغات
- [ ] قوالب طباعة مخصصة
- [ ] إحصائيات الطباعة
- [ ] طباعة مجدولة

### تحسينات مقترحة

- [ ] تحسين سرعة الطباعة
- [ ] دعم المزيد من أنواع الطابعات
- [ ] واجهة إعدادات متقدمة
- [ ] نسخ احتياطي للإعدادات

## المساهمة

للمساهمة في تطوير هذه الميزة:

1. اتبع معايير الكود الموجودة
2. أضف اختبارات للوظائف الجديدة
3. حدث التوثيق عند إضافة ميزات جديدة
4. تأكد من عدم كسر الوظائف الموجودة

## الدعم

للحصول على الدعم أو الإبلاغ عن مشاكل:

- تحقق من ملف README هذا
- راجع ملفات التوثيق في الكود
- ابحث في issues الموجودة
- أنشئ issue جديد مع تفاصيل المشكلة

---

**تم تطوير هذه الميزة بواسطة فريق تطوير Invotek** 🚀
