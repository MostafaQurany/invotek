// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tax_integration_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTaxIntegrationStatus _$GetTaxIntegrationStatusFromJson(
  Map<String, dynamic> json,
) => GetTaxIntegrationStatus(
  success: json['success'] as bool,
  data: GetTaxIntegrationStatusData.fromJson(
    json['data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GetTaxIntegrationStatusToJson(
  GetTaxIntegrationStatus instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

GetTaxIntegrationStatusData _$GetTaxIntegrationStatusDataFromJson(
  Map<String, dynamic> json,
) => GetTaxIntegrationStatusData(
  taxIntegrationActive: json['tax_integration_active'] as bool,
  taxMerchantCode: json['tax_merchant_code'] as String?,
  taxInvoiceType: json['tax_invoice_type'] as String?,
  companyName: json['company_name'] as String?,
);

Map<String, dynamic> _$GetTaxIntegrationStatusDataToJson(
  GetTaxIntegrationStatusData instance,
) => <String, dynamic>{
  'tax_integration_active': instance.taxIntegrationActive,
  'tax_merchant_code': instance.taxMerchantCode,
  'tax_invoice_type': instance.taxInvoiceType,
  'company_name': instance.companyName,
};
