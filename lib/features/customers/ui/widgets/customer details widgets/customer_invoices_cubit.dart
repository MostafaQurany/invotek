// lib/features/customers/ui/widgets/customer details widgets/customer_invoices_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/features/customers/domain/usecases/get_customer_invoices.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';

abstract class CustomerInvoicesState {}

class CustomerInvoicesInitial extends CustomerInvoicesState {}

class CustomerInvoicesLoading extends CustomerInvoicesState {}

class CustomerInvoicesLoaded extends CustomerInvoicesState {
  final List<InvoiceModel> invoices;
  final int totalInvoices;

  CustomerInvoicesLoaded({required this.invoices, required this.totalInvoices});
}

class CustomerInvoicesError extends CustomerInvoicesState {
  final Failure failure;

  CustomerInvoicesError({required this.failure});
}

class CustomerInvoicesCubit extends Cubit<CustomerInvoicesState> {
  final GetCustomerInvoices _getCustomerInvoices;

  int _currentPage = 1;
  int _totalPages = 1;
  List<InvoiceModel> _allInvoices = [];
  bool _isLoadingMore = false;

  CustomerInvoicesCubit(this._getCustomerInvoices)
    : super(CustomerInvoicesInitial());

  Future<void> loadCustomerInvoices(
    int customerId, {
    bool refresh = false,
  }) async {
    if (refresh) {
      _currentPage = 1;
      _allInvoices.clear();
      emit(CustomerInvoicesLoading());
    } else if (_allInvoices.isNotEmpty) {
      // إظهار مؤشر التحميل في نهاية القائمة
      emit(
        CustomerInvoicesLoaded(
          invoices: _allInvoices,
          totalInvoices: _allInvoices.length,
        ),
      );
    }

    final result = await _getCustomerInvoices(
      GetCustomerInvoicesParams(
        customerId: customerId,
        page: _currentPage,
        limit: 10,
      ),
    );

    result.when(
      success: (response) {
        final newInvoices = response.data.data ?? [];
        final totalInvoices = int.parse(
          (response.data.total ?? "0").toString(),
        );

        if (refresh) {
          _allInvoices = newInvoices;
        } else {
          _allInvoices.addAll(newInvoices);
        }

        _totalPages = (totalInvoices / 10).ceil();

        emit(
          CustomerInvoicesLoaded(
            invoices: _allInvoices,
            totalInvoices: totalInvoices,
          ),
        );
      },
      failure: (failure) {
        emit(CustomerInvoicesError(failure: failure));
      },
    );
  }

  Future<void> loadMoreInvoices(int customerId) async {
    if (_isLoadingMore || _currentPage >= _totalPages) return;

    _isLoadingMore = true;
    _currentPage++;
    await loadCustomerInvoices(customerId);
    _isLoadingMore = false;
  }

  Future<void> refreshInvoices(int customerId) async {
    await loadCustomerInvoices(customerId, refresh: true);
  }

  bool get isLoadingMore => _isLoadingMore;
  int get currentPage => _currentPage;
  int get totalPages => _totalPages;
}
