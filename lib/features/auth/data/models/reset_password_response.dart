import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse {
  final bool success;
  final String message;
  final ResetPasswordData? data;

  const ResetPasswordResponse({
    required this.success,
    required this.message,
    this.data,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseToJson(this);
}

@JsonSerializable()
class ResetPasswordData {
  final ResetPasswordUser user;

  const ResetPasswordData({required this.user});

  factory ResetPasswordData.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordDataToJson(this);
}

@JsonSerializable()
class ResetPasswordUser {
  final int id;
  final String name;
  final String email;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  const ResetPasswordUser({
    required this.id,
    required this.name,
    required this.email,
    required this.updatedAt,
  });

  factory ResetPasswordUser.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordUserFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordUserToJson(this);
}
