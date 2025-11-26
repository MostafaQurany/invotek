import 'package:json_annotation/json_annotation.dart';
import 'package:invotek/features/invoices/data/models/requests/create_invoice_request.dart';

part 'create_credit_invoice_request.g.dart';

@JsonSerializable()
class CreateCreditInvoiceRequest {
  @JsonKey(name: 'issue_date')
  final String issueDate;
  @JsonKey(name: 'return_reason')
  final String returnReason;
  final String? description;
  final String action;
  final List<CreateInvoiceItemRequest>? items;
  final String subtotal;
  @JsonKey(name: 'tax_amount')
  final String taxAmount;
  final String discount;
  final String total;

  CreateCreditInvoiceRequest({
    required this.issueDate,
    required this.returnReason,
    this.description,
    required this.action,
    this.items,
    required this.subtotal,
    required this.taxAmount,
    required this.discount,
    required this.total,
  });

  factory CreateCreditInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCreditInvoiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCreditInvoiceRequestToJson(this);
}

