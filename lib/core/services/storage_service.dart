import 'dart:convert';

import 'package:invotek/features/auth/demo/entit/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Language methods
  static Future<void> saveLanguage(String languageCode) async {
    await _prefs?.setString('language_code', languageCode);
  }

  static String getLanguage() {
    return _prefs?.getString('language_code') ?? 'en';
  }

  // Token methods
  static Future<void> saveToken(String token) async {
    await _prefs?.setString('token', token);
  }

  static String? getToken() {
    return _prefs?.getString('token');
  }

  static Future<void> removeToken() async {
    await _prefs?.remove('token');
  }

  // First time methods
  static Future<void> setFirstTime(bool isFirstTime) async {
    await _prefs?.setBool('is_first_time', isFirstTime);
  }

  static bool isFirstTime() {
    return _prefs?.getBool('is_first_time') ?? true;
  }

  // User data methods
  static Future<void> saveUserData(UserModel userData) async {
    await _prefs?.setString('user_data', jsonEncode(userData.toJson()));
  }

  static UserModel? getUserData() {
    final userData = _prefs?.getString('user_data');
    return userData != null ? UserModel.fromJson(jsonDecode(userData)) : null;
  }

  static Future<void> removeUserData() async {
    await _prefs?.remove('user_data');
  }

  // Clear all data
  static Future<void> clearAll() async {
    await _prefs?.clear();
  }

  // Generic string methods
  static Future<void> saveString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  static String? getString(String key) {
    return _prefs?.getString(key);
  }

  static Future<void> removeString(String key) async {
    await _prefs?.remove(key);
  }

  // Generic bool methods
  static Future<void> saveBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  static Future<void> removeBool(String key) async {
    await _prefs?.remove(key);
  }
}
