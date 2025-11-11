import 'package:intl/intl.dart';

/// Utility class for unified date formatting and conversion across the application
/// 
/// Handles:
/// - Converting DateTime to API format (yyyy-MM-dd) - Always uses English locale
/// - Parsing API date strings (ISO 8601 format: 2023-10-26T21:00:00.000000Z)
/// - Formatting dates for display in various formats - Uses current locale
class DateFormatter {
  // API Format Constants
  static const String apiDateFormat = 'yyyy-MM-dd';
  static const String apiDateTimeFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'";
  
  // Display Format Constants
  static const String displayDateFormat = 'dd/MM/yyyy';
  static const String displayDateTimeFormat = 'dd/MM/yyyy HH:mm';
  static const String displayMonthDateFormat = 'MMM dd, yyyy';
  static const String displayFullDateFormat = 'EEEE, MMMM dd, yyyy';

  // English locale for API formatting (to ensure English digits 0-9)
  static const String apiLocale = 'en';

  /// Convert Arabic digits (٠-٩) to English digits (0-9)
  /// This ensures that dates are always sent to API with English digits
  static String _convertArabicDigitsToEnglish(String input) {
    const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    const englishDigits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    
    String result = input;
    for (int i = 0; i < arabicDigits.length; i++) {
      result = result.replaceAll(arabicDigits[i], englishDigits[i]);
    }
    return result;
  }

  /// Convert English digits (0-9) to Arabic digits (٠-٩)
  /// Used for displaying dates in Arabic locale
  static String _convertEnglishDigitsToArabic(String input) {
    const arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    const englishDigits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    
    String result = input;
    for (int i = 0; i < englishDigits.length; i++) {
      result = result.replaceAll(englishDigits[i], arabicDigits[i]);
    }
    return result;
  }

  /// Convert DateTime to API format string (yyyy-MM-dd)
  /// Used when sending data to API endpoints
  /// Always uses English locale to ensure English digits (0-9) instead of Arabic digits (٠-٩)
  /// 
  /// Example: DateTime(2023, 10, 27) -> "2023-10-27"
  static String toApiFormat(DateTime date) {
    return DateFormat(apiDateFormat, apiLocale).format(date);
  }

  /// Convert nullable DateTime to API format string (yyyy-MM-dd)
  /// Returns null if date is null
  static String? toApiFormatNullable(DateTime? date) {
    if (date == null) return null;
    return toApiFormat(date);
  }

  /// Parse API date string to DateTime
  /// Handles both ISO 8601 format (2023-10-26T21:00:00.000000Z) and simple format (2023-10-26)
  /// Always uses English locale to ensure correct parsing
  /// Converts Arabic digits to English digits before parsing
  /// 
  /// Example: "2023-10-26T21:00:00.000000Z" -> DateTime(2023, 10, 26, 21, 0, 0)
  /// Example: "2023-10-26" -> DateTime(2023, 10, 26)
  /// Example: "٢٠٢٥-١١-٠٨" -> DateTime(2025, 11, 8)
  static DateTime? parseApiDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    
    try {
      // Convert Arabic digits to English digits first
      String processedString = _convertArabicDigitsToEnglish(dateString);
      
      // If it's ISO 8601 format, extract date part only
      if (processedString.contains('T')) {
        final datePart = processedString.split('T').first;
        return DateFormat(apiDateFormat, apiLocale).parse(datePart);
      }
      // If it's already in yyyy-MM-dd format
      return DateFormat(apiDateFormat, apiLocale).parse(processedString);
    } catch (e) {
      // Fallback to DateTime.parse for other formats
      try {
        String processedString = _convertArabicDigitsToEnglish(dateString);
        return DateTime.parse(processedString);
      } catch (e) {
        return null;
      }
    }
  }

  /// Extract date part from API date string (removes time part)
  /// Converts ISO 8601 format to yyyy-MM-dd format
  /// Always converts Arabic digits to English digits to ensure API compatibility
  /// 
  /// Example: "2023-10-26T21:00:00.000000Z" -> "2023-10-26"
  /// Example: "2023-10-26" -> "2023-10-26"
  /// Example: "٢٠٢٥-١١-٠٨" -> "2025-11-08"
  static String? extractDateFromApiString(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    
    try {
      String processedString = _convertArabicDigitsToEnglish(dateString);
      
      if (processedString.contains('T')) {
        return processedString.split('T').first;
      }
      // If already in yyyy-MM-dd format, return as is (with English digits)
      if (processedString.length == 10 && processedString.contains('-')) {
        return processedString;
      }
      // Try to parse and format
      final date = DateTime.parse(processedString);
      return toApiFormat(date);
    } catch (e) {
      // If parsing fails, try to convert Arabic digits and return
      return _convertArabicDigitsToEnglish(dateString);
    }
  }

  /// Convert API date string to API format string (for display in text fields)
  /// Extracts date part from ISO 8601 format
  /// 
  /// Example: "2023-10-26T21:00:00.000000Z" -> "2023-10-26"
  static String? apiStringToApiFormat(String? dateString) {
    return extractDateFromApiString(dateString);
  }

  /// Format DateTime for display (dd/MM/yyyy)
  /// 
  /// Example: DateTime(2023, 10, 27) -> "27/10/2023"
  static String toDisplayFormat(DateTime date) {
    return DateFormat(displayDateFormat).format(date);
  }

  /// Format nullable DateTime for display (dd/MM/yyyy)
  static String? toDisplayFormatNullable(DateTime? date) {
    if (date == null) return null;
    return toDisplayFormat(date);
  }

  /// Format DateTime with time for display (dd/MM/yyyy HH:mm)
  /// 
  /// Example: DateTime(2023, 10, 27, 14, 30) -> "27/10/2023 14:30"
  static String toDisplayDateTimeFormat(DateTime date) {
    return DateFormat(displayDateTimeFormat).format(date);
  }

  /// Format DateTime for month date display (MMM dd, yyyy)
  /// 
  /// Example: DateTime(2023, 10, 27) -> "Oct 27, 2023"
  static String toMonthDateFormat(DateTime date) {
    return DateFormat(displayMonthDateFormat).format(date);
  }

  /// Format DateTime for full date display (EEEE, MMMM dd, yyyy)
  /// 
  /// Example: DateTime(2023, 10, 27) -> "Friday, October 27, 2023"
  static String toFullDateFormat(DateTime date) {
    return DateFormat(displayFullDateFormat).format(date);
  }

  /// Convert API date string to display format (dd/MM/yyyy)
  /// 
  /// Example: "2023-10-26T21:00:00.000000Z" -> "26/10/2023"
  static String? apiStringToDisplayFormat(String? dateString) {
    final date = parseApiDate(dateString);
    if (date == null) return dateString;
    return toDisplayFormat(date);
  }

  /// Convert API date string to month date format (MMM dd, yyyy)
  /// 
  /// Example: "2023-10-26T21:00:00.000000Z" -> "Oct 26, 2023"
  static String? apiStringToMonthDateFormat(String? dateString) {
    final date = parseApiDate(dateString);
    if (date == null) return dateString;
    return toMonthDateFormat(date);
  }

  /// Convert API date string to display date time format (dd/MM/yyyy HH:mm)
  /// 
  /// Example: "2023-10-26T21:00:00.000000Z" -> "26/10/2023 21:00"
  static String? apiStringToDisplayDateTimeFormat(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    
    try {
      final date = DateTime.parse(dateString);
      return toDisplayDateTimeFormat(date);
    } catch (e) {
      return dateString;
    }
  }

  /// Get current date in API format
  static String getCurrentDateApiFormat() {
    return toApiFormat(DateTime.now());
  }

  /// Get current date as DateTime
  static DateTime getCurrentDate() {
    return DateTime.now();
  }

  /// Check if date string is valid
  static bool isValidDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return false;
    return parseApiDate(dateString) != null;
  }

  /// Format date for text field (yyyy-MM-dd)
  /// Used when populating date fields from API response
  /// If locale is 'ar', displays with Arabic digits (٠-٩)
  /// If locale is 'en' or null, displays with English digits (0-9)
  /// 
  /// Example: "2023-10-26T21:00:00.000000Z" -> "2023-10-26" (English) or "٢٠٢٣-١٠-٢٦" (Arabic)
  static String? formatForTextField(String? dateString, {String? locale}) {
    final formatted = extractDateFromApiString(dateString);
    if (formatted == null) return null;
    
    // If locale is Arabic, convert English digits to Arabic digits for display
    if (locale == 'ar') {
      return _convertEnglishDigitsToArabic(formatted);
    }
    
    // Otherwise, return with English digits
    return formatted;
  }
}

