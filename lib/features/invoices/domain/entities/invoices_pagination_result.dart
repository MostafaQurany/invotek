import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';

class InvoicesPaginationResult {
  final List<InvoiceEntity> invoices;
  final int? total;
  final int? lastPage;
  final int? currentPage;

  const InvoicesPaginationResult({
    required this.invoices,
    this.total,
    this.lastPage,
    this.currentPage,
  });
}

