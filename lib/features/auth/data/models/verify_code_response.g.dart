// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeResponse _$VerifyCodeResponseFromJson(Map<String, dynamic> json) =>
    VerifyCodeResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : VerifyCodeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyCodeResponseToJson(VerifyCodeResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

VerifyCodeData _$VerifyCodeDataFromJson(Map<String, dynamic> json) =>
    VerifyCodeData(
      verifyToken: json['verify_token'] as String,
      expiresAt: json['expires_at'] as String,
    );

Map<String, dynamic> _$VerifyCodeDataToJson(VerifyCodeData instance) =>
    <String, dynamic>{
      'verify_token': instance.verifyToken,
      'expires_at': instance.expiresAt,
    };
