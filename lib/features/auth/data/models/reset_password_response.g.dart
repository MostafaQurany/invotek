// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponse _$ResetPasswordResponseFromJson(
  Map<String, dynamic> json,
) => ResetPasswordResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: json['data'] == null
      ? null
      : ResetPasswordData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ResetPasswordResponseToJson(
  ResetPasswordResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

ResetPasswordData _$ResetPasswordDataFromJson(Map<String, dynamic> json) =>
    ResetPasswordData(
      user: ResetPasswordUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResetPasswordDataToJson(ResetPasswordData instance) =>
    <String, dynamic>{'user': instance.user};

ResetPasswordUser _$ResetPasswordUserFromJson(Map<String, dynamic> json) =>
    ResetPasswordUser(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$ResetPasswordUserToJson(ResetPasswordUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'updated_at': instance.updatedAt,
    };
