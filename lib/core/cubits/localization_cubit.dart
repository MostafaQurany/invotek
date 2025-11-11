import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationState {
  final Locale locale;

  const LocalizationState({required this.locale});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocalizationState && other.locale == locale;
  }

  @override
  int get hashCode => locale.hashCode;

  LocalizationState copyWith({Locale? locale}) {
    return LocalizationState(locale: locale ?? this.locale);
  }
}

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(const LocalizationState(locale: Locale('ar')));

  Future<void> initializeLanguage() async {
    await _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedLanguage = prefs.getString('language_code');
      
      // إذا لم تكن هناك لغة محفوظة، استخدام 'ar' كافتراضي
      if (savedLanguage == null || savedLanguage.isEmpty) {
        emit(const LocalizationState(locale: Locale('ar')));
        return;
      }
      
      // التأكد من أن اللغة المحفوظة صالحة، وإلا استخدام 'ar' كافتراضي
      final languageCode = (savedLanguage == 'ar' || savedLanguage == 'en')
          ? savedLanguage
          : 'ar';
      final locale = Locale(languageCode);
      emit(LocalizationState(locale: locale));
    } catch (e) {
      // في حالة حدوث خطأ، استخدام 'ar' كافتراضي
      emit(const LocalizationState(locale: Locale('ar')));
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', languageCode);
    final locale = Locale(languageCode);
    emit(LocalizationState(locale: locale));
  }

  void changeLanguageToArabic() {
    changeLanguage('ar');
  }

  void changeLanguageToEnglish() {
    changeLanguage('en');
  }

  String getCurrentLanguage() {
    return state.locale.languageCode;
  }

  bool isArabic() {
    return state.locale.languageCode == 'ar';
  }

  bool isEnglish() {
    return state.locale.languageCode == 'en';
  }
}
