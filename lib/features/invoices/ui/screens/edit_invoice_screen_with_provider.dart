import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/invoices/demo/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/data/repository/invoice_repository.dart';
import 'package:invotek/core/di/injection.dart';
import 'edit_invoice_screen.dart';

class EditInvoiceScreenWithProvider extends StatelessWidget {
  final dynamic invoice; // InvoiceModel

  const EditInvoiceScreenWithProvider({
    super.key, 
    required this.invoice,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvoicesCubit(getIt<InvoiceRepository>()),
      child: EditInvoiceScreen(invoice: invoice),
    );
  }
}
