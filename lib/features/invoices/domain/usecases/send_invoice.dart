import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/domain/repositories/invoice_repository.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';

class SendInvoiceParams {
  final int invoiceId;

  const SendInvoiceParams({
    required this.invoiceId,
  });
}

class SendInvoice implements UseCase<InvoiceEntity, SendInvoiceParams> {
  final InvoiceRepository repository;

  SendInvoice(this.repository);

  @override
  Future<ApiResult<InvoiceEntity>> call(
    SendInvoiceParams params,
  ) async {
    return await repository.sendInvoice(
      invoiceId: params.invoiceId,
    );
  }
}

