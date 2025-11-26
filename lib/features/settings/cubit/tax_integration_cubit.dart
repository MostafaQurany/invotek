import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/data/models/requests/activating_tax_integration_request.dart';
import 'package:invotek/features/invoices/data/models/responses/get_tax_integration_status.dart';
import 'package:invotek/features/invoices/domain/repositories/invoice_repository.dart' as domain;

abstract class TaxIntegrationState {}

class TaxIntegrationInitial extends TaxIntegrationState {}

class TaxIntegrationLoading extends TaxIntegrationState {}

class TaxIntegrationActionInProgress extends TaxIntegrationState {}

class TaxIntegrationLoaded extends TaxIntegrationState {
  final GetTaxIntegrationStatusData status;
  TaxIntegrationLoaded(this.status);
}

class TaxIntegrationError extends TaxIntegrationState {
  final String message;
  TaxIntegrationError(this.message);
}

class TaxIntegrationCubit extends Cubit<TaxIntegrationState> {
  final domain.InvoiceRepository _repository;

  TaxIntegrationCubit(this._repository) : super(TaxIntegrationInitial());

  Future<void> loadStatus() async {
    emit(TaxIntegrationLoading());
    final result = await _repository.getTaxIntegrationStatus();
    result.when(
      success: (response) => emit(TaxIntegrationLoaded(response.data)),
      failure: (failure) => emit(TaxIntegrationError(failure.message)),
    );
  }

  Future<void> activate({
    required String taxMerchantCode,
    required String taxInvoiceType,
  }) async {
    emit(TaxIntegrationActionInProgress());
    final result = await _repository.activateTaxIntegration(
      request: ActivatingTaxIntegrationRequest(
        taxInvoiceType: taxInvoiceType,
        taxMerchantCode: taxMerchantCode,
      ),
    );
    result.when(
      success: (_) async {
        await loadStatus();
      },
      failure: (failure) async {
        // حتى لو فشل تحليل استجابة التفعيل، جرّب جلب الحالة
        final statusResult = await _repository.getTaxIntegrationStatus();
        statusResult.when(
          success: (response) => emit(TaxIntegrationLoaded(response.data)),
          failure: (_) => emit(TaxIntegrationError(failure.message)),
        );
      },
    );
  }

  Future<void> deactivate() async {
    emit(TaxIntegrationActionInProgress());
    final result = await _repository.deactivateTaxIntegration();
    result.when(
      success: (_) async {
        await loadStatus();
      },
      failure: (failure) async {
        // حتى لو فشل تحليل استجابة الإلغاء، جرّب جلب الحالة
        final statusResult = await _repository.getTaxIntegrationStatus();
        statusResult.when(
          success: (response) => emit(TaxIntegrationLoaded(response.data)),
          failure: (_) => emit(TaxIntegrationError(failure.message)),
        );
      },
    );
  }
}


