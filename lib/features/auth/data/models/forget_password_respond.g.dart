// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_respond.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponse _$ForgetPasswordResponseFromJson(
  Map<String, dynamic> json,
) => ForgetPasswordResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: json['data'] == null
      ? null
      : ForgetPasswordData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ForgetPasswordResponseToJson(
  ForgetPasswordResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

ForgetPasswordData _$ForgetPasswordDataFromJson(Map<String, dynamic> json) =>
    ForgetPasswordData(
      email: json['email'] as String,
      expiresAt: json['expires_at'] as String,
    );

Map<String, dynamic> _$ForgetPasswordDataToJson(ForgetPasswordData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'expires_at': instance.expiresAt,
    };
