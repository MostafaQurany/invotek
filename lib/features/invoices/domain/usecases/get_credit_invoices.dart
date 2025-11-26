import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/domain/repositories/invoice_repository.dart';
import 'package:invotek/features/invoices/domain/entities/invoices_pagination_result.dart';
import 'package:invotek/features/invoices/data/models/requests/get_all_invoices_request.dart';

class GetCreditInvoices
    implements UseCase<InvoicesPaginationResult, GetAllInvoicesRequest> {
  final InvoiceRepository repository;

  GetCreditInvoices(this.repository);

  @override
  Future<ApiResult<InvoicesPaginationResult>> call(
    GetAllInvoicesRequest params,
  ) async {
    return await repository.getCreditInvoices(request: params);
  }
}

