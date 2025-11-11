/**{
    "success": true,
    "data": {
        "tax_integration_active": true,
        "tax_merchant_code": "48236968",
        "tax_invoice_type": "income",
        "company_name": "tester"
    }
} */
library;

import 'package:json_annotation/json_annotation.dart';

part 'get_tax_integration_status.g.dart';

@JsonSerializable()
class GetTaxIntegrationStatus {
  final bool success;
  final GetTaxIntegrationStatusData data;
  GetTaxIntegrationStatus({required this.success, required this.data});
  factory GetTaxIntegrationStatus.fromJson(Map<String, dynamic> json) =>
      _$GetTaxIntegrationStatusFromJson(json);
  Map<String, dynamic> toJson() => _$GetTaxIntegrationStatusToJson(this);
}

@JsonSerializable()
class GetTaxIntegrationStatusData {
  @JsonKey(name: 'tax_integration_active')
  final bool taxIntegrationActive;
  @JsonKey(name: 'tax_merchant_code')
  final String? taxMerchantCode;
  @JsonKey(name: 'tax_invoice_type')
  final String? taxInvoiceType;
  @JsonKey(name: 'company_name')
  final String? companyName;
  GetTaxIntegrationStatusData({
    required this.taxIntegrationActive,
    required this.taxMerchantCode,
    required this.taxInvoiceType,
    required this.companyName,
  });
  factory GetTaxIntegrationStatusData.fromJson(Map<String, dynamic> json) =>
      _$GetTaxIntegrationStatusDataFromJson(json);
  Map<String, dynamic> toJson() => _$GetTaxIntegrationStatusDataToJson(this);
}
