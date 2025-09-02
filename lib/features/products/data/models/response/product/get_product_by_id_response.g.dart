// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductByIdResponse _$GetProductByIdResponseFromJson(
  Map<String, dynamic> json,
) => GetProductByIdResponse(
  data: json['data'] == null
      ? null
      : ProductApiModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetProductByIdResponseToJson(
  GetProductByIdResponse instance,
) => <String, dynamic>{'data': instance.data};
