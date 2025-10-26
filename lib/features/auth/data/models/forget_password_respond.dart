import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_respond.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  final bool success;
  final String message;
  final ForgetPasswordData? data;

  const ForgetPasswordResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseToJson(this);
}

@JsonSerializable()
class ForgetPasswordData {
  final String email;
  @JsonKey(name: 'expires_at')
  final String expiresAt;

  const ForgetPasswordData({required this.email, required this.expiresAt});

  factory ForgetPasswordData.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordDataFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordDataToJson(this);
}
