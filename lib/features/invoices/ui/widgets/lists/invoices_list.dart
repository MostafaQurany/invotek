import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_card.dart';

class InvoicesList extends StatelessWidget {
  final List<InvoiceModel> invoices;
  final Function(InvoiceModel) onInvoiceTap;
  final Function(InvoiceModel) onInvoiceView;
  final Function(InvoiceModel) onInvoiceEdit;
  final Function(InvoiceModel) onInvoiceDelete;

  const InvoicesList({
    super.key,
    required this.invoices,
    required this.onInvoiceTap,
    required this.onInvoiceView,
    required this.onInvoiceEdit,
    required this.onInvoiceDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final invoice = invoices[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: InvoiceCard(
            invoice: invoice,
            onTap: () => onInvoiceTap(invoice),
            onView: () => onInvoiceView(invoice),
            onEdit: () => onInvoiceEdit(invoice),
            onDelete: () => onInvoiceDelete(invoice),
          ),
        );
      }, childCount: invoices.length),
    );
  }
}
