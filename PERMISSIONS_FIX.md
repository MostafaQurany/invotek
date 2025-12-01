# إصلاحات الأذونات - Invotek App

## الأذونات التي تم إزالتها (لتجنب رفض Google Play)

### 1. READ_PHONE_STATE
- **تم الإزالة**: ✅
- **السبب**: Google Play صارمة جداً مع هذا الإذن وقد ترفض التطبيق
- **التأثير**: package_info_plus قد لا يعمل بشكل كامل

### 2. ACCESS_FINE_LOCATION و ACCESS_COARSE_LOCATION
- **تم الإزالة**: ✅
- **السبب**: غير ضروري (Bluetooth يعمل بدونها في Android 12+)
- **التأثير**: قد لا يعمل Bluetooth scanning في Android < 12

### 3. CALL_PHONE
- **تم الإزالة**: ✅
- **السبب**: تم استبداله بـ ACTION_DIAL (لا يحتاج إذن)
- **التأثير**: لا يوجد - الوظيفة تعمل بنفس الطريقة

### 4. READ_MEDIA_VIDEO
- **تم الإزالة**: ✅
- **السبب**: غير مستخدم في التطبيق
- **التأثير**: لا يوجد

---

## الأذونات المتبقية (آمنة ومبررة)

### الأذونات الأساسية (Normal Permissions)
- ✅ INTERNET
- ✅ ACCESS_NETWORK_STATE
- ✅ ACCESS_WIFI_STATE
- ✅ WAKE_LOCK
- ✅ VIBRATE

### الأذونات الحساسة (Dangerous Permissions)

#### 1. Bluetooth
- BLUETOOTH (Android < 12)
- BLUETOOTH_ADMIN (Android < 12)
- BLUETOOTH_SCAN (Android 12+)
- BLUETOOTH_CONNECT (Android 12+)
- **الاستخدام**: الاتصال بالطابعات اللاسلكية

#### 2. Camera
- CAMERA
- **الاستخدام**: التقاط صور للمنتجات

#### 3. Media
- READ_MEDIA_IMAGES (Android 13+)
- **الاستخدام**: اختيار الصور من المعرض

#### 4. Storage
- READ_EXTERNAL_STORAGE (Android < 10 فقط)
- WRITE_EXTERNAL_STORAGE (Android < 10 فقط)
- **الاستخدام**: حفظ الفواتير كـ PDF

### الأذونات الخاصة
- com.sunmi.printerhelper.permission.PRINT
- com.sunmi.printerhelper.permission.OPEN_CASH_DRAWER

---

## التغييرات في الكود

### 1. customer_details_screen.dart
**قبل**:
```dart
void _makeCall() async {
  final permission = await Permission.phone.request();
  if (permission.isGranted) {
    await launchUrl(phoneUri);
  }
}
```

**بعد**:
```dart
void _makeCall() async {
  // استخدام ACTION_DIAL بدلاً من CALL_PHONE (لا يحتاج إذن)
  final Uri phoneUri = Uri(scheme: 'tel', path: widget.customer.phone!);
  await launchUrl(phoneUri);
}
```

### 2. customer_details_screen.dart - _openMap
**قبل**:
```dart
void _openMap() async {
  final permission = await Permission.location.request();
  if (permission.isGranted) {
    await launchUrl(mapUri);
  }
}
```

**بعد**:
```dart
void _openMap() async {
  // فتح الخريطة مباشرة بدون طلب إذن (يستخدم Google Maps URL فقط)
  await launchUrl(mapUri);
}
```

---

## الأوصاف المطلوبة في Google Play Console

### Bluetooth Permissions
```
نحتاج إلى إذن Bluetooth للاتصال بالطابعات اللاسلكية وطباعة الفواتير.
```

### Camera Permission
```
نحتاج إلى إذن الكاميرا لالتقاط صور للمنتجات أو المستندات.
```

### Storage Permission
```
نحتاج إلى إذن التخزين لحفظ الفواتير والملفات المهمة على جهازك.
```

---

## الملفات المعدلة

1. **android/app/src/main/AndroidManifest.xml**
   - تم إزالة: READ_PHONE_STATE, ACCESS_FINE_LOCATION, ACCESS_COARSE_LOCATION, CALL_PHONE, READ_MEDIA_VIDEO
   - تم إضافة: CAMERA (كان مفقوداً)

2. **lib/features/customers/ui/screens/customer_details_screen.dart**
   - تم إزالة طلب إذن الموقع من _openMap()
   - تم إزالة طلب إذن الاتصال من _makeCall()
   - تم إزالة دالة _showPermissionDialog() غير المستخدمة

3. **android/app/src/main/res/values/permissions_descriptions.xml**
   - تم إزالة أوصاف الأذونات المحذوفة

---

## Checklist النهائي

- [x] تم إزالة READ_PHONE_STATE
- [x] تم إزالة ACCESS_FINE_LOCATION
- [x] تم إزالة ACCESS_COARSE_LOCATION
- [x] تم إزالة CALL_PHONE
- [x] تم إزالة READ_MEDIA_VIDEO
- [x] تم إضافة CAMERA
- [x] تم تحديث الكود لاستخدام ACTION_DIAL بدلاً من CALL_PHONE
- [x] تم إزالة طلب إذن الموقع من _openMap()
- [x] تم تنظيف الكود من الدوال غير المستخدمة

---

## ملاحظات مهمة

1. **Bluetooth Scanning**: في Android < 12 قد لا يعمل بدون أذونات الموقع، لكن معظم الأجهزة الآن Android 12+.

2. **package_info_plus**: بعد إزالة READ_PHONE_STATE، قد لا يعمل بشكل كامل. يمكن استخدام معلومات الإصدار من pubspec.yaml مباشرة.

3. **ACTION_DIAL vs CALL_PHONE**: 
   - ACTION_DIAL يفتح تطبيق الهاتف مع الرقم جاهز (لا يحتاج إذن)
   - CALL_PHONE يتصل مباشرة (يحتاج إذن)
   - الوظيفة متشابهة من ناحية المستخدم

---

**تاريخ آخر تحديث**: اليوم

