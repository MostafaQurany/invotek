import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/invoices/demo/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/data/repository/invoice_repository.dart';
import 'package:invotek/core/di/injection.dart';
import 'invoice_details_screen.dart';

class InvoiceDetailsScreenWithProvider extends StatelessWidget {
  final dynamic invoice; // InvoiceModel

  const InvoiceDetailsScreenWithProvider({
    super.key, 
    required this.invoice,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvoicesCubit(getIt<InvoiceRepository>()),
      child: InvoiceDetailsScreen(invoice: invoice),
    );
  }
}
