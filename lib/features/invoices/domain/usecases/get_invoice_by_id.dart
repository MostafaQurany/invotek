import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/data/repository/invoice_repository.dart';
import 'package:invotek/features/invoices/data/models/responses/get_invoice_response.dart';
import 'package:invotek/features/invoices/data/models/requests/get_invoice_request.dart';

class GetInvoiceById implements UseCase<GetInvoiceResponse, GetInvoiceRequest> {
  final InvoiceRepository repository;

  GetInvoiceById(this.repository);

  @override
  Future<ApiResult<GetInvoiceResponse>> call(GetInvoiceRequest params) async {
    return await repository.getInvoice(request: params);
  }
}
