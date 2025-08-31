// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) =>
    CreateUserResponse(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      position: json['position'] as String?,
      status: json['status'] as String?,
      company_id: json['company_id'] as num?,
      role: json['role'] as String?,
      updated_at: json['updated_at'] as String?,
      created_at: json['created_at'] as String?,
      id: (json['id'] as num?)?.toInt(),
      profile_photo_url: json['profile_photo_url'] as String?,
    );

Map<String, dynamic> _$CreateUserResponseToJson(CreateUserResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'position': instance.position,
      'status': instance.status,
      'company_id': instance.company_id,
      'role': instance.role,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
      'id': instance.id,
      'profile_photo_url': instance.profile_photo_url,
    };
