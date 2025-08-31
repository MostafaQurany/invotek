import 'package:json_annotation/json_annotation.dart';

part 'company_api_model.g.dart';

@JsonSerializable()
class CompanyApiModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;
  @JsonKey(name: 'tax_merchant_code')
  final String? taxMerchantCode;
  @JsonKey(name: 'tax_invoice_type')
  final String? taxInvoiceType;
  @JsonKey(name: 'tax_integration_active')
  final bool taxIntegrationActive;
  final String? logo;
  final String status;
  @JsonKey(name: 'admin_id')
  final int adminId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  final Map<String, dynamic>? admin;

  CompanyApiModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    this.taxMerchantCode,
    this.taxInvoiceType,
    required this.taxIntegrationActive,
    this.logo,
    required this.status,
    required this.adminId,
    required this.createdAt,
    required this.updatedAt,
    this.admin,
  });

  factory CompanyApiModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyApiModelToJson(this);
}
