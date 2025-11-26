import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/features/invoices/domain/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/ui/screens/create_credit_invoice_screen.dart';

class CreateCreditInvoiceScreenWithProvider extends StatelessWidget {
  final InvoiceEntity originalInvoice;

  const CreateCreditInvoiceScreenWithProvider({
    super.key,
    required this.originalInvoice,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InvoicesCubit>.value(
      value: getIt<InvoicesCubit>(),
      child: CreateCreditInvoiceScreen(
        originalInvoice: originalInvoice,
      ),
    );
  }
}

