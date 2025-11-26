import 'package:invotek/core/usecase/usecase.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/features/invoices/domain/repositories/invoice_repository.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/data/models/requests/create_credit_invoice_request.dart';

class CreateCreditInvoiceParams {
  final int invoiceId;
  final CreateCreditInvoiceRequest request;

  const CreateCreditInvoiceParams({
    required this.invoiceId,
    required this.request,
  });
}

class CreateCreditInvoice
    implements UseCase<InvoiceEntity, CreateCreditInvoiceParams> {
  final InvoiceRepository repository;

  CreateCreditInvoice(this.repository);

  @override
  Future<ApiResult<InvoiceEntity>> call(
    CreateCreditInvoiceParams params,
  ) async {
    return await repository.createCreditInvoice(
      invoiceId: params.invoiceId,
      request: params.request,
    );
  }
}

