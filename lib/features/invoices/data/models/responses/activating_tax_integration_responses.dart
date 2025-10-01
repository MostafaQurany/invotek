/**
 * {
    "success": true,
    "message": "تم تفعيل التكامل الضريبي بنجاح",
    "data": {
        "tax_merchant_code": "48236968",
        "tax_invoice_type": "income",
        "tax_integration_active": true
    }
}
 */
library;

import 'package:json_annotation/json_annotation.dart';

part 'activating_tax_integration_responses.g.dart';

@JsonSerializable()
class ActivatingTaxIntegrationResponses {
  final String success;
  final String message;
  final ActivatingTaxIntegrationData data;
  ActivatingTaxIntegrationResponses({required this.success, required this.message, required this.data});
  factory ActivatingTaxIntegrationResponses.fromJson(Map<String, dynamic> json) =>
      _$ActivatingTaxIntegrationResponsesFromJson(json);
  Map<String, dynamic> toJson() => _$ActivatingTaxIntegrationResponsesToJson(this);
}

@JsonSerializable()
class ActivatingTaxIntegrationData {
  @JsonKey(name: 'tax_merchant_code')
  final String taxMerchantCode;
  @JsonKey(name: 'tax_invoice_type')
  final String taxInvoiceType;
  @JsonKey(name: 'tax_integration_active')
  final bool taxIntegrationActive;
  ActivatingTaxIntegrationData({required this.taxMerchantCode, required this.taxInvoiceType, required this.taxIntegrationActive});
  factory ActivatingTaxIntegrationData.fromJson(Map<String, dynamic> json) =>
      _$ActivatingTaxIntegrationDataFromJson(json);
  Map<String, dynamic> toJson() => _$ActivatingTaxIntegrationDataToJson(this);
}





