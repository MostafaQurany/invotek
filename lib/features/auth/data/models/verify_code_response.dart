import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_code_response.g.dart';

@JsonSerializable()
class VerifyCodeResponse {
  final bool success;
  final String message;
  final VerifyCodeData? data;

  const VerifyCodeResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeResponseToJson(this);
}

@JsonSerializable()
class VerifyCodeData {
  @JsonKey(name: 'verify_token')
  final String verifyToken;
  @JsonKey(name: 'expires_at')
  final String expiresAt;

  const VerifyCodeData({required this.verifyToken, required this.expiresAt});

  factory VerifyCodeData.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeDataFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeDataToJson(this);
}
