// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProductsResponse _$GetAllProductsResponseFromJson(
  Map<String, dynamic> json,
) => GetAllProductsResponse(
  message: json['message'] as String?,
  currentPage: (json['current_page'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ProductApiModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  from: (json['from'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
  perPage: (json['per_page'] as num?)?.toInt(),
  to: (json['to'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  nextPageUrl: json['next_page_url'] as String?,
  prevPageUrl: json['prev_page_url'] as String?,
);

Map<String, dynamic> _$GetAllProductsResponseToJson(
  GetAllProductsResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'current_page': instance.currentPage,
  'data': instance.data,
  'from': instance.from,
  'last_page': instance.lastPage,
  'per_page': instance.perPage,
  'to': instance.to,
  'total': instance.total,
  'next_page_url': instance.nextPageUrl,
  'prev_page_url': instance.prevPageUrl,
};
