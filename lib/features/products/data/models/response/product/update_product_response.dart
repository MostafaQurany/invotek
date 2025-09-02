import 'package:json_annotation/json_annotation.dart';

import '../../product_api_model.dart';

part 'update_product_response.g.dart';

@JsonSerializable()
class UpdateProductResponse {
  final bool success;
  final String? message;
  final ProductApiModel? data;

  UpdateProductResponse({required this.success, this.message, this.data});

  factory UpdateProductResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProductResponseToJson(this);
}
