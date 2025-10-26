import 'package:json_annotation/json_annotation.dart';
import 'google_login_data.dart';

part 'google_login_respond.g.dart';

@JsonSerializable()
class GoogleLoginRespond {
  final bool? success;
  final String? message;
  final GoogleLoginData? data;
  final Map<String, List<String>>? errors;

  GoogleLoginRespond({this.success, this.message, this.data, this.errors});

  factory GoogleLoginRespond.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginRespondFromJson(json);
  Map<String, dynamic> toJson() => _$GoogleLoginRespondToJson(this);

  // التحقق من وجود أخطاء
  bool get hasError => success == false || errors != null;

  // الحصول على رسالة الخطأ
  String? get errorMessage {
    if (success == false && message != null) return message;
    if (errors != null && errors!.isNotEmpty) {
      return errors!.values.first.first;
    }
    return null;
  }
}
