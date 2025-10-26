import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/clients/demo/entit/client_model.dart';
import 'package:invotek/features/clients/data/repository/clients_repository.dart';

class ClientsState {
  final List<Client> clients;
  final bool isLoading;
  final String? error;
  final Map<String, dynamic>? statistics;

  ClientsState({
    this.clients = const [],
    this.isLoading = false,
    this.error,
    this.statistics,
  });

  ClientsState copyWith({
    List<Client>? clients,
    bool? isLoading,
    String? error,
    Map<String, dynamic>? statistics,
  }) {
    return ClientsState(
      clients: clients ?? this.clients,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      statistics: statistics ?? this.statistics,
    );
  }
}

class ClientsCubit extends Cubit<ClientsState> {
  final ClientsRepository _repository;

  ClientsCubit(this._repository) : super(ClientsState());

  Future<void> loadClients({
    String? search,
    String? status,
    String? company,
    int? page,
    int? limit,
    String? sortBy,
    String? sortOrder,
  }) async {
    if (isClosed) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final result = await _repository.getClients(
        search: search,
        status: status,
        company: company,
        page: page,
        limit: limit,
        sortBy: sortBy,
        sortOrder: sortOrder,
      );

      if (isClosed) return;

      result.when(
        success: (clients) {
          emit(state.copyWith(clients: clients, isLoading: false));
        },
        failure: (error) {
          emit(state.copyWith(error: error.message, isLoading: false));
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            error: 'حدث خطأ أثناء تحميل العملاء: $e',
            isLoading: false,
          ),
        );
      }
    }
  }

  Future<void> createClient({
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
    if (isClosed) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final result = await _repository.createClient(
        name: name,
        email: email,
        phone: phone,
        address: address,
        company: company,
        taxNumber: taxNumber,
        notes: notes,
        status: status,
        website: website,
        contactPerson: contactPerson,
        contactPhone: contactPhone,
        contactEmail: contactEmail,
      );

      if (isClosed) return;

      result.when(
        success: (newClient) {
          final updatedClients = List<Client>.from(state.clients)
            ..add(newClient);
          emit(state.copyWith(clients: updatedClients, isLoading: false));
        },
        failure: (error) {
          emit(state.copyWith(error: error.message, isLoading: false));
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            error: 'حدث خطأ أثناء إنشاء العميل: $e',
            isLoading: false,
          ),
        );
      }
    }
  }

  Future<void> updateClient({
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
    if (isClosed) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final result = await _repository.updateClient(
        id: id,
        name: name,
        email: email,
        phone: phone,
        address: address,
        company: company,
        taxNumber: taxNumber,
        notes: notes,
        status: status,
        website: website,
        contactPerson: contactPerson,
        contactPhone: contactPhone,
        contactEmail: contactEmail,
      );

      if (isClosed) return;

      result.when(
        success: (updatedClient) {
          final updatedClients = state.clients.map((client) {
            return client.id == id ? updatedClient : client;
          }).toList();
          emit(state.copyWith(clients: updatedClients, isLoading: false));
        },
        failure: (error) {
          emit(state.copyWith(error: error.message, isLoading: false));
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            error: 'حدث خطأ أثناء تحديث العميل: $e',
            isLoading: false,
          ),
        );
      }
    }
  }

  Future<void> deleteClient(int clientId) async {
    if (isClosed) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final result = await _repository.deleteClient(clientId);

      if (isClosed) return;

      result.when(
        success: (_) {
          final updatedClients = state.clients
              .where((client) => client.id != clientId)
              .toList();
          emit(state.copyWith(clients: updatedClients, isLoading: false));
        },
        failure: (error) {
          emit(state.copyWith(error: error.message, isLoading: false));
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            error: 'حدث خطأ أثناء حذف العميل: $e',
            isLoading: false,
          ),
        );
      }
    }
  }

  Future<void> loadClientStatistics() async {
    if (isClosed) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final result = await _repository.getClientStatistics();

      if (isClosed) return;

      result.when(
        success: (statistics) {
          emit(state.copyWith(statistics: statistics, isLoading: false));
        },
        failure: (error) {
          emit(state.copyWith(error: error.message, isLoading: false));
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            error: 'حدث خطأ أثناء تحميل الإحصائيات: $e',
            isLoading: false,
          ),
        );
      }
    }
  }

  Future<void> bulkDeleteClients(List<int> clientIds) async {
    if (isClosed) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final result = await _repository.bulkDeleteClients(clientIds);

      if (isClosed) return;

      result.when(
        success: (_) {
          final updatedClients = state.clients
              .where((client) => !clientIds.contains(client.id))
              .toList();
          emit(state.copyWith(clients: updatedClients, isLoading: false));
        },
        failure: (error) {
          emit(state.copyWith(error: error.message, isLoading: false));
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            error: 'حدث خطأ أثناء حذف العملاء: $e',
            isLoading: false,
          ),
        );
      }
    }
  }

  Future<void> bulkUpdateStatus({
    required List<int> clientIds,
    required String status,
  }) async {
    if (isClosed) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final result = await _repository.bulkUpdateStatus(
        clientIds: clientIds,
        status: status,
      );

      if (isClosed) return;

      result.when(
        success: (_) {
          final updatedClients = state.clients.map((client) {
            if (clientIds.contains(client.id)) {
              return client.copyWith(status: status);
            }
            return client;
          }).toList();
          emit(state.copyWith(clients: updatedClients, isLoading: false));
        },
        failure: (error) {
          emit(state.copyWith(error: error.message, isLoading: false));
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            error: 'حدث خطأ أثناء تحديث حالة العملاء: $e',
            isLoading: false,
          ),
        );
      }
    }
  }

  void clearError() {
    if (!isClosed) {
      emit(state.copyWith(error: null));
    }
  }

  // Helper methods
  List<Client> getClientsByStatus(String status) {
    return state.clients.where((client) => client.status == status).toList();
  }

  List<Client> getClientsByCompany(String company) {
    return state.clients.where((client) => client.company == company).toList();
  }

  List<Client> searchClients(String query) {
    return state.clients.where((client) {
      return (client.name ?? '').toLowerCase().contains(query.toLowerCase()) ||
          (client.email ?? '').toLowerCase().contains(query.toLowerCase()) ||
          (client.phone?.toLowerCase().contains(query.toLowerCase()) ??
              false) ||
          (client.company?.toLowerCase().contains(query.toLowerCase()) ??
              false);
    }).toList();
  }
}
