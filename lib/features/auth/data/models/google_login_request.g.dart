// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleLoginRequest _$GoogleLoginRequestFromJson(Map<String, dynamic> json) =>
    GoogleLoginRequest(
      idToken: json['id_token'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      googleId: json['google_id'] as String,
    );

Map<String, dynamic> _$GoogleLoginRequestToJson(GoogleLoginRequest instance) =>
    <String, dynamic>{
      'id_token': instance.idToken,
      'email': instance.email,
      'name': instance.name,
      'google_id': instance.googleId,
    };
