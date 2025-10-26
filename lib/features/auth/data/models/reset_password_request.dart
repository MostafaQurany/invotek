import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_request.g.dart';

@JsonSerializable()
class ResetPasswordRequest {
  @JsonKey(name: 'verify_token')
  final String verifyToken;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;

  const ResetPasswordRequest({
    required this.verifyToken,
    required this.password,
    required this.passwordConfirmation,
  });

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordRequestToJson(this);
}
