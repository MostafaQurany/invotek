import 'package:json_annotation/json_annotation.dart';

part 'company_settings_response.g.dart';

@JsonSerializable()
class CompanySettingsResponse {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String? address;
  @JsonKey(name: 'tax_merchant_code')
  final String? taxMerchantCode;
  @JsonKey(name: 'tax_invoice_type')
  final String? taxInvoiceType;
  @JsonKey(name: 'tax_integration_active')
  final bool? taxIntegrationActive;
  final String? logo;
  final String status;
  @JsonKey(name: 'admin_id')
  final int adminId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  CompanySettingsResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.status,
    required this.adminId,
    this.address,
    this.taxMerchantCode,
    this.taxInvoiceType,
    this.taxIntegrationActive,
    this.logo,
    this.createdAt,
    this.updatedAt,
  });

  factory CompanySettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanySettingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompanySettingsResponseToJson(this);
}


