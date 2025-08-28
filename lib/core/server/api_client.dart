import 'package:dio/dio.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/utils/app_api_constants.dart';
import 'package:invotek/features/auth/data/models/login_request.dart';
import 'package:invotek/features/auth/data/models/login_respond.dart';
import 'package:invotek/features/auth/data/models/register_request.dart';
import 'package:invotek/features/auth/data/models/register_respond.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: ApiConstants.baserUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(ApiConstants.login)
  Future<LoginRespond> login(@Body() LoginRequest request);

  @POST(ApiConstants.register)
  Future<RegisterRespond> register(@Body() RegisterRequest request);
}
