// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_login_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleLoginData _$GoogleLoginDataFromJson(Map<String, dynamic> json) =>
    GoogleLoginData(
      user: json['user'] == null
          ? null
          : LoginUser.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
      tokenType: json['token_type'] as String?,
      provider: json['provider'] as String?,
      roleId: (json['role_id'] as num?)?.toInt(),
      passwordUpdateRequired: json['password_update_required'] as bool?,
      defaultPassword: json['default_password'] as String?,
      passwordMessage: json['password_message'] as String?,
    );

Map<String, dynamic> _$GoogleLoginDataToJson(GoogleLoginData instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'token_type': instance.tokenType,
      'provider': instance.provider,
      'role_id': instance.roleId,
      'password_update_required': instance.passwordUpdateRequired,
      'default_password': instance.defaultPassword,
      'password_message': instance.passwordMessage,
    };
