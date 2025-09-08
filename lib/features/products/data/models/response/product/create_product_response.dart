import 'package:json_annotation/json_annotation.dart';

part 'create_product_response.g.dart';

@JsonSerializable()
class CreateProductResponse {
  final String? name;
  final String? price;
  final int? quantity;
  @JsonKey(name: 'company_id')
  final int? companyId;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final int? id;

  CreateProductResponse({
    required this.name,
    required this.price,
    required this.quantity,
    required this.companyId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory CreateProductResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProductResponseToJson(this);
}
