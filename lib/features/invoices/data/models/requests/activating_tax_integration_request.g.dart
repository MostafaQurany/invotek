// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activating_tax_integration_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivatingTaxIntegrationRequest _$ActivatingTaxIntegrationRequestFromJson(
  Map<String, dynamic> json,
) => ActivatingTaxIntegrationRequest(
  taxInvoiceType: json['tax_invoice_type'] as String,
  taxMerchantCode: json['tax_merchant_code'] as String,
);

Map<String, dynamic> _$ActivatingTaxIntegrationRequestToJson(
  ActivatingTaxIntegrationRequest instance,
) => <String, dynamic>{
  'tax_invoice_type': instance.taxInvoiceType,
  'tax_merchant_code': instance.taxMerchantCode,
};
