import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/features/settings/data/models/company_settings_response.dart';
import 'package:invotek/features/settings/domain/usecases/get_company_settings.dart';

abstract class CompanyState {}

class CompanyInitial extends CompanyState {}

class CompanyLoading extends CompanyState {}

class CompanyLoaded extends CompanyState {
  final CompanySettingsResponse company;
  CompanyLoaded(this.company);
}

class CompanyError extends CompanyState {
  final String message;
  CompanyError(this.message);
}

class CompanyCubit extends Cubit<CompanyState> {
  final GetCompanySettings getCompanySettingsUseCase;

  CompanyCubit({required this.getCompanySettingsUseCase})
      : super(CompanyInitial());

  Future<void> load() async {
    emit(CompanyLoading());
    final result = await getCompanySettingsUseCase(const NoParams());
    result.when(
      success: (data) => emit(CompanyLoaded(data)),
      failure: (error) => emit(CompanyError(error.message)),
    );
  }
}


