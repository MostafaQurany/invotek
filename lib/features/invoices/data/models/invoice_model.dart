import 'package:invotek/features/invoices/data/models/invoice_customer_model.dart';
import 'package:invotek/features/invoices/data/models/invoice_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invoice_model.g.dart';

@JsonSerializable()
class InvoiceModel {
  final int? id;
  @JsonKey(name: "invoice_id")
  final int? invoiceId;
  @JsonKey(name: "invoice_number")
  final String? invoiceNumber;
  @JsonKey(name: "tax_uid")
  final String? taxUid;
  @JsonKey(name: "qr_code")
  final String? qrCode;
  @JsonKey(name: "invoice_type")
  final String? invoiceType;
  @JsonKey(name: "document_type")
  final String? documentType;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "error_message")
  final String? errorMessage;
  @JsonKey(name: "issue_date")
  final String? issueDate;
  @JsonKey(name: "customer_name")
  final String? customerName;
  @JsonKey(name: "payment_method_code")
  final String? paymentMethodCode;
  @JsonKey(name: "subtotal")
  final String? subtotal;
  @JsonKey(name: "tax_amount")
  final String? taxAmount;
  @JsonKey(name: "discount")
  final String? discount;
  @JsonKey(name: "total")
  final String? total;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "sent_at")
  final String? sentAt;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;
  @JsonKey(name: "company_id")
  final int? companyId;
  @JsonKey(name: "customer_id")
  final int? customerId;
  @JsonKey(name: "items")
  final List<InvoiceItem>? items;
  @JsonKey(name: "customer")
  final InvoiceCustomerModel? customer;

  InvoiceModel({
     this.id,
    this.invoiceId,
     this.invoiceNumber,
    this.taxUid,
    this.qrCode,
    this.invoiceType,
    this.documentType,
    this.status,
    this.errorMessage,
    this.issueDate,
    this.customerName,
    this.paymentMethodCode,
    this.subtotal,
    this.taxAmount,
    this.discount,
    this.total,
    this.description,

    this.sentAt,
    this.createdAt,
    this.updatedAt,
    this.companyId,
    this.customerId,
    this.items,
    this.customer,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceModelToJson(this);
}
