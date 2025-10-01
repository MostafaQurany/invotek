import 'package:intl/intl.dart';

convertStringToDateTime(String date) {
  return DateTime.parse(date);
}

convertDateTimeToString(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

String? convertDateTimeToJson(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

String? convertDateTimeToJsonNullable(DateTime? date) {
  return date != null ? DateFormat('yyyy-MM-dd').format(date) : null;
}

DateTime? convertDateTimeFromJson(String? date) {
  return date != null ? DateTime.parse(date) : null;
}
