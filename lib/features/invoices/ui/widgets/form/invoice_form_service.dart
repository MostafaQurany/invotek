import 'package:flutter/material.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/date_formatter.dart';
import 'package:invotek/features/invoices/data/models/requests/create_invoice_request.dart';
import 'package:invotek/features/invoices/data/models/requests/update_invoice_request.dart';
import 'package:invotek/features/invoices/domain/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/features/invoices/ui/widgets/form/invoice_form_helpers.dart';

class InvoiceFormService {
  final BuildContext context;
  final InvoiceFormController formController;
  final InvoicesCubit cubit;

  InvoiceFormService({
    required this.context,
    required this.formController,
    required this.cubit,
  });

  void createInvoice() {
    final taxInvoiceType = InvoiceFormHelpers.getTaxInvoiceType(context);
    final paymentMethodCode = InvoiceFormHelpers.getPaymentMethodCode(
      formController.selectedPaymentMethod,
      taxInvoiceType,
    );

    final isExistingCustomer = formController.selectedCustomerId != null;

    cubit.createInvoice(
      customerId: isExistingCustomer
          ? formController.selectedCustomerId?.toString()
          : null,
      customerName: isExistingCustomer
          ? null
          : (formController.selectedCustomerName?.isNotEmpty == true
                ? formController.selectedCustomerName
                : formController.customerNameController.text.trim().isNotEmpty
                ? formController.customerNameController.text.trim()
                : null),
      customerEmail: null, // Not required for new customers in create mode
      customerPhone: null, // Not required for new customers in create mode
      customerAddress: null,
      subtotal: formController.subtotalController.text,
      taxAmount: formController.taxAmountController.text,
      discount: formController.discountController.text,
      total: formController.totalController.text,
      issueDate: _formatIssueDateForApi(
        formController.issueDateController.text,
      ),
      description: formController.descriptionController.text.isEmpty
          ? null
          : formController.descriptionController.text,
      paymentMethodCode: paymentMethodCode,
      action: formController.selectedAction,
      items: formController.items
          .map(
            (item) => CreateInvoiceItemRequest(
              productId: item.productId?.toString(),
              name: item.name,
              quantity: item.quantity,
              price: item.price,
              discount: item.discount,
              taxPercent: item.taxPercent,
              taxAmount: item.taxAmount,
              total: item.total,
              productName: item.productName,
              productDescription: item.productDescription,
              productCategory: item.productCategory,
            ),
          )
          .toList(),
    );
  }

  void updateInvoice(InvoiceEntity invoice) {
    cubit.updateInvoice(
      id: invoice.id!.toString(),
      customerId: formController.selectedCustomerId?.toString(),
      customerName: formController.selectedCustomerName,
      customerEmail: formController.selectedCustomerEmail,
      customerPhone: formController.selectedCustomerPhone,
      customerAddress: formController.selectedCustomerAddress,
      subtotal: formController.subtotalController.text,
      taxAmount: formController.taxAmountController.text,
      discount: formController.discountController.text,
      total: formController.totalController.text,
      issueDate: _formatIssueDateForApi(
        formController.issueDateController.text,
      ),
      description: formController.descriptionController.text.isEmpty
          ? null
          : formController.descriptionController.text,
      paymentMethodCode: formController.selectedPaymentMethod,
      action: formController.selectedAction,
      items: formController.items
          .map(
            (item) => UpdateInvoiceItemRequest(
              productId: item.productId?.toString(),
              name: item.name,
              quantity: item.quantity,
              price: item.price,
              discount: item.discount,
              taxPercent: item.taxPercent,
              taxAmount: item.taxAmount,
              total: item.total,
              productName: item.productName,
              productDescription: item.productDescription,
              productCategory: item.productCategory,
            ),
          )
          .toList(),
    );
  }

  void submitCreditInvoice(
    InvoiceEntity originalInvoice,
    TextEditingController returnReasonController,
  ) {
    final invoiceId = originalInvoice.id ?? originalInvoice.invoiceId ?? 0;
    if (invoiceId == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid invoice ID'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    cubit.createCreditInvoice(
      invoiceId: invoiceId,
      issueDate: _formatIssueDateForApi(
        formController.issueDateController.text,
      ),
      returnReason: returnReasonController.text.trim(),
      description: formController.descriptionController.text.isEmpty
          ? null
          : formController.descriptionController.text,
      action: formController.selectedAction,
      items: formController.items
          .map(
            (item) => CreateInvoiceItemRequest(
              productId: item.productId?.toString(),
              name: item.name,
              quantity: item.quantity,
              price: item.price,
              discount: item.discount,
              taxPercent: item.taxPercent,
              taxAmount: item.taxAmount,
              total: item.total,
              productName: item.productName,
              productDescription: item.productDescription,
              productCategory: item.productCategory,
            ),
          )
          .toList(),
      subtotal: formController.subtotalController.text,
      taxAmount: formController.taxAmountController.text,
      discount: formController.discountController.text,
      total: formController.totalController.text,
    );
  }

  /// Convert issue date from text field (may contain Arabic digits) to API format (English digits)
  /// Ensures dates are always sent to API with English digits (0-9) instead of Arabic digits (٠-٩)
  String _formatIssueDateForApi(String dateText) {
    // Parse the date (handles both Arabic and English digits)
    final date = DateFormatter.parseApiDate(dateText);
    if (date != null) {
      // Convert to API format with English digits
      return DateFormatter.toApiFormat(date);
    }
    // Fallback: extract and convert Arabic digits to English
    return DateFormatter.extractDateFromApiString(dateText) ?? dateText;
  }
}
