import 'package:json_annotation/json_annotation.dart';

part 'activating_tax_integration_request.g.dart';

@JsonSerializable()
class ActivatingTaxIntegrationRequest {
  @JsonKey(name: 'tax_invoice_type')
  final String taxInvoiceType;
  @JsonKey(name: 'tax_merchant_code')
  final String taxMerchantCode;

  ActivatingTaxIntegrationRequest({
    required this.taxInvoiceType,
    required this.taxMerchantCode,
  });

  factory ActivatingTaxIntegrationRequest.fromJson(Map<String, dynamic> json) =>
      _$ActivatingTaxIntegrationRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ActivatingTaxIntegrationRequestToJson(this);
}
