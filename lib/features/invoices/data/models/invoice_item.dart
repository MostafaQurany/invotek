import 'package:invotek/features/products/data/models/product_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'invoice_item.g.dart';

@JsonSerializable()
class InvoiceItem {
  final String id;
  @JsonKey(name: "tax_invoice_id")
  final String taxInvoiceId;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "quantity")
  final String quantity;
  @JsonKey(name: "price")
  final String price;
  @JsonKey(name: "discount")
  final String discount;
  @JsonKey(name: "tax_percent")
  final String taxPercent;
  @JsonKey(name: "tax_amount")
  final String taxAmount;
  @JsonKey(name: "total")
  final String total;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @JsonKey(name: "product_id")
  final String productId;
  final ProductApiModel? product;

  InvoiceItem({
    this.product,
    required this.id,
    required this.taxInvoiceId,
    required this.name,
    required this.description,
    required this.quantity,
    required this.price,
    required this.discount,
    required this.taxPercent,
    required this.taxAmount,
    required this.total,
    required this.createdAt,
    required this.updatedAt,
    required this.productId,
  });
  factory InvoiceItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceItemToJson(this);
}
