import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/data/repository/invoice_repository.dart';
import 'package:invotek/features/invoices/data/models/responses/delete_invoice_response.dart';
import 'package:invotek/features/invoices/data/models/requests/delete_invoice_request.dart';

class DeleteInvoice
    implements UseCase<DeleteInvoiceResponse, DeleteInvoiceRequest> {
  final InvoiceRepository repository;

  DeleteInvoice(this.repository);

  @override
  Future<ApiResult<DeleteInvoiceResponse>> call(
    DeleteInvoiceRequest params,
  ) async {
    return await repository.deleteInvoice(request: params);
  }
}
