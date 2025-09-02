// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProductResponse _$UpdateProductResponseFromJson(
  Map<String, dynamic> json,
) => UpdateProductResponse(
  success: json['success'] as bool,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : ProductApiModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UpdateProductResponseToJson(
  UpdateProductResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
