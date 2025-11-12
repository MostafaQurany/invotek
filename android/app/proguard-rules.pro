# android/app/proguard-rules.pro

# Flutter method channels & generated code
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# bluetooth_print_plus (غيّر الباكدج لو مختلف في البلجن عندك)
-keep class com.*.bluetooth_print_plus.** { *; }
-keep class vn.com.*.bluetooth_print_plus.** { *; }
-keep class dev.*.bluetooth_print_plus.** { *; }

# لو البلجن مبني فوق Bluetooth LE/Classic libs
-keep class com.polidea.** { *; }        # RxAndroidBle إن وُجد
-keep class no.nordicsemi.android.** { *; }  # Nordic
-keep class com.github.ivbaranov.rxbluetooth.** { *; }  # Classic
-dontwarn com.polidea.**
-dontwarn no.nordicsemi.android.**
