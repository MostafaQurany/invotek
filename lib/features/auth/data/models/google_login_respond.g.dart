// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_login_respond.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleLoginRespond _$GoogleLoginRespondFromJson(Map<String, dynamic> json) =>
    GoogleLoginRespond(
      token: json['token'] as String?,
      message: json['message'] as String?,
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$GoogleLoginRespondToJson(GoogleLoginRespond instance) =>
    <String, dynamic>{
      'token': instance.token,
      'message': instance.message,
      'errors': instance.errors,
    };
