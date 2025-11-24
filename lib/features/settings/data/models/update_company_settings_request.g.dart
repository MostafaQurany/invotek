// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_company_settings_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCompanySettingsRequest _$UpdateCompanySettingsRequestFromJson(
  Map<String, dynamic> json,
) => UpdateCompanySettingsRequest(
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
);

Map<String, dynamic> _$UpdateCompanySettingsRequestToJson(
  UpdateCompanySettingsRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'address': instance.address,
};
