import 'package:invotek/features/invoices/data/models/invoice_customer_model.dart';
import 'package:invotek/features/invoices/data/models/invoice_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invoice_model.g.dart';

@JsonSerializable()
class InvoiceModel {
  final String id;
  @JsonKey(name: "invoice_id")
  final String invoiceId;
  @JsonKey(name: "invoice_number")
  final String invoiceNumber;
  @JsonKey(name: "tax_uid")
  final String taxUid;
  @JsonKey(name: "qr_code")
  final String qrCode;
  @JsonKey(name: "invoice_type")
  final String invoiceType;
  @JsonKey(name: "document_type")
  final String documentType;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "error_message")
  final String errorMessage;
  @JsonKey(name: "issue_date")
  final String issueDate;
  @JsonKey(name: "customer_name")
  final String customerName;
  @JsonKey(name: "payment_method_code")
  final String paymentMethodCode;
  @JsonKey(name: "subtotal")
  final String subtotal;
  @JsonKey(name: "tax_amount")
  final String taxAmount;
  @JsonKey(name: "discount")
  final String discount;
  @JsonKey(name: "total")
  final String total;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "api_request")
  final String apiRequest;
  @JsonKey(name: "api_response")
  final String apiResponse;
  @JsonKey(name: "sent_at")
  final String sentAt;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @JsonKey(name: "company_id")
  final String companyId;
  @JsonKey(name: "customer_id")
  final String customerId;
  @JsonKey(name: "items")
  final List<InvoiceItem> items;
  @JsonKey(name: "customer")
  final InvoiceCustomerModel customer;

  InvoiceModel({
    required this.id,
    required this.invoiceId,
    required this.invoiceNumber,
    required this.taxUid,
    required this.qrCode,
    required this.invoiceType,
    required this.documentType,
    required this.status,
    required this.errorMessage,
    required this.issueDate,
    required this.customerName,
    required this.paymentMethodCode,
    required this.subtotal,
    required this.taxAmount,
    required this.discount,
    required this.total,
    required this.description,
    required this.apiRequest,
    required this.apiResponse,
    required this.sentAt,
    required this.createdAt,
    required this.updatedAt,
    required this.companyId,
    required this.customerId,
    required this.items,
    required this.customer,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceModelToJson(this);
}
