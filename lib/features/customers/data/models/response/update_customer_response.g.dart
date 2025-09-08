// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_customer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCustomerResponse _$UpdateCustomerResponseFromJson(
  Map<String, dynamic> json,
) => UpdateCustomerResponse(
  id: (json['id'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  taxNumber: json['tax_number'] as String?,
  address: json['address'] as String?,
  notes: json['notes'] as String?,
  status: json['status'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$UpdateCustomerResponseToJson(
  UpdateCustomerResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'company_id': instance.companyId,
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'tax_number': instance.taxNumber,
  'address': instance.address,
  'notes': instance.notes,
  'status': instance.status,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
