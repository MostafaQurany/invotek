import 'package:json_annotation/json_annotation.dart';

part 'update_invoice_request.g.dart';

@JsonSerializable()
class UpdateInvoiceRequest {
  @JsonKey(name: 'id')
  final String? id;
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
  final String? subtotal;
  @JsonKey(name: 'tax_amount')
  final String? taxAmount;
  final String? discount;
  final String? total;
  @JsonKey(name: 'issue_date')
  final String? issueDate;
  final String? description;
  @JsonKey(name: 'payment_method_code')
  final String? paymentMethodCode;
  final String? action;
  final List<UpdateInvoiceItemRequest>? items;

  UpdateInvoiceRequest({
    this.id,
    this.customerId,
    this.customerName,
    this.customerEmail,
    this.customerPhone,
    this.customerAddress,
    this.subtotal,
    this.taxAmount,
    this.discount,
    this.total,
    this.issueDate,
    this.description,
    this.paymentMethodCode,
    this.action,
    this.items,
  });

  factory UpdateInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateInvoiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateInvoiceRequestToJson(this);
}

@JsonSerializable()
class UpdateInvoiceItemRequest {
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
  final String? productDescription;
  @JsonKey(name: 'product_category')
  final String? productCategory;
  @JsonKey(name: 'product_id')
  final String? productId;

  UpdateInvoiceItemRequest({
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

  factory UpdateInvoiceItemRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateInvoiceItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateInvoiceItemRequestToJson(this);
}
