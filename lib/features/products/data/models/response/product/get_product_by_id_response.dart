import 'package:json_annotation/json_annotation.dart';

import '../../product_api_model.dart';

part 'get_product_by_id_response.g.dart';

@JsonSerializable()
class GetProductByIdResponse {
  final ProductApiModel? data;

  GetProductByIdResponse({this.data});

  factory GetProductByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProductByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetProductByIdResponseToJson(this);
}
