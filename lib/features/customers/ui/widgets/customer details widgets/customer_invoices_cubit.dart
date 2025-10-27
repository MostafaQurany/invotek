// lib/features/customers/ui/widgets/customer details widgets/customer_invoices_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/features/customers/domain/usecases/get_customer_invoices.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';

part 'customer_invoices_cubit.freezed.dart';

class CustomerInvoicesCubit extends Cubit<CustomerInvoicesState> {
  final GetCustomerInvoices _getCustomerInvoices;

  CustomerInvoicesCubit(this._getCustomerInvoices)
    : super(const CustomerInvoicesState.initial());

  Future<void> loadCustomerInvoices(int customerId) async {
    emit(const CustomerInvoicesState.loading());

    final result = await _getCustomerInvoices(
      GetCustomerInvoicesParams(customerId: customerId),
    );

    result.when(
      success: (response) {
        final invoices = response.data.data ?? [];
        emit(CustomerInvoicesState.loaded(invoices: invoices));
      },
      failure: (failure) {
        emit(CustomerInvoicesState.error(failure: failure));
      },
    );
  }
}

@freezed
sealed class CustomerInvoicesState with _$CustomerInvoicesState {
  const factory CustomerInvoicesState.initial() = _Initial;
  const factory CustomerInvoicesState.loading() = _Loading;
  const factory CustomerInvoicesState.loaded({
    required List<InvoiceModel> invoices,
  }) = _Loaded;
  const factory CustomerInvoicesState.error({required Failure failure}) =
      _Error;
}
