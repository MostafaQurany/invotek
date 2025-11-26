import 'package:flutter/material.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/ui/screens/invoice_form_screen.dart';

class InvoiceFormScreenWithProvider extends StatelessWidget {
  final InvoiceEntity? invoice;
  final InvoiceEntity? originalInvoice;

  const InvoiceFormScreenWithProvider({
    super.key,
    this.invoice,
    this.originalInvoice,
  });

  @override
  Widget build(BuildContext context) {
    return InvoiceFormScreen(
      invoice: invoice,
      originalInvoice: originalInvoice,
    );
  }
}

