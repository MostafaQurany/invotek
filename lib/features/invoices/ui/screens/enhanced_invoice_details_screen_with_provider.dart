import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/features/invoices/domain/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/ui/screens/enhanced_invoice_details_screen.dart';

/// Provider للشاشة المحسنة لتفاصيل الفاتورة
class EnhancedInvoiceDetailsScreenWithProvider extends StatelessWidget {
  final String invoiceId;

  const EnhancedInvoiceDetailsScreenWithProvider({
    super.key,
    required this.invoiceId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InvoicesCubit>.value(
      value: getIt<InvoicesCubit>(),
      child: EnhancedInvoiceDetailsScreen(invoiceId: invoiceId),
    );
  }
}
