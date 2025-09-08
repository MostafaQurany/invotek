// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_customer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCustomerRequest _$UpdateCustomerRequestFromJson(
  Map<String, dynamic> json,
) => UpdateCustomerRequest(
  name: json['name'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String?,
  taxNumber: json['tax_number'] as String?,
  address: json['address'] as String?,
  notes: json['notes'] as String?,
  status: json['status'] as String?,
);

Map<String, dynamic> _$UpdateCustomerRequestToJson(
  UpdateCustomerRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'tax_number': instance.taxNumber,
  'address': instance.address,
  'notes': instance.notes,
  'status': instance.status,
};
