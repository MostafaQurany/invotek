import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:invotek/features/clients/data/models/client_api_model.dart';

part 'clients_data_source.g.dart';

@RestApi()
abstract class ClientsDataSource {
  factory ClientsDataSource(Dio dio, {String baseUrl}) = _ClientsDataSource;

  // Get all clients with pagination and filters
  @GET('/clients')
  Future<ClientsResponse> getClients({
    @Query('search') String? search,
    @Query('status') String? status,
    @Query('company') String? company,
    @Query('page') int? page,
    @Query('limit') int? limit,
    @Query('sortBy') String? sortBy,
    @Query('sortOrder') String? sortOrder,
  });

  // Get client by ID
  @GET('/clients/{id}')
  Future<ClientResponse> getClientById(@Path('id') int id);

  // Create new client
  @POST('/clients')
  Future<ClientResponse> createClient(@Body() CreateClientRequest request);

  // Update client
  @PUT('/clients/{id}')
  Future<ClientResponse> updateClient(
    @Path('id') int id,
    @Body() UpdateClientRequest request,
  );

  // Delete client
  @DELETE('/clients/{id}')
  Future<void> deleteClient(@Path('id') int id);

  // Upload client avatar
  @POST('/clients/{id}/avatar')
  @MultiPart()
  Future<ClientResponse> uploadAvatar(@Path('id') int id, @Part() File avatar);

  // Get client statistics
  @GET('/clients/statistics')
  Future<Map<String, dynamic>> getClientStatistics();

  // Bulk operations
  @POST('/clients/bulk-delete')
  Future<void> bulkDeleteClients(@Body() List<int> clientIds);

  @POST('/clients/bulk-update-status')
  Future<void> bulkUpdateStatus(@Body() Map<String, dynamic> request);
}
