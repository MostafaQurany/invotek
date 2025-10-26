// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Permission _$PermissionFromJson(Map<String, dynamic> json) => Permission(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  key: json['key'] as String,
  module: json['module'] as String,
  description: json['description'] as String,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$PermissionToJson(Permission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'key': instance.key,
      'module': instance.module,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

PermissionsResponse _$PermissionsResponseFromJson(Map<String, dynamic> json) =>
    PermissionsResponse(
      success: json['success'] as bool,
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          (e as List<dynamic>)
              .map((e) => Permission.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
    );

Map<String, dynamic> _$PermissionsResponseToJson(
  PermissionsResponse instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

UserPermissions _$UserPermissionsFromJson(Map<String, dynamic> json) =>
    UserPermissions(
      permissions: (json['permissions'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          k,
          (e as List<dynamic>)
              .map((e) => Permission.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
      loadedAt: json['loaded_at'] as String?,
    );

Map<String, dynamic> _$UserPermissionsToJson(UserPermissions instance) =>
    <String, dynamic>{
      'permissions': instance.permissions,
      'loaded_at': instance.loadedAt,
    };
