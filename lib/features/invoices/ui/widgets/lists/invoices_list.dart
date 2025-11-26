import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_card.dart';
import 'package:invotek/generated/l10n.dart';

class InvoicesList extends StatelessWidget {
  final List<InvoiceEntity> invoices;
  final Function(InvoiceEntity) onInvoiceTap;
  final Function(InvoiceEntity) onInvoiceView;
  final Function(InvoiceEntity)? onInvoiceEdit;
  final Function(InvoiceEntity)? onInvoiceDelete;
  final Function(InvoiceEntity)? onInvoiceReturn;
  final bool showLoadingIndicator;
  final String? loadingMessage;

  const InvoicesList({
    super.key,
    required this.invoices,
    required this.onInvoiceTap,
    required this.onInvoiceView,
    this.onInvoiceEdit,
    this.onInvoiceDelete,
    this.onInvoiceReturn,
    this.showLoadingIndicator = false,
    this.loadingMessage,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        // Show invoices first
        if (index < invoices.length) {
          final invoice = invoices[index];
          // البحث عن الفاتورة المرتجعة المرتبطة
          InvoiceEntity? creditInvoice;
          if (invoice.documentType?.toLowerCase() == 'invoice') {
            creditInvoice = invoices.firstWhere(
              (inv) =>
                  inv.documentType?.toLowerCase() == 'credit' &&
                  inv.apiRequest?.originalUid == invoice.taxUid,
              orElse: () => invoice, // Return invoice itself if not found
            );
            // إذا لم نجد فاتورة مرتجعة، نتحقق من أن creditInvoice != invoice
            if (creditInvoice == invoice) {
              creditInvoice = null;
            }
          }
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: InvoiceCard(
              invoice: invoice,
              creditInvoice: creditInvoice,
              onTap: () => onInvoiceTap(invoice),
              onEdit: onInvoiceEdit != null
                  ? () => onInvoiceEdit!(invoice)
                  : null,
              onDelete: onInvoiceDelete != null
                  ? () => onInvoiceDelete!(invoice)
                  : null,
              onView: () => onInvoiceView(invoice),
              onSend: null, // TODO: Add send functionality if needed
              onReturn: onInvoiceReturn != null
                  ? () => onInvoiceReturn!(invoice)
                  : null,
            ),
          );
        }

        // Show loading indicator if enabled
        if (showLoadingIndicator && index == invoices.length) {
          return Container(
            padding: EdgeInsets.all(16.w),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 8.h),
                  CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    loadingMessage ?? S.of(context).invoicesLoadingMore,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return null;
      }, childCount: invoices.length + (showLoadingIndicator ? 1 : 0)),
    );
  }
}
