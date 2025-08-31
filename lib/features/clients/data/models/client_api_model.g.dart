// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientsResponse _$ClientsResponseFromJson(Map<String, dynamic> json) =>
    ClientsResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ClientApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$ClientsResponseToJson(ClientsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };

ClientResponse _$ClientResponseFromJson(Map<String, dynamic> json) =>
    ClientResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: ClientApiModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClientResponseToJson(ClientResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

ClientApiModel _$ClientApiModelFromJson(Map<String, dynamic> json) =>
    ClientApiModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      company: json['company'] as String?,
      taxNumber: json['taxNumber'] as String?,
      notes: json['notes'] as String?,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      avatar: json['avatar'] as String?,
      website: json['website'] as String?,
      contactPerson: json['contactPerson'] as String?,
      contactPhone: json['contactPhone'] as String?,
      contactEmail: json['contactEmail'] as String?,
    );

Map<String, dynamic> _$ClientApiModelToJson(ClientApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'company': instance.company,
      'taxNumber': instance.taxNumber,
      'notes': instance.notes,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'avatar': instance.avatar,
      'website': instance.website,
      'contactPerson': instance.contactPerson,
      'contactPhone': instance.contactPhone,
      'contactEmail': instance.contactEmail,
    };

CreateClientRequest _$CreateClientRequestFromJson(Map<String, dynamic> json) =>
    CreateClientRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      company: json['company'] as String?,
      taxNumber: json['taxNumber'] as String?,
      notes: json['notes'] as String?,
      status: json['status'] as String,
      website: json['website'] as String?,
      contactPerson: json['contactPerson'] as String?,
      contactPhone: json['contactPhone'] as String?,
      contactEmail: json['contactEmail'] as String?,
    );

Map<String, dynamic> _$CreateClientRequestToJson(
  CreateClientRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'address': instance.address,
  'company': instance.company,
  'taxNumber': instance.taxNumber,
  'notes': instance.notes,
  'status': instance.status,
  'website': instance.website,
  'contactPerson': instance.contactPerson,
  'contactPhone': instance.contactPhone,
  'contactEmail': instance.contactEmail,
};

UpdateClientRequest _$UpdateClientRequestFromJson(Map<String, dynamic> json) =>
    UpdateClientRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      company: json['company'] as String?,
      taxNumber: json['taxNumber'] as String?,
      notes: json['notes'] as String?,
      status: json['status'] as String,
      website: json['website'] as String?,
      contactPerson: json['contactPerson'] as String?,
      contactPhone: json['contactPhone'] as String?,
      contactEmail: json['contactEmail'] as String?,
    );

Map<String, dynamic> _$UpdateClientRequestToJson(
  UpdateClientRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'address': instance.address,
  'company': instance.company,
  'taxNumber': instance.taxNumber,
  'notes': instance.notes,
  'status': instance.status,
  'website': instance.website,
  'contactPerson': instance.contactPerson,
  'contactPhone': instance.contactPhone,
  'contactEmail': instance.contactEmail,
};

ClientsFilterRequest _$ClientsFilterRequestFromJson(
  Map<String, dynamic> json,
) => ClientsFilterRequest(
  search: json['search'] as String?,
  status: json['status'] as String?,
  company: json['company'] as String?,
  page: (json['page'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  sortBy: json['sortBy'] as String?,
  sortOrder: json['sortOrder'] as String?,
);

Map<String, dynamic> _$ClientsFilterRequestToJson(
  ClientsFilterRequest instance,
) => <String, dynamic>{
  'search': instance.search,
  'status': instance.status,
  'company': instance.company,
  'page': instance.page,
  'limit': instance.limit,
  'sortBy': instance.sortBy,
  'sortOrder': instance.sortOrder,
};
