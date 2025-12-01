# android/app/proguard-rules.pro

# Flutter method channels & generated code
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep annotation default values
-keepattributes *Annotation*
-keepattributes EnclosingMethod
-keepattributes Signature

# Keep Parcelable implementations
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# Keep Serializable classes
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# Keep Retrofit
-keepattributes Signature, InnerClasses, EnclosingMethod
-keepattributes RuntimeVisibleAnnotations, RuntimeVisibleParameterAnnotations
-keepclassmembers,allowshrinking,allowobfuscation interface * {
    @retrofit2.http.* <methods>;
}
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement
-dontwarn javax.annotation.**
-dontwarn kotlin.Unit
-dontwarn retrofit2.KotlinExtensions
-dontwarn retrofit2.KotlinExtensions$*

# Keep Retrofit interfaces
-keep interface retrofit2.Call
-keep class retrofit2.Response
-keep class retrofit2.adapter.rxjava.Result

# Keep JSON serialization
-keepattributes Signature
-keepattributes *Annotation*
-keep class com.google.gson.** { *; }
-keep class * implements com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# Keep JSON annotation models
-keepclassmembers,allowobfuscation class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# Keep Freezed generated classes
-keep class **$* { *; }
-keep class * extends * { *; }
-keep class * implements * { *; }

# bluetooth_print_plus
-keep class com.*.bluetooth_print_plus.** { *; }
-keep class vn.com.*.bluetooth_print_plus.** { *; }
-keep class dev.*.bluetooth_print_plus.** { *; }

# Bluetooth libraries
-keep class com.polidea.** { *; }
-keep class no.nordicsemi.android.** { *; }
-keep class com.github.ivbaranov.rxbluetooth.** { *; }
-dontwarn com.polidea.**
-dontwarn no.nordicsemi.android.**

# SUNMI Printer
-keep class com.sunmi.** { *; }
-dontwarn com.sunmi.**

# Dio
-keep class dio.** { *; }
-keep interface dio.** { *; }
-dontwarn dio.**

# SharedPreferences
-keep class android.content.SharedPreferences { *; }
-keep class android.content.SharedPreferences$* { *; }

# Keep application class
-keep class com.invotek.park.** { *; }

# Keep data classes with @JsonSerializable
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# Keep enum classes
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# ============================================
# Flutter & Dart specific rules
# ============================================

# Keep Flutter engine
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep Dart classes
-keep class dart.** { *; }

# ============================================
# Google Sign In
# ============================================
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**
-keep class com.google.api.client.** { *; }
-keep class com.google.api.client.googleapis.** { *; }

# ============================================
# Image Picker
# ============================================
-keep class io.flutter.plugins.imagepicker.** { *; }

# ============================================
# Path Provider
# ============================================
-keep class io.flutter.plugins.pathprovider.** { *; }

# ============================================
# Shared Preferences
# ============================================
-keep class io.flutter.plugins.sharedpreferences.** { *; }

# ============================================
# Package Info Plus
# ============================================
-keep class io.flutter.plugins.packageinfo.** { *; }

# ============================================
# URL Launcher
# ============================================
-keep class io.flutter.plugins.urllauncher.** { *; }

# ============================================
# Permission Handler
# ============================================
-keep class com.baseflow.permissionhandler.** { *; }

# ============================================
# Local Notifications
# ============================================
-keep class com.dexterous.flutterlocalnotifications.** { *; }

# ============================================
# Cached Network Image
# ============================================
-keep class flutter.plugins.cachednetworkimage.** { *; }

# ============================================
# PDF & Printing
# ============================================
-keep class net.nfet.printing.** { *; }
-keep class pdf.** { *; }

# ============================================
# QR Flutter
# ============================================
-keep class net.touchcapture.qr.flutterqr.** { *; }

# ============================================
# Screen Util
# ============================================
-keep class com.example.screenutil.** { *; }

# ============================================
# GetIt (Dependency Injection)
# ============================================
-keep class get_it.** { *; }

# ============================================
# Flutter Bloc
# ============================================
-keep class bloc.** { *; }
-keep class flutter_bloc.** { *; }

# ============================================
# Hive (for cache)
# ============================================
-keep class hive.** { *; }
-keep class hive_flutter.** { *; }
-keep class io.flutter.plugins.hive.** { *; }

# ============================================
# Additional important rules
# ============================================

# Keep line numbers for stack traces
-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile

# Keep Kotlin metadata
-keep class kotlin.** { *; }
-keep class kotlin.Metadata { *; }
-dontwarn kotlin.**
-keepclassmembers class **$WhenMappings {
    <fields>;
}
-keepclassmembers class kotlin.Metadata {
    public <methods>;
}

# Keep annotations for reflection
-keepattributes RuntimeVisibleAnnotations,RuntimeVisibleParameterAnnotations
-keepattributes AnnotationDefault

# Keep generic signatures
-keepattributes Signature

# Keep exceptions
-keepattributes Exceptions

# Keep inner classes
-keepattributes InnerClasses
-keepattributes EnclosingMethod

# ============================================
# Missing classes - Optional dependencies
# Generated automatically by R8 - Add these rules to suppress warnings
# ============================================

# GPrinter library - Optional barcode library (JzInt)
-dontwarn com.gainscha.jzint.JzInt
-dontwarn com.gainscha.jzint.JzintSymbol

# Google Play Core - Optional for split installs (not used in this app)
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication
-dontwarn com.google.android.play.core.splitinstall.SplitInstallException
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManager
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManagerFactory
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest$Builder
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest
-dontwarn com.google.android.play.core.splitinstall.SplitInstallSessionState
-dontwarn com.google.android.play.core.splitinstall.SplitInstallStateUpdatedListener
-dontwarn com.google.android.play.core.tasks.OnFailureListener
-dontwarn com.google.android.play.core.tasks.OnSuccessListener
-dontwarn com.google.android.play.core.tasks.Task

# Flutter deferred components (not used in this app)
-dontwarn io.flutter.embedding.engine.deferredcomponents.**
-dontwarn io.flutter.embedding.android.FlutterPlayStoreSplitApplication
