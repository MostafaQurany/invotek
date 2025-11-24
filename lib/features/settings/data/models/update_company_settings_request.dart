import 'package:json_annotation/json_annotation.dart';

part 'update_company_settings_request.g.dart';

@JsonSerializable()
class UpdateCompanySettingsRequest {
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? taxMerchantCode;
  final String? taxInvoiceType;

  UpdateCompanySettingsRequest({
    this.name,
    this.email,
    this.phone,
    this.address,
    this.taxMerchantCode,
    this.taxInvoiceType,
  });

  Map<String, dynamic> toJson() => _$UpdateCompanySettingsRequestToJson(this);
}
