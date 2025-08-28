// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_respond.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRespond _$LoginRespondFromJson(Map<String, dynamic> json) => LoginRespond(
  user: json['user'] == null
      ? null
      : LoginUser.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String?,
  message: json['message'] as String?,
  errors: (json['errors'] as Map<String, dynamic>?)?.map(
    (k, e) =>
        MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
  ),
);

Map<String, dynamic> _$LoginRespondToJson(LoginRespond instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'message': instance.message,
      'errors': instance.errors,
    };

LoginUser _$LoginUserFromJson(Map<String, dynamic> json) => LoginUser(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  googleId: json['google_id'],
  emailVerifiedAt: json['email_verified_at'],
  status: json['status'] as String?,
  currentTeamId: json['current_team_id'],
  profilePhotoPath: json['profile_photo_path'],
  phone: json['phone'],
  position: json['position'],
  role: json['role'] as String?,
  twoFactorConfirmedAt: json['two_factor_confirmed_at'],
  companyId: (json['company_id'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  profilePhotoUrl: json['profile_photo_url'] as String?,
);

Map<String, dynamic> _$LoginUserToJson(LoginUser instance) => <String, dynamic>{
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
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'profile_photo_url': instance.profilePhotoUrl,
};
