import 'package:json_annotation/json_annotation.dart';

import '../user_api_model.dart';

part 'user_responses.g.dart';

// API Response Models
@JsonSerializable()
class UsersResponse {
  @JsonKey(name: 'current_page')
  final int? currentPage;
  final List<UserApiModel>? data;
  @JsonKey(name: 'first_page_url')
  final String? firstPageUrl;
  final int? from;
  @JsonKey(name: 'last_page')
  final int? lastPage;
  @JsonKey(name: 'last_page_url')
  final String? lastPageUrl;
  final List<dynamic>? links;
  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;
  final String? path;
  @JsonKey(name: 'per_page')
  final int? perPage;
  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;
  final int? to;
  final int? total;

  UsersResponse({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);
}

@JsonSerializable()
class UserResponse {
  final bool? success;
  final String? message;
  final UserApiModel? data;

  UserResponse({this.success, this.message, this.data});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    // Check if the response is wrapped in a 'data' field (standard API response)
    if (json.containsKey('data') && json['data'] is Map<String, dynamic>) {
      return _$UserResponseFromJson(json);
    }
    // If not, the JSON itself is the User object (direct response)
    // Try to parse it as UserApiModel directly
    try {
      return UserResponse(
        data: UserApiModel.fromJson(json),
      );
    } catch (e) {
      // If that fails, try the standard parsing
      return _$UserResponseFromJson(json);
    }
  }

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class UserStatisticsResponse {
  Map<String, dynamic>? data;
  UserStatisticsResponse({this.data});
  factory UserStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserStatisticsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserStatisticsResponseToJson(this);
}
