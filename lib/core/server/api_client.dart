import 'package:invotek/core/utils/app_api_constants.dart';
import 'package:invotek/features/auth/data/models/login_request.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baserUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(ApiConstants.login)
  Future<void> login(@Body() LoginRequest request);

  @POST(ApiConstants.register)
  Future<void> register(@Body() Map<String, dynamic> data);
}
