import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/domain/repositories/invoice_repository.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/data/models/requests/get_invoice_request.dart';

class GetInvoiceById implements UseCase<InvoiceEntity, GetInvoiceRequest> {
  final InvoiceRepository repository;

  GetInvoiceById(this.repository);

  @override
  Future<ApiResult<InvoiceEntity>> call(GetInvoiceRequest params) async {
    return await repository.getInvoice(request: params);
  }
}
