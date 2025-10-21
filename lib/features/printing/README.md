# ميزة الطباعة (Printing Feature)

## 📁 هيكل المجلدات

```
lib/features/printing/
├── data/
│   └── models/
│       └── print_settings_model.dart
├── services/
│   ├── printing_service.dart
│   └── thermal_printer_service.dart
├── ui/
│   ├── controllers/
│   │   └── printing_controller.dart
│   ├── screens/
│   │   ├── print_options_screen.dart
│   │   ├── thermal_print_screen.dart
│   │   ├── pdf_preview_screen.dart
│   │   └── printer_settings_screen.dart
│   └── widgets/
│       └── printer_discovery_widget.dart
├── printing.dart (Main Export)
└── README.md
```

## 🎯 الميزات

### 1. الطباعة الحرارية

- اكتشاف تلقائي للطابعات
- معاينة الإيصال الحراري
- دعم أحجام ورق متعددة
- اختبار الاتصال

### 2. طباعة PDF

- إنشاء PDF للفاتورة مع دعم النصوص العربية
- معاينة PDF
- حفظ ومشاركة PDF
- طباعة مباشرة
- تصميم جميل للجداول مع ألوان احترافية
- دعم كامل للأحرف العربية في PDF

### 3. إدارة الإعدادات

- حفظ إعدادات الطابعة
- دعم أنواع اتصال متعددة
- إعدادات جودة الطباعة

## 🚀 الاستخدام

```dart
// الانتقال إلى خيارات الطباعة
Navigator.pushNamed(
  context,
  AppRoutes.printOptionsRoute,
  arguments: invoice,
);
```

## 📱 المسارات

- `/invoices/print/options` - خيارات الطباعة
- `/invoices/print/thermal` - الطباعة الحرارية
- `/invoices/print/pdf` - معاينة PDF
- `/invoices/print/settings` - إعدادات الطابعة
