// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_login_respond.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleLoginRespond _$GoogleLoginRespondFromJson(Map<String, dynamic> json) =>
    GoogleLoginRespond(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : GoogleLoginData.fromJson(json['data'] as Map<String, dynamic>),
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$GoogleLoginRespondToJson(GoogleLoginRespond instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'errors': instance.errors,
    };
