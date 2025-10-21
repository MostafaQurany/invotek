import 'package:json_annotation/json_annotation.dart';

part 'invoice_customer_model.g.dart';

@JsonSerializable()
class InvoiceCustomerModel {
  final int? id;
  @JsonKey(name: "company_id")
  final int? companyId;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "tax_number")
  final String? taxNumber;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "notes")
  final String? notes;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  InvoiceCustomerModel({
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
  factory InvoiceCustomerModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceCustomerModelFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceCustomerModelToJson(this);
}
