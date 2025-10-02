import 'package:flutter/material.dart';
import 'package:invotek/features/invoices/ui/screens/invoice_details_screen.dart';

class InvoiceDetailsScreenWithProvider extends StatelessWidget {
  final dynamic invoice; // InvoiceModel

  const InvoiceDetailsScreenWithProvider({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    return InvoiceDetailsScreen(invoice: invoice);
  }
}
