// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteProductResponse _$DeleteProductResponseFromJson(
  Map<String, dynamic> json,
) => DeleteProductResponse(
  success: json['success'] as bool,
  message: json['message'] as String?,
);

Map<String, dynamic> _$DeleteProductResponseToJson(
  DeleteProductResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
};
