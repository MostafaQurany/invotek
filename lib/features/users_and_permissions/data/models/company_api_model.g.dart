// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyApiModel _$CompanyApiModelFromJson(Map<String, dynamic> json) =>
    CompanyApiModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      taxMerchantCode: json['tax_merchant_code'] as String?,
      taxInvoiceType: json['tax_invoice_type'] as String?,
      taxIntegrationActive: json['tax_integration_active'] as bool,
      logo: json['logo'] as String?,
      status: json['status'] as String,
      adminId: (json['admin_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      admin: json['admin'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CompanyApiModelToJson(CompanyApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'tax_merchant_code': instance.taxMerchantCode,
      'tax_invoice_type': instance.taxInvoiceType,
      'tax_integration_active': instance.taxIntegrationActive,
      'logo': instance.logo,
      'status': instance.status,
      'admin_id': instance.adminId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'admin': instance.admin,
    };
