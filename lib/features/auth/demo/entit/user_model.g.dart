// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
  token: json['token'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'user': instance.user?.toJson(),
  'token': instance.token,
};

User _$UserFromJson(Map<String, dynamic> json) => User(
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
  company: json['company'] == null
      ? null
      : Company.fromJson(json['company'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
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
  'company': instance.company,
};

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  taxMerchantCode: json['tax_merchant_code'],
  taxInvoiceType: json['tax_invoice_type'],
  taxIntegrationActive: json['tax_integration_active'] as bool?,
  logo: json['logo'],
  status: json['status'] as String?,
  adminId: (json['admin_id'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  admin: json['admin'] == null
      ? null
      : User.fromJson(json['admin'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'address': instance.address,
  'tax_merchant_code': instance.taxMerchantCode,
  'tax_invoice_type': instance.taxInvoiceType,
  'tax_integration_active': instance.taxIntegrationActive,
  'logo': instance.logo,
  'status': instance.status,
  'admin_id': instance.adminId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'admin': instance.admin,
};
