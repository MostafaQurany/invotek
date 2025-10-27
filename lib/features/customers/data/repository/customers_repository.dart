import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/server/api_client.dart';

import '../../domain/entit/customer_model.dart';
import '../models/customer_api_model.dart';
import '../models/request/create_customer_request.dart';
import '../models/request/update_customer_request.dart';
import '../models/pagination_result.dart';

class CustomersRepository {
  final ApiClient _apiClient;

  CustomersRepository(this._apiClient);

  Future<ApiResult<List<CustomerModel>>> getCustomers({
    String? search,
    String? status,
    String? company,
    int? page,
    int? limit,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final response = await _apiClient.getCustomers(
        search: search,
        status: status,
        company: company,
        page: page,
        limit: limit,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );

      final data = response.data ?? [];
      final customers = data.map((c) => _convertToCustomerModel(c)).toList();
      return ApiResult.success(customers);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<PaginationResult>> getCustomersWithPagination({
    String? search,
    String? status,
    String? company,
    int? page,
    int? limit,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      final response = await _apiClient.getCustomers(
        search: search,
        status: status,
        company: company,
        page: page,
        limit: limit,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );

      final paginationResult = PaginationResult.fromResponse(response);
      return ApiResult.success(paginationResult);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<CustomerModel>> getCustomerById(int id) async {
    try {
      final response = await _apiClient.getCustomerById(id);
      return ApiResult.success(
        _convertToCustomerModel(response.toCustomerApiModel()),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<CustomerModel>> createCustomer({
    required String name,
    required String email,
    String? phone,
    String? address,
    String? taxNumber,
    String? notes,
    String status = 'active',
    String? companyName,
    String? commercialRegister,
    String? city,
    String? region,
    String? postalCode,
    String? detailedAddress,
    String? responsiblePerson,
  }) async {
    try {
      final response = await _apiClient.createCustomer(
        CreateCustomerRequest(
          name: name,
          email: email,
          phone: phone,
          address: address,
          taxNumber: taxNumber,
          notes: notes,
          status: status,
          companyName: companyName,
          commercialRegister: commercialRegister,
          city: city,
          region: region,
          postalCode: postalCode,
          detailedAddress: detailedAddress,
          responsiblePerson: responsiblePerson,
        ),
      );
      return ApiResult.success(
        _convertToCustomerModel(response.toCustomerApiModel()),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<CustomerModel>> updateCustomer({
    required int id,
    required String name,
    required String email,
    String? phone,
    String? address,
    String? taxNumber,
    String? notes,
    String status = 'active',
  }) async {
    try {
      final response = await _apiClient.updateCustomer(
        id,
        UpdateCustomerRequest(
          name: name,
          email: email,
          phone: phone,
          address: address,
          taxNumber: taxNumber,
          notes: notes,
          status: status,
        ),
      );
      return ApiResult.success(
        _convertToCustomerModel(response.toCustomerApiModel()),
      );
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  Future<ApiResult<bool>> deleteCustomer(int id) async {
    try {
      await _apiClient.deleteCustomer(id);
      return const ApiResult.success(true);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Convert API model to CustomerModel
  CustomerModel _convertToCustomerModel(CustomerApiModel apiCustomer) {
    return CustomerModel(
      id: apiCustomer.id,
      name: apiCustomer.name ?? '',
      email: apiCustomer.email ?? '',
      phone: apiCustomer.phone,
      address: apiCustomer.address,
      status: apiCustomer.status ?? 'active',
      updatedAt: apiCustomer.updatedAt,
      createdAt: apiCustomer.createdAt,
    );
  }
}
