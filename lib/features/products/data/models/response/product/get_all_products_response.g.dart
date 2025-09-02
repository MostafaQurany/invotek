// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProductsResponse _$GetAllProductsResponseFromJson(
  Map<String, dynamic> json,
) => GetAllProductsResponse(
  message: json['message'] as String?,
  currentPage: (json['currentPage'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ProductApiModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  from: (json['from'] as num?)?.toInt(),
  lastPage: (json['lastPage'] as num?)?.toInt(),
  perPage: (json['perPage'] as num?)?.toInt(),
  to: (json['to'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$GetAllProductsResponseToJson(
  GetAllProductsResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'currentPage': instance.currentPage,
  'data': instance.data,
  'from': instance.from,
  'lastPage': instance.lastPage,
  'perPage': instance.perPage,
  'to': instance.to,
  'total': instance.total,
};
