import 'package:flutter/material.dart';
import 'package:invotek/features/invoices/ui/screens/edit_invoice_screen.dart';

class EditInvoiceScreenWithProvider extends StatelessWidget {
  final dynamic invoice; // InvoiceModel

  const EditInvoiceScreenWithProvider({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return EditInvoiceScreen(invoice: invoice);
  }
}
