import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/settings/data/models/company_settings_response.dart';
import 'package:invotek/features/settings/data/models/update_company_settings_request.dart';
import 'package:invotek/features/settings/domain/usecases/get_company_settings.dart';
import 'package:invotek/features/settings/domain/usecases/update_company_settings.dart';

abstract class CompanyState {}

class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {}

class CompanyLoaded extends CompanyState {
  final CompanySettingsResponse company;
  final bool isUpdating;
  final String? updateError;
  CompanyLoaded(this.company, {this.isUpdating = false, this.updateError});
}

class CompanyError extends CompanyState {
  final String message;
  CompanyError(this.message);
}

class CompanyCubit extends Cubit<CompanyState> {
  final GetCompanySettings getCompanySettingsUseCase;
  final UpdateCompanySettings updateCompanySettingsUseCase;

  CompanyCubit({
    required this.getCompanySettingsUseCase,
    required this.updateCompanySettingsUseCase,
  }) : super(CompanyInitial());

  Future<void> load() async {
    emit(CompanyLoading());
    final result = await getCompanySettingsUseCase(const NoParams());
    result.when(
      success: (data) => emit(CompanyLoaded(data)),
      failure: (error) => emit(CompanyError(error.message)),
    );
  }

  Future<void> updateCompany(UpdateCompanySettingsRequest request) async {
    final currentState = state;
    if (currentState is CompanyLoaded) {
      emit(CompanyLoaded(currentState.company, isUpdating: true));
      final result = await updateCompanySettingsUseCase(request);
      result.when(
        success: (data) => emit(CompanyLoaded(data)),
        failure: (error) => emit(
          CompanyLoaded(currentState.company, updateError: error.message),
        ),
      );
    }
  }
}
