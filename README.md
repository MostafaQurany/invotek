# Invotek App

تطبيق Flutter لإدارة الفواتير والعملاء.

## الميزات المضافة

### 1. ScreenUtils Class

تم إضافة فئة `ScreenUtils` للتعامل مع أحجام الشاشة بشكل متجاوب:

- **أبعاد الشاشة**: `screenWidth`, `screenHeight`, `statusBarHeight`
- **أحجام متجاوبة**: `paddingSmall`, `paddingMedium`, `paddingLarge`
- **أحجام الخطوط**: `fontSizeSmall`, `fontSizeMedium`, `fontSizeLarge`
- **أحجام الأزرار**: `buttonHeightSmall`, `buttonHeightMedium`, `buttonHeightLarge`
- **دوال مساعدة**: `responsivePadding()`, `responsiveMargin()`, `responsiveBorderRadius()`

### 2. LocalizationCubit

تم إضافة نظام إدارة اللغات:

- **LocalizationCubit**: للتحكم في تغيير اللغة
- **LocalizationState**: لحفظ حالة اللغة الحالية
- **دوال مساعدة**: `changeLanguageToArabic()`, `changeLanguageToEnglish()`

### 3. StorageService

خدمة موحدة لإدارة التخزين المحلي:

- **حفظ واسترجاع اللغة**: `saveLanguage()`, `getLanguage()`
- **إدارة التوكن**: `saveToken()`, `getToken()`, `removeToken()`
- **إدارة البيانات**: `saveUserData()`, `getUserData()`
- **إدارة الحالة**: `saveBool()`, `getBool()`, `removeBool()`
- **إدارة النصوص**: `saveString()`, `getString()`, `removeString()`
- **مسح البيانات**: `clearAll()`

### 5. Dependency Injection

نظام حقن التبعيات باستخدام GetIt:

- **تسجيل الخدمات**: Dio, ApiClient, AuthDataSource, AuthRepo
- **تسجيل Cubits**: LocalizationCubit, AuthCubit

### 6. App Routes

نظام إدارة المسارات:

- **تعريف المسارات**: `authRoute`, `homeRoute`
- **معالجة المسارات**: `onGenerateRoute`, `onUnknownRoute`

### 7. App Theme

نظام الثيمات المتقدم:

- **الثيم الفاتح**: `AppTheme.lightTheme`
- **الثيم الداكن**: `AppTheme.darkTheme`
- **ألوان التطبيق**: `AppColors`
- **خطوط النص المتجاوبة**: `AppTextTheme`
  - `lightTextTheme` - ثيم النصوص الفاتح
  - `darkTextTheme` - ثيم النصوص الداكن
  - `responsiveTextStyle()` - إنشاء نصوص متجاوبة
  - `getTextTheme()` - الحصول على ثيم النصوص حسب السطوع
- **ويدجتات واعية بالثيم**: `ThemeAwareWidgets`
  - `ThemeAwareText` - نص واع بالثيم
  - `ThemeAwareCard` - بطاقة واعية بالثيم
  - `ThemeAwareButton` - زر واع بالثيم
  - `ThemeAwareTextField` - حقل إدخال واع بالثيم
  - `ThemeAwareIcon` - أيقونة واعية بالثيم

### 8. App Bloc Observer

مراقب للـ Blocs:

- **تسجيل العمليات**: onCreate, onChange, onError, onClose
- **تتبع الأداء**: مراقبة تغييرات الحالة

## كيفية الاستخدام

### استخدام ScreenUtils

```dart
import 'package:invotek/core/utils/screen_utils.dart';

// استخدام الأحجام المتجاوبة
Container(
  padding: EdgeInsets.all(ScreenUtils.paddingMedium),
  margin: EdgeInsets.all(ScreenUtils.marginLarge),
  child: Text(
    'نص تجريبي',
    style: TextStyle(fontSize: ScreenUtils.fontSizeLarge),
  ),
)
```

### تغيير اللغة

```dart
// في أي مكان في التطبيق
context.read<LocalizationCubit>().changeLanguageToArabic();
context.read<LocalizationCubit>().changeLanguageToEnglish();
```

### حفظ واسترجاع البيانات

```dart
// حفظ البيانات
await StorageService.saveToken('token_value');
await StorageService.saveString('key', jsonEncode(data));
await StorageService.saveBool('is_logged_in', true);

// استرجاع البيانات
String? token = StorageService.getToken();
String? cachedData = StorageService.getString('key');
bool isLoggedIn = StorageService.getBool('is_logged_in') ?? false;
```

### استخدام الثيمات المتجاوبة

```dart
// استخدام النصوص المتجاوبة
Text(
  'نص متجاوب',
  style: AppTextTheme.responsiveTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  ),
)

// الحصول على ثيم النصوص حسب السطوع
final brightness = Theme.of(context).brightness;
final textTheme = AppTextTheme.getTextTheme(brightness);

// استخدام ويدجتات واعية بالثيم
ThemeAwareText(
  'نص واع بالثيم',
  style: AppTextTheme.getTextTheme(Brightness.light).headlineLarge,
)

ThemeAwareButton(
  text: 'زر واع بالثيم',
  icon: Icons.check,
  onPressed: () {},
)

ThemeAwareCard(
  onTap: () {},
  child: Text('بطاقة واعية بالثيم'),
)
```

## الحزم المضافة

- `equatable: ^2.0.5` - للمقارنة بين الكائنات
- `flutter_screenutil: ^5.9.3` - للأحجام المتجاوبة
- `get_it: ^7.6.0` - لحقن التبعيات
- `shared_preferences: ^2.2.2` - للتخزين المحلي
- `flutter_bloc` - لإدارة الحالة
- `flutter_localizations` - للترجمة

## هيكل المشروع

```
lib/
├── core/
│   ├── cubits/
│   │   └── localization_cubit.dart
│   ├── di/
│   │   └── injection.dart
│   ├── routes/
│   │   └── app_routes.dart
│   ├── services/
│   │   └── storage_service.dart
│   ├── theme/
│   │   ├── app_colors.dart
│   │   ├── app_text_theme.dart
│   │   └── app_theme.dart
│   ├── utils/
│   │   ├── app_bloc_observer.dart
│   │   ├── logger.dart
│   │   └── screen_utils.dart
│   └── widgets/
│       ├── responsive_button.dart
│       ├── responsive_card.dart
│       ├── responsive_text_field.dart
│       └── theme_aware_widgets.dart
├── features/
│   ├── auth/
│   └── home/
│       └── ui/
│           └── widgets/
│               ├── home_dashboard.dart
│               └── theme_demo_screen.dart
└── main.dart
```

## الخطوات التالية

1. **إضافة شاشة Onboarding**: لاستقبال المستخدمين الجدد
2. **تحسين واجهة المستخدم**: استخدام ScreenUtils في جميع الشاشات
3. **إضافة المزيد من الميزات**: حسب متطلبات المشروع
4. **تحسين الأداء**: مراقبة الأداء باستخدام AppLogger
5. **إضافة اختبارات**: اختبارات وحدة وتكامل

## التشغيل

```bash
# تثبيت التبعيات
flutter pub get

# تشغيل التطبيق
flutter run

# بناء التطبيق للإنتاج
flutter build apk
```

## ملخص التحديثات الأخيرة

### ✅ تم إكماله:

1. **ScreenUtils Class** - فئة للأحجام المتجاوبة
2. **LocalizationCubit** - نظام إدارة اللغات
3. **StorageService** - خدمة موحدة للتخزين المحلي
4. **Dependency Injection** - نظام حقن التبعيات
5. **App Routes** - نظام إدارة المسارات
6. **App Theme** - نظام الثيمات المتقدم
7. **Responsive Widgets** - ويدجتات متجاوبة
8. **Theme Aware Widgets** - ويدجتات واعية بالثيم
9. **App Text Theme** - نظام النصوص المتجاوبة
10. **Theme Demo Screen** - شاشة تجريبية للثيمات

### 🎯 الميزات الرئيسية:

- **تجاوب كامل**: جميع العناصر تتكيف مع أحجام الشاشات المختلفة
- **دعم اللغات**: العربية والإنجليزية مع حفظ التفضيلات
- **ثيمات متقدمة**: فاتح وداكن مع نصوص متجاوبة
- **ويدجتات ذكية**: واعية بالثيم ومتجاوبة
- **أداء محسن**: استخدام ScreenUtils للحصول على أحجام مثالية
- **تخزين موحد**: خدمة واحدة لإدارة جميع أنواع البيانات
- **قابلية التوسع**: هيكل منظم وقابل للتطوير

### 📱 متوافق مع:

- الهواتف الذكية (أحجام مختلفة)
- الأجهزة اللوحية
- الثيمات الفاتحة والداكنة
- اللغات العربية والإنجليزية
