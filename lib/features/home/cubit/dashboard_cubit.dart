import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/features/home/data/models/dashboard_models.dart';
import 'package:invotek/features/home/data/repository/dashboard_repository.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/error/failures.dart';

part 'dashboard_cubit.freezed.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _Initial;
  const factory DashboardState.loading() = _Loading;
  const factory DashboardState.loaded(DashboardData data) = _Loaded;
  const factory DashboardState.error(String message) = _Error;
  const factory DashboardState.subscriptionRequired(
    String message,
    String? redirectUrl,
  ) = _SubscriptionRequired;
}

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository _repository;

  DashboardCubit(this._repository) : super(const DashboardState.initial());

  Future<void> loadDashboard() async {
    emit(const DashboardState.loading());

    final result = await _repository.getDashboard();

    result.when(
      success: (data) => emit(DashboardState.loaded(data)),
      failure: (failure) {
        failure.when(
          server: (message, statusCode) => emit(DashboardState.error(message)),
          network: (message) => emit(DashboardState.error(message)),
          cache: (message) => emit(DashboardState.error(message)),
          validation: (message, errors) => emit(DashboardState.error(message)),
          unknown: (message) => emit(DashboardState.error(message)),
          timeout: (message) => emit(DashboardState.error(message)),
          unauthorized: (message) => emit(DashboardState.error(message)),
          subscriptionRequired: (message, redirectUrl) =>
              emit(DashboardState.subscriptionRequired(message, redirectUrl)),
        );
      },
    );
  }
}
