import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/data/repository/invoice_repository.dart';
import 'package:invotek/features/invoices/data/models/responses/create_invoice_response.dart';
import 'package:invotek/features/invoices/data/models/requests/create_invoice_request.dart';

class CreateInvoice
    implements UseCase<CreateInvoiceResponse, CreateInvoiceRequest> {
  final InvoiceRepository repository;

  CreateInvoice(this.repository);

  @override
  Future<ApiResult<CreateInvoiceResponse>> call(
    CreateInvoiceRequest params,
  ) async {
    return await repository.createInvoice(request: params);
  }
}
