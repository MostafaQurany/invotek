// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceCustomerModel _$InvoiceCustomerModelFromJson(
  Map<String, dynamic> json,
) => InvoiceCustomerModel(
  id: (json['id'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  name: json['name'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  taxNumber: json['tax_number'] as String?,
  address: json['address'] as String?,
  notes: json['notes'] as String?,
  status: json['status'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$InvoiceCustomerModelToJson(
  InvoiceCustomerModel instance,
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
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
