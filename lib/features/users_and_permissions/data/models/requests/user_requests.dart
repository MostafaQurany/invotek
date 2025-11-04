import 'package:json_annotation/json_annotation.dart';

part 'user_requests.g.dart';

// API Request Models
@JsonSerializable()
class CreateUserRequest {
  final String name;
  final String email;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  final String? phone;
  final String? position;
  final String status;

  CreateUserRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    this.phone,
    this.position,
    required this.status,
  });

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);
}

@JsonSerializable()
class UpdateUserRequest {
  final String name;
  final String email;
  final String? phone;
  final String? position;
  final String status;

  UpdateUserRequest({
    required this.name,
    required this.email,
    this.phone,
    this.position,
    required this.status,
  });

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);
}

@JsonSerializable()
class ChangePasswordRequest {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePasswordRequest({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}

@JsonSerializable()
class UsersFilterRequest {
  final String? search;
  final String? role;
  final String? status;
  final int? page;
  final int? limit;
  final String? sortBy;
  final String? sortOrder;

  UsersFilterRequest({
    this.search,
    this.role,
    this.status,
    this.page,
    this.limit,
    this.sortBy,
    this.sortOrder,
  });

  factory UsersFilterRequest.fromJson(Map<String, dynamic> json) =>
      _$UsersFilterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UsersFilterRequestToJson(this);
}
