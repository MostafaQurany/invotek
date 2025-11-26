import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/domain/repositories/invoice_repository.dart';
import 'package:invotek/features/invoices/data/models/requests/delete_invoice_request.dart';

class DeleteInvoice
    implements UseCase<bool, DeleteInvoiceRequest> {
  final InvoiceRepository repository;

  DeleteInvoice(this.repository);

  @override
  Future<ApiResult<bool>> call(
    DeleteInvoiceRequest params,
  ) async {
    return await repository.deleteInvoice(request: params);
  }
}
