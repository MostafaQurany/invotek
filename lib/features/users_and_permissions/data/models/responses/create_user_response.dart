import 'package:json_annotation/json_annotation.dart';

part 'create_user_response.g.dart';

@JsonSerializable()
class CreateUserResponse {
  String? name;
  String? email;
  String? phone;
  String? position;
  String? status;
  num? company_id;
  String? role;
  String? updated_at;
  String? created_at;
  int? id;
  String? profile_photo_url;

  CreateUserResponse({
    this.name,
    this.email,
    this.phone,
    this.position,
    this.status,
    this.company_id,
    this.role,
    this.updated_at,
    this.created_at,
    this.id,
    this.profile_photo_url,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserResponseToJson(this);
}
