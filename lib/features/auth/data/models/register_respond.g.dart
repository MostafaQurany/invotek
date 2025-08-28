// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_respond.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRespond _$RegisterRespondFromJson(Map<String, dynamic> json) =>
    RegisterRespond(
      user: json['user'] == null
          ? null
          : RegisterUser.fromJson(json['user'] as Map<String, dynamic>),
      company: json['company'] == null
          ? null
          : RegisterCompany.fromJson(json['company'] as Map<String, dynamic>),
      token: json['token'] as String?,
      message: json['message'] as String?,
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$RegisterRespondToJson(RegisterRespond instance) =>
    <String, dynamic>{
      'user': instance.user,
      'company': instance.company,
      'token': instance.token,
      'message': instance.message,
      'errors': instance.errors,
    };

RegisterUser _$RegisterUserFromJson(Map<String, dynamic> json) => RegisterUser(
  name: json['name'] as String?,
  email: json['email'] as String?,
  role: json['role'] as String?,
  status: json['status'] as String?,
  updatedAt: json['updated_at'] as String?,
  createdAt: json['created_at'] as String?,
  id: (json['id'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  profilePhotoUrl: json['profile_photo_url'] as String?,
);

Map<String, dynamic> _$RegisterUserToJson(RegisterUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'status': instance.status,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
      'company_id': instance.companyId,
      'profile_photo_url': instance.profilePhotoUrl,
    };

RegisterCompany _$RegisterCompanyFromJson(Map<String, dynamic> json) =>
    RegisterCompany(
      name: json['name'] as String?,
      email: json['email'] as String?,
      adminId: (json['admin_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: (json['id'] as num?)?.toInt(),
      admin: json['admin'] == null
          ? null
          : RegisterCompanyAdmin.fromJson(
              json['admin'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$RegisterCompanyToJson(RegisterCompany instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'admin_id': instance.adminId,
      'status': instance.status,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
      'admin': instance.admin,
    };

RegisterCompanyAdmin _$RegisterCompanyAdminFromJson(
  Map<String, dynamic> json,
) => RegisterCompanyAdmin(
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
  companyId: json['company_id'],
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  profilePhotoUrl: json['profile_photo_url'] as String?,
);

Map<String, dynamic> _$RegisterCompanyAdminToJson(
  RegisterCompanyAdmin instance,
) => <String, dynamic>{
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
