import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/domain/repositories/invoice_repository.dart';
import 'package:invotek/features/invoices/domain/entities/invoices_pagination_result.dart';
import 'package:invotek/features/invoices/data/models/requests/get_all_invoices_request.dart';

class GetCustomerInvoices
    implements UseCase<InvoicesPaginationResult, GetCustomerInvoicesParams> {
  final InvoiceRepository repository;

  GetCustomerInvoices(this.repository);

  @override
  Future<ApiResult<InvoicesPaginationResult>> call(
    GetCustomerInvoicesParams params,
  ) async {
    return await repository.getAllInvoices(
      request: params.toGetAllInvoicesRequest(),
    );
  }
}

class GetCustomerInvoicesParams {
  final int customerId;
  final int? limit;
  final int? page;
  final String? sortBy;
  final String? sortOrder;

  const GetCustomerInvoicesParams({
    required this.customerId,
    this.limit = 10,
    this.page = 1,
    this.sortBy = 'updated_at',
    this.sortOrder = 'desc',
  });

  /// تحويل إلى GetAllInvoicesRequest للاستخدام مع InvoiceRepository
  GetAllInvoicesRequest toGetAllInvoicesRequest() {
    return GetAllInvoicesRequest(
      customerId: customerId.toString(),
      limit: limit?.toString(),
      page: page?.toString(),
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }
}
