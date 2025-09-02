import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/server/api_error_handler.dart';
import 'package:invotek/core/server/api_client.dart';
import 'package:invotek/features/clients/demo/entit/client_model.dart';
import 'package:invotek/features/clients/data/models/client_api_model.dart';
import 'package:invotek/features/clients/demo/data/mock_clients_data.dart';

class ClientsRepository {
  final ApiClient _apiClient;
  final List<Client> _mockClients = MockClientsData.getMockClients();

  ClientsRepository(this._apiClient);

  // Get all clients with pagination and filters
  Future<ApiResult<List<Client>>> getClients({
    String? search,
    String? status,
    String? company,
    int? page,
    int? limit,
    String? sortBy,
    String? sortOrder,
  }) async {
    try {
      // استخدام البيانات التجريبية مؤقتاً
      await Future.delayed(
        const Duration(milliseconds: 500),
      ); // محاكاة تأخير الشبكة

      var clients = List<Client>.from(_mockClients);

      // تطبيق الفلاتر
      if (search != null && search.isNotEmpty) {
        clients = clients.where((client) {
          return client.name.toLowerCase().contains(search.toLowerCase()) ||
              client.email.toLowerCase().contains(search.toLowerCase()) ||
              (client.phone?.toLowerCase().contains(search.toLowerCase()) ??
                  false) ||
              (client.company?.toLowerCase().contains(search.toLowerCase()) ??
                  false);
        }).toList();
      }

      if (status != null && status.isNotEmpty && status != 'الكل') {
        final statusValue = status == 'نشط' ? 'active' : 'inactive';
        clients = clients
            .where((client) => client.status == statusValue)
            .toList();
      }

      if (company != null && company.isNotEmpty && company != 'الكل') {
        clients = clients.where((client) => client.company == company).toList();
      }

      return ApiResult.success(clients);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Get client by ID
  Future<ApiResult<Client>> getClientById(int id) async {
    try {
      final response = await _apiClient.getClientById(id);

      if (response.success) {
        final client = _convertToClient(response.data);
        return ApiResult.success(client);
      } else {
        return ApiResult.failure(response.message);
      }
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Create new client
  Future<ApiResult<Client>> createClient({
    required String name,
    required String email,
    String? phone,
    String? address,
    String? company,
    String? taxNumber,
    String? notes,
    required String status,
    String? website,
    String? contactPerson,
    String? contactPhone,
    String? contactEmail,
  }) async {
    try {
      // استخدام البيانات التجريبية مؤقتاً
      await Future.delayed(
        const Duration(milliseconds: 800),
      ); // محاكاة تأخير الشبكة

      final newClient = Client(
        id: DateTime.now().millisecondsSinceEpoch,
        name: name,
        email: email,
        phone: phone,
        address: address,
        company: company,
        taxNumber: taxNumber,
        notes: notes,
        status: status,
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
        website: website,
        contactPerson: contactPerson,
        contactPhone: contactPhone,
        contactEmail: contactEmail,
      );

      // إضافة العميل الجديد للبيانات التجريبية
      _mockClients.add(newClient);

      return ApiResult.success(newClient);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Update client
  Future<ApiResult<Client>> updateClient({
    required int id,
    required String name,
    required String email,
    String? phone,
    String? address,
    String? company,
    String? taxNumber,
    String? notes,
    required String status,
    String? website,
    String? contactPerson,
    String? contactPhone,
    String? contactEmail,
  }) async {
    try {
      // استخدام البيانات التجريبية مؤقتاً
      await Future.delayed(
        const Duration(milliseconds: 600),
      ); // محاكاة تأخير الشبكة

      final updatedClient = Client(
        id: id,
        name: name,
        email: email,
        phone: phone,
        address: address,
        company: company,
        taxNumber: taxNumber,
        notes: notes,
        status: status,
        createdAt: DateTime.now().toIso8601String(),
        updatedAt: DateTime.now().toIso8601String(),
        website: website,
        contactPerson: contactPerson,
        contactPhone: contactPhone,
        contactEmail: contactEmail,
      );

      // تحديث العميل في البيانات التجريبية
      final index = _mockClients.indexWhere((client) => client.id == id);
      if (index != -1) {
        _mockClients[index] = updatedClient;
      }

      return ApiResult.success(updatedClient);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Delete client
  Future<ApiResult<void>> deleteClient(int id) async {
    try {
      // استخدام البيانات التجريبية مؤقتاً
      await Future.delayed(
        const Duration(milliseconds: 300),
      ); // محاكاة تأخير الشبكة

      // حذف العميل من البيانات التجريبية
      _mockClients.removeWhere((client) => client.id == id);

      return const ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Get client statistics
  Future<ApiResult<Map<String, dynamic>>> getClientStatistics() async {
    try {
      final statistics =
          await _apiClient.getClientStatistics() as Map<String, dynamic>;
      return ApiResult.success(statistics);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Bulk delete clients
  Future<ApiResult<void>> bulkDeleteClients(List<int> clientIds) async {
    try {
      await _apiClient.bulkDeleteClients(clientIds);
      return const ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Bulk update client status
  Future<ApiResult<void>> bulkUpdateStatus({
    required List<int> clientIds,
    required String status,
  }) async {
    try {
      final request = {'clientIds': clientIds, 'status': status};

      await _apiClient.bulkUpdateStatus(request);
      return const ApiResult.success(null);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handleError(e));
    }
  }

  // Convert API model to domain model
  Client _convertToClient(ClientApiModel apiClient) {
    return Client(
      id: apiClient.id,
      name: apiClient.name,
      email: apiClient.email,
      phone: apiClient.phone,
      address: apiClient.address,
      company: apiClient.company,
      taxNumber: apiClient.taxNumber,
      notes: apiClient.notes,
      status: apiClient.status,
      createdAt: apiClient.createdAt.toIso8601String(),
      updatedAt: apiClient.updatedAt.toIso8601String(),
      avatar: apiClient.avatar,
      website: apiClient.website,
      contactPerson: apiClient.contactPerson,
      contactPhone: apiClient.contactPhone,
      contactEmail: apiClient.contactEmail,
    );
  }
}
