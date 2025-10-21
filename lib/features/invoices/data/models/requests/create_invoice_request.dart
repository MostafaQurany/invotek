import 'package:json_annotation/json_annotation.dart';

part 'create_invoice_request.g.dart';

@JsonSerializable()
class CreateInvoiceRequest {
  @JsonKey(name: 'customer_id')
  final String? customerId;
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @JsonKey(name: 'customer_email')
  final String? customerEmail;
  @JsonKey(name: 'customer_phone')
  final String? customerPhone;
  @JsonKey(name: 'customer_address')
  final String? customerAddress;
  final String subtotal;
  @JsonKey(name: 'tax_amount')
  final String taxAmount;
  final String discount;
  final String total;
  @JsonKey(name: 'issue_date')
  final String issueDate;
  final String status;
  final String? description;
  @JsonKey(name: 'payment_method_code')
  final String paymentMethodCode;
  final String action;
  final List<CreateInvoiceItemRequest>? items;

  CreateInvoiceRequest({
    this.customerId,
    this.customerName,
    this.customerEmail,
    this.customerPhone,
    this.customerAddress,
    required this.subtotal,
    required this.taxAmount,
    required this.discount,
    required this.total,
    required this.issueDate,
    required this.status,
    this.description,
    required this.paymentMethodCode,
    required this.action,
    this.items,
  });

  factory CreateInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInvoiceRequestToJson(this);
}

@JsonSerializable()
class CreateInvoiceItemRequest {
  final String? name;
  final String? quantity;
  final String? price;
  final String? discount;
  @JsonKey(name: 'tax_percent')
  final String? taxPercent;
  @JsonKey(name: 'tax_amount')
  final String? taxAmount;
  final String? total;
  @JsonKey(name: 'product_name')
  final String? productName;
  @JsonKey(name: 'product_description')
  final String?  productDescription;
  @JsonKey(name: 'product_category')
  final String? productCategory;
  @JsonKey(name: 'product_id')
  final String? productId;

  CreateInvoiceItemRequest({
     this.name,
     this.quantity,
     this.price,
     this.discount,
     this.taxPercent,
     this.taxAmount,
     this.total,
    this.productName,
    this.productDescription,
    this.productCategory,
    this.productId,
  });

  factory CreateInvoiceItemRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInvoiceItemRequestToJson(this);
}
