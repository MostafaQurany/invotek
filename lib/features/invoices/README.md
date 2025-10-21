# 📋 نظام إدارة الفواتير - Invoices Feature

## 🎯 نظرة عامة

نظام إدارة الفواتير الشامل مع نفس النمط المستخدم في المصروفات والمنتجات، يوفر جميع الوظائف المطلوبة لإدارة الفواتير بكفاءة.

## 📁 هيكل المجلدات

```
lib/features/invoices/
├── data/
│   ├── models/           # نماذج البيانات
│   └── repository/       # مستودع البيانات
├── demo/
│   ├── cubit/           # إدارة الحالة
│   └── entit/           # الكيانات
└── ui/
    ├── screens/         # الشاشات
    ├── widgets/         # العناصر المرئية
    └── ui.dart          # ملف التصدير الرئيسي
```

## 🖥️ الشاشات المتاحة

### 1. قائمة الفواتير

- **`InvoicesListScreen`** - شاشة قائمة الفواتير الرئيسية
- **`InvoicesListScreenWithProvider`** - مع Provider للـ Cubit

### 2. إدارة الفواتير

- **`AddInvoiceScreen`** - إضافة فاتورة جديدة
- **`EditInvoiceScreen`** - تعديل فاتورة موجودة
- **`InvoiceDetailsScreen`** - تفاصيل الفاتورة

### 3. التكامل الضريبي

- **`TaxIntegrationScreen`** - إعداد التكامل الضريبي

## 🎨 العناصر المرئية

### البطاقات (Cards)

- **`InvoiceCard`** - بطاقة الفاتورة الأساسية
- **`EnhancedInvoiceCard`** - بطاقة الفاتورة المحسنة
- **`InvoiceSummaryCard`** - ملخص الفاتورة
- **`InvoiceCustomerCard`** - معلومات العميل
- **`InvoiceItemsCard`** - عناصر الفاتورة
- **`InvoicePaymentCard`** - معلومات الدفع

### الحوارات (Dialogs)

- **`DeleteInvoiceDialog`** - حذف الفاتورة
- **`SendInvoiceDialog`** - إرسال الفاتورة
- **`MarkPaidDialog`** - تحديد كمدفوعة
- **`HelpDialogWidget`** - مساعدة

### الرؤوس (Headers)

- **`InvoicesHeaderWidget`** - رأس قائمة الفواتير
- **`AddInvoiceHeaderWidget`** - رأس إضافة الفاتورة
- **`EditInvoiceHeaderWidget`** - رأس تعديل الفاتورة
- **`InvoiceDetailsHeaderWidget`** - رأس تفاصيل الفاتورة

### القوائم (Lists)

- **`InvoicesList`** - قائمة الفواتير
- **`InvoicesStateBuilder`** - بناء حالة الفواتير

### الأقسام (Sections)

- **`AddInvoiceFormSection`** - نموذج إضافة الفاتورة
- **`AddInvoiceBottomActions`** - أزرار إضافة الفاتورة
- **`EditInvoiceBottomActions`** - أزرار تعديل الفاتورة
- **`TaxIntegrationFormSection`** - نموذج التكامل الضريبي

### الحالات (States)

- **`InvoicesEmptyState`** - حالة فارغة
- **`InvoicesErrorState`** - حالة خطأ
- **`InvoicesLoadingState`** - حالة تحميل

## 🚀 الاستخدام

### 1. عرض قائمة الفواتير

```dart
import 'package:invotek/features/invoices/ui/ui.dart';

// في التطبيق
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => InvoicesListScreenWithProvider(),
  ),
);
```

### 2. إضافة فاتورة جديدة

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => AddInvoiceScreenWithProvider(),
  ),
);
```

### 3. تعديل فاتورة

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => EditInvoiceScreenWithProvider(invoice: invoice),
  ),
);
```

### 4. عرض تفاصيل الفاتورة

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => InvoiceDetailsScreenWithProvider(invoice: invoice),
  ),
);
```

## 🔧 الوظائف المتاحة

### إدارة الفواتير

- ✅ إنشاء فاتورة جديدة
- ✅ عرض الفواتير مع فلترة
- ✅ تعديل الفواتير
- ✅ حذف الفواتير
- ✅ إرسال الفاتورة للعميل
- ✅ تحديد كمدفوعة
- ✅ طباعة/تحميل PDF

### إدارة العملاء

- ✅ اختيار عميل موجود
- ✅ إضافة عميل جديد
- ✅ عرض تاريخ العميل

### إدارة العناصر

- ✅ إضافة عناصر للفاتورة
- ✅ تعديل العناصر
- ✅ حذف العناصر
- ✅ اختيار منتجات

### التكامل الضريبي

- ✅ إعداد التكامل الضريبي
- ✅ حساب الضرائب تلقائياً
- ✅ إرسال للجهة الضريبية

## 🎨 التصميم

### الألوان

- **Primary**: `AppColors.primary`
- **Success**: `AppColors.success`
- **Warning**: `AppColors.warning`
- **Error**: `AppColors.error`

### الخطوط

- **Title**: `24.sp, FontWeight.bold`
- **Subtitle**: `14.sp, FontWeight.w400`
- **Body**: `16.sp, FontWeight.w500`
- **Caption**: `12.sp, FontWeight.w400`

### المسافات

- **Padding**: `16.w, 16.h`
- **Margin**: `8.w, 8.h`
- **Border Radius**: `12.r, 16.r`

## 📱 حالات الواجهة

### حالات التحميل

- `loading` - تحميل الفواتير
- `loading_more` - تحميل المزيد
- `creating` - إنشاء فاتورة
- `updating` - تحديث فاتورة
- `deleting` - حذف فاتورة

### حالات النجاح

- `createSuccess` - تم إنشاء الفاتورة
- `updateSuccess` - تم تحديث الفاتورة
- `deleteSuccess` - تم حذف الفاتورة

### حالات الخطأ

- `failure` - خطأ عام
- `networkError` - خطأ في الشبكة
- `validationError` - خطأ في التحقق

## 🔍 البحث والفلترة

### خيارات البحث

- البحث برقم الفاتورة
- البحث بالعميل
- البحث بالتاريخ

### خيارات الفلترة

- فلترة حسب الحالة (مسودة، معلقة، مدفوعة، متأخرة)
- فلترة حسب طريقة الدفع (نقد، بطاقة، تحويل، شيك)
- فلترة حسب العميل
- فلترة حسب التاريخ
- فلترة حسب المبلغ

## 📊 التقارير والإحصائيات

### إحصائيات الفواتير

- إجمالي الفواتير
- الفواتير المدفوعة
- الفواتير المعلقة
- الفواتير المتأخرة

### تقارير الإيرادات

- إجمالي الإيرادات
- الإيرادات الشهرية
- الإيرادات السنوية

## 🛠️ التطوير

### إضافة ميزة جديدة

1. إنشاء الملف في المجلد المناسب
2. إضافة التصدير في `widgets.dart`
3. تحديث الوثائق

### تخصيص التصميم

1. تعديل الألوان في `AppColors`
2. تعديل الخطوط في `AppTextStyles`
3. تعديل المسافات في `AppSpacing`

## 📝 الملاحظات

- جميع العناصر تدعم الترجمة
- التصميم متجاوب مع جميع أحجام الشاشات
- يدعم الوضع المظلم والفاتح
- متوافق مع معايير Material Design

## 🔗 الروابط المفيدة

- [Material Design Guidelines](https://material.io/design)
- [Flutter Documentation](https://flutter.dev/docs)
- [ScreenUtil Package](https://pub.dev/packages/flutter_screenutil)
