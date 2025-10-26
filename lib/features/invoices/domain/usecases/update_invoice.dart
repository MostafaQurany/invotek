import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/data/repository/invoice_repository.dart';
import 'package:invotek/features/invoices/data/models/responses/update_invoice_response.dart';
import 'package:invotek/features/invoices/data/models/requests/update_invoice_request.dart';

class UpdateInvoice
    implements UseCase<UpdateInvoiceResponse, UpdateInvoiceRequest> {
  final InvoiceRepository repository;

  UpdateInvoice(this.repository);

  @override
  Future<ApiResult<UpdateInvoiceResponse>> call(
    UpdateInvoiceRequest params,
  ) async {
    return await repository.updateInvoice(request: params);
  }
}
