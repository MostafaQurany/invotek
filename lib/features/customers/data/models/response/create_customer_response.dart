import 'package:json_annotation/json_annotation.dart';

import '../customer_api_model.dart';

part 'create_customer_response.g.dart';

@JsonSerializable()
class CreateCustomerResponse {
  final int? id;
  @JsonKey(name: 'company_id')
  final int? companyId;
  final String? name;
  final String? email;
  final String? phone;
  @JsonKey(name: 'tax_number')
  final String? taxNumber;
  final String? address;
  final String? notes;
  final String? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  CreateCustomerResponse({
    this.id,
    this.companyId,
    this.name,
    this.email,
    this.phone,
    this.taxNumber,
    this.address,
    this.notes,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory CreateCustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCustomerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCustomerResponseToJson(this);

  CustomerApiModel toCustomerApiModel() {
    return CustomerApiModel(
      id: id ?? 0,
      companyId: companyId,
      name: name,
      email: email,
      phone: phone,
      taxNumber: taxNumber,
      address: address,
      notes: notes,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
