// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApiModel _$UserApiModelFromJson(Map<String, dynamic> json) => UserApiModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  googleId: json['google_id'] as String?,
  emailVerifiedAt: json['email_verified_at'] as String?,
  status: json['status'] as String,
  currentTeamId: (json['current_team_id'] as num?)?.toInt(),
  profilePhotoPath: json['profile_photo_path'] as String?,
  phone: json['phone'] as String?,
  position: json['position'] as String?,
  role: json['role'] as String,
  twoFactorConfirmedAt: json['two_factor_confirmed_at'] as String?,
  companyId: (json['company_id'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  profilePhotoUrl: json['profile_photo_url'] as String?,
  company: json['company'] == null
      ? null
      : CompanyApiModel.fromJson(json['company'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserApiModelToJson(UserApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'google_id': instance.googleId,
      'email_verified_at': instance.emailVerifiedAt,
      'status': instance.status,
      'current_team_id': instance.currentTeamId,
      'profile_photo_path': instance.profilePhotoPath,
      'phone': instance.phone,
      'position': instance.position,
      'role': instance.role,
      'two_factor_confirmed_at': instance.twoFactorConfirmedAt,
      'company_id': instance.companyId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'profile_photo_url': instance.profilePhotoUrl,
      'company': instance.company,
    };
