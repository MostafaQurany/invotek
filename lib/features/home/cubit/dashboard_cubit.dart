import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/home/data/models/dashboard_models.dart';
import 'package:invotek/features/home/data/repository/dashboard_repository.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final DashboardData data;

  DashboardLoaded(this.data);
}

class DashboardError extends DashboardState {
  final String message;

  DashboardError(this.message);
}

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository _repository;

  DashboardCubit(this._repository) : super(DashboardInitial());

  Future<void> loadDashboard() async {
    try {
      emit(DashboardLoading());
      final response = await _repository.getDashboard();
      if (response.success) {
        emit(DashboardLoaded(response.data));
      } else {
        emit(DashboardError('Failed to load dashboard data'));
      }
    } catch (e) {
      emit(DashboardError(e.toString()));
    }
  }
}





