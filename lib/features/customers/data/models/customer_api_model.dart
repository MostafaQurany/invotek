import 'package:json_annotation/json_annotation.dart';

part 'customer_api_model.g.dart';

@JsonSerializable()
class CustomerApiModel {
  final int id;
  @JsonKey(name: 'company_id')
  final int? companyId;
  final String? name;
  final String? email;
  final String? phone;
  @JsonKey(name: 'tax_number')
  final String? taxNumber;
  final String? address;
  final String? notes;
  final String? status;
  @JsonKey(
    name: 'created_at',
    fromJson: _stringToDateTime,
    toJson: _dateTimeToString,
  )
  final DateTime? createdAt;
  @JsonKey(
    name: 'updated_at',
    fromJson: _stringToDateTime,
    toJson: _dateTimeToString,
  )
  final DateTime? updatedAt;

  CustomerApiModel({
    required this.id,
    this.companyId,
    this.name,
    this.email,
    this.phone,
    this.taxNumber,
    this.address,
    this.notes,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory CustomerApiModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerApiModelToJson(this);

  static DateTime? _stringToDateTime(String? dateTime) =>
      dateTime != null ? DateTime.parse(dateTime) : null;
  static String? _dateTimeToString(DateTime? dateTime) =>
      dateTime?.toIso8601String();
}
