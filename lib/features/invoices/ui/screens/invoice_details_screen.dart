import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/features/invoices/data/models/invoice_customer_model.dart';
import 'package:invotek/features/invoices/demo/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/invoices/ui/screens/edit_invoice_screen.dart';
import 'package:invotek/features/invoices/ui/widgets/headers/invoice_details_header_widget.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_summary_card.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_customer_card.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_items_card.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoice_payment_card.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/delete_invoice_dialog.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/send_invoice_dialog.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/mark_paid_dialog.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/item_details_dialog.dart';
import 'package:invotek/features/printing/ui/dialogs/invoice_print_dialog.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/features/invoices/constants/invoices_permissions.dart';
import 'package:invotek/core/utils/permission_helper.dart';

class InvoiceDetailsScreen extends StatefulWidget {
  final InvoiceModel invoice;

  const InvoiceDetailsScreen({super.key, required this.invoice});

  @override
  State<InvoiceDetailsScreen> createState() => _InvoiceDetailsScreenState();
}

class _InvoiceDetailsScreenState extends State<InvoiceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final invoice = widget.invoice;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Modern Header with Animation
          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration.zero,
              child: InvoiceDetailsHeaderWidget(
                invoice: invoice,
                onBack: () => Navigator.pop(context),
                onEdit: () => _editInvoice(),
              ),
            ),
          ),

          // Space with Animation
          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 200),
              child: SizedBox(height: 16.h),
            ),
          ),

          // Content Cards with Staggered Animation
          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 400),
              child: InvoiceSummaryCard(
                invoice: invoice,
                onStatusTap: () => _showStatusOptions(),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 600),
              child: SizedBox(height: 16.h),
            ),
          ),

          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 800),
              child: InvoiceCustomerCard(
                customer:
                    invoice.customer ??
                    InvoiceCustomerModel(
                      id: 0,
                      name: S.of(context).invoicesCustomerName,
                      email: S.of(context).invoicesCustomerEmail,
                      phone: S.of(context).invoicesCustomerPhone,
                      companyId: 0,
                      taxNumber: "0",
                      address: "0",
                      notes: "0",
                      status: "0",
                      createdAt: "0",
                      updatedAt: "0",
                    ),
                onCustomerTap: () => _viewCustomerDetails(),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 1000),
              child: SizedBox(height: 16.h),
            ),
          ),

          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 1200),
              child: InvoiceItemsCard(
                items: invoice.items ?? [],
                onItemTap: (item) => _viewItemDetails(item),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 1400),
              child: SizedBox(height: 16.h),
            ),
          ),

          SliverToBoxAdapter(
            child: AnimatedEntryWidget(
              delay: Duration(milliseconds: 1600),
              child: InvoicePaymentCard(
                invoice: invoice,
                onPaymentMethodTap: () => _changePaymentMethod(),
                onMarkPaid: () => _markAsPaid(),
              ),
            ),
          ),

          // Bottom spacing
          SliverToBoxAdapter(child: SizedBox(height: 100.h)),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildFloatingActionButton() {
    final s = S.of(context);
    final hasPrintPermission = PermissionChecker.hasPermission(
      context,
      InvoicesPermissions.print,
    );
    final hasSendPermission = PermissionChecker.hasPermission(
      context,
      InvoicesPermissions.send,
    );
    final hasEditPermission = PermissionChecker.hasPermission(
      context,
      InvoicesPermissions.edit,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Print Button
        Tooltip(
          message: hasPrintPermission
              ? s.printInvoice
              : s.invoicesNoPermissionToAct,
          child: FloatingActionButton(
            heroTag: "print_${widget.invoice.id}",
            onPressed: hasPrintPermission ? _showPrintOptions : null,
            backgroundColor: hasPrintPermission
                ? AppColors.warning
                : AppColors.grey.withOpacity(0.5),
            child: Icon(
              hasPrintPermission ? Icons.print : Icons.lock_outline,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 8.h),

        // Send Invoice Button
        Tooltip(
          message: hasSendPermission
              ? s.sendInvoice
              : s.invoicesNoPermissionToAct,
          child: FloatingActionButton(
            heroTag: "send_${widget.invoice.id}",
            onPressed: hasSendPermission ? _sendInvoice : null,
            backgroundColor: hasSendPermission
                ? AppColors.success
                : AppColors.grey.withOpacity(0.5),
            child: Icon(
              hasSendPermission ? Icons.send : Icons.lock_outline,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 8.h),

        // Edit Invoice Button
        Tooltip(
          message: hasEditPermission
              ? s.editInvoice
              : s.invoicesNoPermissionToAct,
          child: FloatingActionButton(
            heroTag: "edit_${widget.invoice.id}",
            onPressed: hasEditPermission ? _editInvoice : null,
            backgroundColor: hasEditPermission
                ? AppColors.primary
                : AppColors.grey.withOpacity(0.5),
            child: Icon(
              hasEditPermission ? Icons.edit : Icons.lock_outline,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 8.h),

        // More Options Button
        FloatingActionButton(
          heroTag: "more_${widget.invoice.id}",
          onPressed: _showMoreOptions,
          backgroundColor: AppColors.surface,
          child: const Icon(Icons.more_vert, color: AppColors.textPrimary),
        ),
      ],
    );
  }

  void _editInvoice() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditInvoiceScreen(invoice: widget.invoice),
      ),
    );
  }

  void _showStatusOptions() {
    // TODO: Implement status options
  }

  void _viewCustomerDetails() {
    // TODO: Navigate to customer details
  }

  void _viewItemDetails(dynamic item) {
    showDialog(
      context: context,
      builder: (context) => ItemDetailsDialog(item: item),
    );
  }

  void _changePaymentMethod() {
    // TODO: Implement payment method change
  }

  void _markAsPaid() {
    showDialog(
      context: context,
      builder: (context) => MarkPaidDialog(
        invoice: widget.invoice,
        onMarkPaid: () {
          // TODO: Implement mark as paid
          Navigator.pop(context);
        },
      ),
    );
  }

  void _sendInvoice() {
    showDialog(
      context: context,
      builder: (context) => SendInvoiceDialog(
        invoice: widget.invoice,
        onSend: () {
          // TODO: Implement send invoice
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => _buildMoreOptionsBottomSheet(),
    );
  }

  Widget _buildMoreOptionsBottomSheet() {
    final s = S.of(context);
    final hasPrintPermission = PermissionChecker.hasPermission(
      context,
      InvoicesPermissions.print,
    );
    final hasDeletePermission = PermissionChecker.hasPermission(
      context,
      InvoicesPermissions.delete,
    );

    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildOptionTile(
            icon: Icons.print,
            iconColor: hasPrintPermission
                ? AppColors.warning
                : AppColors.grey.withOpacity(0.5),
            title: s.printInvoice,
            hasPermission: hasPrintPermission,
            permissionMessage: s.invoicesNoPermissionToAct,
            onTap: hasPrintPermission
                ? () {
                    Navigator.pop(context);
                    _showPrintOptions();
                  }
                : null,
          ),
          ListTile(
            leading: const Icon(Icons.copy, color: AppColors.primary),
            title: Text(s.invoicesDuplicateInvoice),
            onTap: () {
              Navigator.pop(context);
              _duplicateInvoice();
            },
          ),
          ListTile(
            leading: const Icon(Icons.download, color: AppColors.success),
            title: Text(s.invoicesDownloadPDF),
            onTap: () {
              Navigator.pop(context);
              _downloadPDF();
            },
          ),
          _buildOptionTile(
            icon: Icons.delete,
            iconColor: hasDeletePermission
                ? AppColors.error
                : AppColors.grey.withOpacity(0.5),
            title: s.deleteInvoice,
            hasPermission: hasDeletePermission,
            permissionMessage: s.invoicesNoPermissionToAct,
            onTap: hasDeletePermission
                ? () {
                    Navigator.pop(context);
                    _deleteInvoice();
                  }
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required bool hasPermission,
    required String permissionMessage,
    VoidCallback? onTap,
  }) {
    return Tooltip(
      message: hasPermission ? title : permissionMessage,
      child: ListTile(
        leading: Icon(
          hasPermission ? icon : Icons.lock_outline,
          color: iconColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: hasPermission
                ? AppColors.textPrimary
                : AppColors.grey.withOpacity(0.5),
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  void _deleteInvoice() {
    showDialog(
      context: context,
      builder: (context) => DeleteInvoiceDialog(
        invoice: widget.invoice,
        onDelete: () {
          context.read<InvoicesCubit>().deleteInvoice(widget.invoice.id ?? 0);
          Navigator.pop(context);
          Navigator.pop(context);
        },
      ),
    );
  }

  void _duplicateInvoice() {
    // TODO: Implement duplicate invoice
  }

  void _downloadPDF() {
    // TODO: Implement PDF download
  }

  void _showPrintOptions() {
    // عرض dialog الطباعة مباشرة
    showDialog(
      context: context,
      builder: (context) => InvoicePrintDialog(invoice: widget.invoice),
    );
  }
}
