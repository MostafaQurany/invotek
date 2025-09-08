import 'package:json_annotation/json_annotation.dart';

part 'update_customer_request.g.dart';

@JsonSerializable()
class UpdateCustomerRequest {
  final String name;
  final String email;
  final String? phone;
  @JsonKey(name: 'tax_number')
  final String? taxNumber;
  final String? address;
  final String? notes;
  final String? status;

  UpdateCustomerRequest({
    required this.name,
    required this.email,
    this.phone,
    this.taxNumber,
    this.address,
    this.notes,
    this.status,
  });

  factory UpdateCustomerRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCustomerRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCustomerRequestToJson(this);
}
