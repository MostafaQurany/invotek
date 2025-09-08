// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_customer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCustomerRequest _$CreateCustomerRequestFromJson(
  Map<String, dynamic> json,
) => CreateCustomerRequest(
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  taxNumber: json['tax_number'] as String?,
  address: json['address'] as String?,
  notes: json['notes'] as String?,
  status: json['status'] as String?,
  companyName: json['company_name'] as String?,
  commercialRegister: json['commercial_register'] as String?,
  city: json['city'] as String?,
  region: json['region'] as String?,
  postalCode: json['postal_code'] as String?,
  detailedAddress: json['detailed_address'] as String?,
  responsiblePerson: json['responsible_person'] as String?,
);

Map<String, dynamic> _$CreateCustomerRequestToJson(
  CreateCustomerRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'tax_number': instance.taxNumber,
  'address': instance.address,
  'notes': instance.notes,
  'status': instance.status,
  'company_name': instance.companyName,
  'commercial_register': instance.commercialRegister,
  'city': instance.city,
  'region': instance.region,
  'postal_code': instance.postalCode,
  'detailed_address': instance.detailedAddress,
  'responsible_person': instance.responsiblePerson,
};
