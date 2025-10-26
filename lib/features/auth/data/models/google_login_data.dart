import 'package:json_annotation/json_annotation.dart';
import 'login_respond.dart';

part 'google_login_data.g.dart';

@JsonSerializable()
class GoogleLoginData {
  final LoginUser? user;
  final String? token;
  @JsonKey(name: 'token_type')
  final String? tokenType;
  final String? provider;
  @JsonKey(name: 'role_id')
  final int? roleId;
  @JsonKey(name: 'password_update_required')
  final bool? passwordUpdateRequired;
  @JsonKey(name: 'default_password')
  final String? defaultPassword;
  @JsonKey(name: 'password_message')
  final String? passwordMessage;

  GoogleLoginData({
    this.user,
    this.token,
    this.tokenType,
    this.provider,
    this.roleId,
    this.passwordUpdateRequired,
    this.defaultPassword,
    this.passwordMessage,
  });

  factory GoogleLoginData.fromJson(Map<String, dynamic> json) =>
      _$GoogleLoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$GoogleLoginDataToJson(this);
}
