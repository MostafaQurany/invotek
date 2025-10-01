import 'package:json_annotation/json_annotation.dart';

part 'invoice_customer_model.g.dart';

@JsonSerializable()
class InvoiceCustomerModel {
  final String id;
  @JsonKey(name: "company_id")
  final String companyId;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "phone")
  final String phone;
  @JsonKey(name: "tax_number")
  final String taxNumber;
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "notes")
  final String notes;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  InvoiceCustomerModel({
    required this.id,
    required this.companyId,
    required this.name,
    required this.email,
    required this.phone,
    required this.taxNumber,
    required this.address,
    required this.notes,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  factory InvoiceCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceCustomerModelFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceCustomerModelToJson(this);
}
