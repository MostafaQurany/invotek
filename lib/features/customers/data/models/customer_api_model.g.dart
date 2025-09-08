// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerApiModel _$CustomerApiModelFromJson(
  Map<String, dynamic> json,
) => CustomerApiModel(
  id: (json['id'] as num).toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  taxNumber: json['tax_number'] as String?,
  address: json['address'] as String?,
  notes: json['notes'] as String?,
  status: json['status'] as String?,
  createdAt: CustomerApiModel._stringToDateTime(json['created_at'] as String?),
  updatedAt: CustomerApiModel._stringToDateTime(json['updated_at'] as String?),
);

Map<String, dynamic> _$CustomerApiModelToJson(CustomerApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'tax_number': instance.taxNumber,
      'address': instance.address,
      'notes': instance.notes,
      'status': instance.status,
      'created_at': CustomerApiModel._dateTimeToString(instance.createdAt),
      'updated_at': CustomerApiModel._dateTimeToString(instance.updatedAt),
    };
