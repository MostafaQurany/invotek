import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/domain/repositories/invoice_repository.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/data/models/requests/update_invoice_request.dart';

class UpdateInvoice
    implements UseCase<InvoiceEntity, UpdateInvoiceRequest> {
  final InvoiceRepository repository;

  UpdateInvoice(this.repository);

  @override
  Future<ApiResult<InvoiceEntity>> call(
    UpdateInvoiceRequest params,
  ) async {
    return await repository.updateInvoice(request: params);
  }
}
