import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/invoices/demo/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/data/repository/invoice_repository.dart';
import 'package:invotek/core/di/injection.dart';
import 'invoices_list_screen.dart';

class InvoicesListScreenWithProvider extends StatelessWidget {
  const InvoicesListScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvoicesCubit(getIt<InvoiceRepository>()),
      child: const InvoicesListScreen(),
    );
  }
}
