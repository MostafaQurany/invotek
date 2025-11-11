import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:invotek/core/cubits/currency_cubit.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/utils/app_api_constants.dart';

class CurrencyFormatter {
  /// Format currency amount based on current currency and language settings
  static String formatCurrency(double amount, BuildContext? context) {
    String currencySymbol;
    String formattedAmount;

    if (context == null) {
      // Fallback to default formatting if context is null
      currencySymbol = AppCurrency.currencyEn;
      formattedAmount = NumberFormat.currency(
        symbol: '',
        decimalDigits: 2,
      ).format(amount);
    } else {
      try {
        // Get current currency from CurrencyCubit
        final currencyCubit = context.read<CurrencyCubit>();
        final currencyCode = currencyCubit.getCurrentCurrency();

        // Get current language from LocalizationCubit
        final localizationCubit = context.read<LocalizationCubit>();
        final languageCode = localizationCubit.getCurrentLanguage();

        // Get currency symbol based on currency and language
        currencySymbol = AppCurrency.getCurrencySymbol(
          currencyCode,
          languageCode,
        );

        // Format the amount without currency symbol (we'll add it after)
        formattedAmount = NumberFormat.currency(
          symbol: '',
          decimalDigits: 2,
        ).format(amount);
      } catch (e) {
        // Fallback to default formatting if any error occurs
        currencySymbol = AppCurrency.currencyEn;
        formattedAmount = NumberFormat.currency(
          symbol: '',
          decimalDigits: 2,
        ).format(amount);
      }
    }

    // Remove trailing zeros after decimal point if not needed
    formattedAmount = _removeTrailingZeros(formattedAmount);

    // Add currency symbol after the amount
    return '$formattedAmount $currencySymbol';
  }

  /// Format currency amount with specific currency code and language
  static String formatCurrencyWithCode(
    double amount,
    String currencyCode,
    String languageCode,
  ) {
    final currencySymbol = AppCurrency.getCurrencySymbol(
      currencyCode,
      languageCode,
    );
    // Format the amount without currency symbol (we'll add it after)
    final formatted = NumberFormat.currency(
      symbol: '',
      decimalDigits: 2,
    ).format(amount);
    final cleanedAmount = _removeTrailingZeros(formatted);
    // Add currency symbol after the amount
    return '$cleanedAmount $currencySymbol';
  }

  /// Format currency amount as string (for cases where amount is String)
  static String formatCurrencyString(String? amount, BuildContext? context) {
    if (amount == null || amount.isEmpty) {
      return formatCurrency(0.0, context);
    }

    final parsedAmount = double.tryParse(amount) ?? 0.0;
    return formatCurrency(parsedAmount, context);
  }

  /// Remove trailing zeros after decimal point if not needed
  /// Example: "11,250.00" -> "11,250", "14,450.40" -> "14,450.40"
  static String _removeTrailingZeros(String formatted) {
    // Check if the string contains a decimal point
    if (!formatted.contains('.')) {
      return formatted;
    }

    // Find the position of the decimal point
    final decimalIndex = formatted.indexOf('.');
    if (decimalIndex == -1) {
      return formatted;
    }

    // Extract the part before decimal point
    final beforeDecimal = formatted.substring(0, decimalIndex);

    // Extract the part after decimal point
    final afterDecimal = formatted.substring(decimalIndex + 1);

    // Find the first sequence of digits after the decimal point
    final digitsMatch = RegExp(r'^(\d+)').firstMatch(afterDecimal);
    if (digitsMatch == null) {
      return formatted;
    }

    final digits = digitsMatch.group(1)!;
    final afterDigits = afterDecimal.substring(digits.length);

    // Check if all digits are zeros
    if (digits.isEmpty || digits.split('').every((digit) => digit == '0')) {
      // Remove the decimal point and all zeros
      return beforeDecimal + afterDigits;
    }

    // If there are non-zero digits, keep the decimal part as is
    // Example: "14,450.40" -> keep "14,450.40"
    // Only remove if all digits are zeros (handled above)
    return formatted;
  }
}
