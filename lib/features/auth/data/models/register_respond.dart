// lib/features/auth/data/models/register_respond.dart
import 'package:json_annotation/json_annotation.dart';

part 'register_respond.g.dart';

@JsonSerializable()
class RegisterRespond {
  final RegisterUser? user;
  final RegisterCompany? company;
  final String? token;
  final String? message;
  final Map<String, List<String>>? errors;

  RegisterRespond({
    this.user,
    this.company,
    this.token,
    this.message,
    this.errors,
  });

  factory RegisterRespond.fromJson(Map<String, dynamic> json) =>
      _$RegisterRespondFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRespondToJson(this);

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
class RegisterUser {
  final String? name;
  final String? email;
  final String? role;
  final String? status;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  final int? id;
  @JsonKey(name: 'company_id')
  final int? companyId;
  @JsonKey(name: 'profile_photo_url')
  final String? profilePhotoUrl;

  RegisterUser({
    this.name,
    this.email,
    this.role,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.companyId,
    this.profilePhotoUrl,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterUserToJson(this);
}

@JsonSerializable()
class RegisterCompany {
  final String? name;
  final String? email;
  @JsonKey(name: 'admin_id')
  final int? adminId;
  final String? status;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  final int? id;
  final RegisterCompanyAdmin? admin;

  RegisterCompany({
    this.name,
    this.email,
    this.adminId,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.admin,
  });

  factory RegisterCompany.fromJson(Map<String, dynamic> json) =>
      _$RegisterCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterCompanyToJson(this);
}

@JsonSerializable()
class RegisterCompanyAdmin {
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
  final dynamic companyId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'profile_photo_url')
  final String? profilePhotoUrl;

  RegisterCompanyAdmin({
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

  factory RegisterCompanyAdmin.fromJson(Map<String, dynamic> json) =>
      _$RegisterCompanyAdminFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterCompanyAdminToJson(this);
}
