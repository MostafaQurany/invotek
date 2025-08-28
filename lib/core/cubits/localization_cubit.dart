import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationState {
  final Locale locale;

  const LocalizationState({required this.locale});

  @override
  List<Object?> get props => [locale];

  LocalizationState copyWith({Locale? locale}) {
    return LocalizationState(locale: locale ?? this.locale);
  }
}

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(const LocalizationState(locale: Locale('en')));

  void initializeLanguage() {
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLanguage = prefs.getString('language_code') ?? 'en';
    final locale = Locale(savedLanguage);
    emit(LocalizationState(locale: locale));
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
