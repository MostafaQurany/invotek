import 'package:json_annotation/json_annotation.dart';

part 'google_login_request.g.dart';

@JsonSerializable()
class GoogleLoginRequest {
  @JsonKey(name: 'id_token')
  final String idToken;
  final String email;
  final String name;
  @JsonKey(name: "google_id")
  final String googleId;

  GoogleLoginRequest({
    required this.idToken,
    required this.email,
    required this.name,
    required this.googleId,
  });

  factory GoogleLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleLoginRequestToJson(this);
}
