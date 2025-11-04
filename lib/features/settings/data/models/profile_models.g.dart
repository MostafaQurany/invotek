// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: _ProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) =>
    _ProfileData(user: User.fromJson(json['user'] as Map<String, dynamic>));

Map<String, dynamic> _$ProfileDataToJson(_ProfileData instance) =>
    <String, dynamic>{'user': instance.user};
