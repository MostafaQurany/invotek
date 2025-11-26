import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/domain/repositories/invoice_repository.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/data/models/requests/create_invoice_request.dart';

class CreateInvoice
    implements UseCase<InvoiceEntity, CreateInvoiceRequest> {
  final InvoiceRepository repository;

  CreateInvoice(this.repository);

  @override
  Future<ApiResult<InvoiceEntity>> call(
    CreateInvoiceRequest params,
  ) async {
    return await repository.createInvoice(request: params);
  }
}
