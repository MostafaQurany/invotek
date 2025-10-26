import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/data/repository/invoice_repository.dart';
import 'package:invotek/features/invoices/data/models/responses/get_all_invoices_response.dart';
import 'package:invotek/features/invoices/data/models/requests/get_all_invoices_request.dart';

class GetInvoices
    implements UseCase<GetAllInvoicesResponse, GetAllInvoicesRequest> {
  final InvoiceRepository repository;

  GetInvoices(this.repository);

  @override
  Future<ApiResult<GetAllInvoicesResponse>> call(
    GetAllInvoicesRequest params,
  ) async {
    return await repository.getAllInvoices(request: params);
  }
}
