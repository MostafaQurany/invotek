// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_expenses_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllExpensesResponse _$GetAllExpensesResponseFromJson(
  Map<String, dynamic> json,
) => GetAllExpensesResponse(
  currentPage: (json['current_page'] as num?)?.toInt(),
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ExpenseApiModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  firstPageUrl: json['first_page_url'] as String?,
  from: (json['from'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
  lastPageUrl: json['last_page_url'] as String?,
  links: (json['links'] as List<dynamic>?)
      ?.map((e) => PaginationLink.fromJson(e as Map<String, dynamic>))
      .toList(),
  nextPageUrl: json['next_page_url'] as String?,
  path: json['path'] as String?,
  perPage: (json['per_page'] as num?)?.toInt(),
  prevPageUrl: json['prev_page_url'] as String?,
  to: (json['to'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
);

Map<String, dynamic> _$GetAllExpensesResponseToJson(
  GetAllExpensesResponse instance,
) => <String, dynamic>{
  'current_page': instance.currentPage,
  'data': instance.data,
  'first_page_url': instance.firstPageUrl,
  'from': instance.from,
  'last_page': instance.lastPage,
  'last_page_url': instance.lastPageUrl,
  'links': instance.links,
  'next_page_url': instance.nextPageUrl,
  'path': instance.path,
  'per_page': instance.perPage,
  'prev_page_url': instance.prevPageUrl,
  'to': instance.to,
  'total': instance.total,
};

PaginationLink _$PaginationLinkFromJson(Map<String, dynamic> json) =>
    PaginationLink(
      url: json['url'] as String?,
      label: json['label'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$PaginationLinkToJson(PaginationLink instance) =>
    <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
