import 'package:json_annotation/json_annotation.dart';

import '../customer_api_model.dart';

part 'get_customer_by_id_response.g.dart';

@JsonSerializable()
class GetCustomerByIdResponse {
  final int id;
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

  GetCustomerByIdResponse({
    required this.id,
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

  factory GetCustomerByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCustomerByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCustomerByIdResponseToJson(this);

  CustomerApiModel toCustomerApiModel() {
    return CustomerApiModel(
      id: id,
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
