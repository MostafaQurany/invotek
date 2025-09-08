import 'package:json_annotation/json_annotation.dart';

part 'create_customer_request.g.dart';

@JsonSerializable()
class CreateCustomerRequest {
  final String name;
  final String email;
  final String? phone;
  @JsonKey(name: 'tax_number')
  final String? taxNumber;
  final String? address;
  final String? notes;
  final String? status;
  @JsonKey(name: 'company_name')
  final String? companyName;
  @JsonKey(name: 'commercial_register')
  final String? commercialRegister;
  final String? city;
  final String? region;
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  @JsonKey(name: 'detailed_address')
  final String? detailedAddress;
  @JsonKey(name: 'responsible_person')
  final String? responsiblePerson;

  CreateCustomerRequest({
    required this.name,
    required this.email,
    this.phone,
    this.taxNumber,
    this.address,
    this.notes,
    this.status,
    this.companyName,
    this.commercialRegister,
    this.city,
    this.region,
    this.postalCode,
    this.detailedAddress,
    this.responsiblePerson,
  });

  factory CreateCustomerRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCustomerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCustomerRequestToJson(this);
}
