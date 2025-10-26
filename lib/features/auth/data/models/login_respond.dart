// lib/features/auth/data/models/login_respond.dart
import 'package:json_annotation/json_annotation.dart';

part 'login_respond.g.dart';

@JsonSerializable()
class LoginRespond {
  final LoginUser? user;
  final String? token;
  @JsonKey(name: 'role_id')
  final int? roleId;
  final String? message;
  final Map<String, List<String>>? errors;

  LoginRespond({this.user, this.token, this.roleId, this.message, this.errors});

  factory LoginRespond.fromJson(Map<String, dynamic> json) =>
      _$LoginRespondFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRespondToJson(this);

  // التحقق من وجود أخطاء
  bool get hasError => message != null || errors != null;

  // الحصول على رسالة الخطأ
  String? get errorMessage {
    if (message != null) return message;
    if (errors != null && errors!.isNotEmpty) {
      return errors!.values.first.first;
    }
    return null;
  }
}

@JsonSerializable()
class LoginUser {
  final int? id;
  final String? name;
  final String? email;
  @JsonKey(name: 'google_id')
  final dynamic googleId;
  @JsonKey(name: 'email_verified_at')
  final dynamic emailVerifiedAt;
  final String? status;
  @JsonKey(name: 'current_team_id')
  final dynamic currentTeamId;
  @JsonKey(name: 'profile_photo_path')
  final dynamic profilePhotoPath;
  final dynamic phone;
  final dynamic position;
  final String? role;
  @JsonKey(name: 'two_factor_confirmed_at')
  final dynamic twoFactorConfirmedAt;
  @JsonKey(name: 'company_id')
  final int? companyId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'profile_photo_url')
  final String? profilePhotoUrl;

  LoginUser({
    this.id,
    this.name,
    this.email,
    this.googleId,
    this.emailVerifiedAt,
    this.status,
    this.currentTeamId,
    this.profilePhotoPath,
    this.phone,
    this.position,
    this.role,
    this.twoFactorConfirmedAt,
    this.companyId,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) =>
      _$LoginUserFromJson(json);
  Map<String, dynamic> toJson() => _$LoginUserToJson(this);
}
