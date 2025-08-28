import 'package:invotek/generated/l10n.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.emailRequired;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return S.current.emailInvalid;
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.passwordRequired;
    }

    if (value.length < 6) {
      return S.current.passwordShort;
    }

    if (!RegExp(r'^(?=.*[a-z])(?=.*\d)').hasMatch(value)) {
      return S.current.passwordWeak;
    }

    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return S.current.confirmPasswordRequired;
    }

    if (value != password) {
      return S.current.passwordsNotMatch;
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.nameRequired;
    }

    if (value.length < 2) {
      return S.current.nameShort;
    }

    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$').hasMatch(value)) {
      return S.current.nameInvalid;
    }

    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الهاتف مطلوب';
    }

    final phoneRegex = RegExp(r'^[0-9]{10,11}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'رقم الهاتف غير صحيح';
    }

    return null;
  }

  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName مطلوب';
    }
    return null;
  }

  static String? validateMinLength(
    String? value,
    int minLength,
    String fieldName,
  ) {
    if (value == null || value.length < minLength) {
      return '$fieldName يجب أن يكون $minLength أحرف على الأقل';
    }
    return null;
  }

  static String? validateMaxLength(
    String? value,
    int maxLength,
    String fieldName,
  ) {
    if (value != null && value.length > maxLength) {
      return '$fieldName يجب أن يكون $maxLength أحرف كحد أقصى';
    }
    return null;
  }
}
