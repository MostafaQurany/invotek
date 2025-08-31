import 'package:json_annotation/json_annotation.dart';

part 'client_api_model.g.dart';

// API Response Models
@JsonSerializable()
class ClientsResponse {
  final bool success;
  final String message;
  final List<ClientApiModel> data;
  final int total;
  final int page;
  final int limit;

  ClientsResponse({
    required this.success,
    required this.message,
    required this.data,
    required this.total,
    required this.page,
    required this.limit,
  });

  factory ClientsResponse.fromJson(Map<String, dynamic> json) =>
      _$ClientsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClientsResponseToJson(this);
}

@JsonSerializable()
class ClientResponse {
  final bool success;
  final String message;
  final ClientApiModel data;

  ClientResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ClientResponse.fromJson(Map<String, dynamic> json) =>
      _$ClientResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClientResponseToJson(this);
}

@JsonSerializable()
class ClientApiModel {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? company;
  final String? taxNumber;
  final String? notes;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? avatar;
  final String? website;
  final String? contactPerson;
  final String? contactPhone;
  final String? contactEmail;

  ClientApiModel({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.company,
    this.taxNumber,
    this.notes,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.avatar,
    this.website,
    this.contactPerson,
    this.contactPhone,
    this.contactEmail,
  });

  factory ClientApiModel.fromJson(Map<String, dynamic> json) =>
      _$ClientApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClientApiModelToJson(this);
}

// API Request Models
@JsonSerializable()
class CreateClientRequest {
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? company;
  final String? taxNumber;
  final String? notes;
  final String status;
  final String? website;
  final String? contactPerson;
  final String? contactPhone;
  final String? contactEmail;

  CreateClientRequest({
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.company,
    this.taxNumber,
    this.notes,
    required this.status,
    this.website,
    this.contactPerson,
    this.contactPhone,
    this.contactEmail,
  });

  factory CreateClientRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateClientRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateClientRequestToJson(this);
}

@JsonSerializable()
class UpdateClientRequest {
  final String name;
  final String email;
  final String? phone;
  final String? address;
  final String? company;
  final String? taxNumber;
  final String? notes;
  final String status;
  final String? website;
  final String? contactPerson;
  final String? contactPhone;
  final String? contactEmail;

  UpdateClientRequest({
    required this.name,
    required this.email,
    this.phone,
    this.address,
    this.company,
    this.taxNumber,
    this.notes,
    required this.status,
    this.website,
    this.contactPerson,
    this.contactPhone,
    this.contactEmail,
  });

  factory UpdateClientRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateClientRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateClientRequestToJson(this);
}

// Search and Filter Models
@JsonSerializable()
class ClientsFilterRequest {
  final String? search;
  final String? status;
  final String? company;
  final int? page;
  final int? limit;
  final String? sortBy;
  final String? sortOrder;

  ClientsFilterRequest({
    this.search,
    this.status,
    this.company,
    this.page,
    this.limit,
    this.sortBy,
    this.sortOrder,
  });

  factory ClientsFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$ClientsFilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ClientsFilterRequestToJson(this);
}
