// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activating_tax_integration_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivatingTaxIntegrationResponses _$ActivatingTaxIntegrationResponsesFromJson(
  Map<String, dynamic> json,
) => ActivatingTaxIntegrationResponses(
  success: json['success'] as String,
  message: json['message'] as String,
  data: ActivatingTaxIntegrationData.fromJson(
    json['data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ActivatingTaxIntegrationResponsesToJson(
  ActivatingTaxIntegrationResponses instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

ActivatingTaxIntegrationData _$ActivatingTaxIntegrationDataFromJson(
  Map<String, dynamic> json,
) => ActivatingTaxIntegrationData(
  taxMerchantCode: json['tax_merchant_code'] as String,
  taxInvoiceType: json['tax_invoice_type'] as String,
  taxIntegrationActive: json['tax_integration_active'] as bool,
);

Map<String, dynamic> _$ActivatingTaxIntegrationDataToJson(
  ActivatingTaxIntegrationData instance,
) => <String, dynamic>{
  'tax_merchant_code': instance.taxMerchantCode,
  'tax_invoice_type': instance.taxInvoiceType,
  'tax_integration_active': instance.taxIntegrationActive,
};
