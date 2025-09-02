import 'package:json_annotation/json_annotation.dart';

part 'delete_product_response.g.dart';

@JsonSerializable()
class DeleteProductResponse {
  final bool success;
  final String? message;

  DeleteProductResponse({
    required this.success,
    this.message,
  });

  factory DeleteProductResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteProductResponseToJson(this);
}
