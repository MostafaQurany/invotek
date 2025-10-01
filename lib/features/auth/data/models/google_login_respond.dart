import 'package:json_annotation/json_annotation.dart';

part 'google_login_respond.g.dart';

@JsonSerializable()
class GoogleLoginRespond {
  final String? token;
  final String? message;
  final Map<String, List<String>>? errors;

  GoogleLoginRespond({this.token, this.message, this.errors});


  factory GoogleLoginRespond.fromJson(Map<String, dynamic> json) => _$GoogleLoginRespondFromJson(json);
  Map<String, dynamic> toJson() => _$GoogleLoginRespondToJson(this);
}
