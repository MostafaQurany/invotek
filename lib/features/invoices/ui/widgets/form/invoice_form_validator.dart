import 'package:flutter/material.dart';
import 'package:invotek/features/invoices/ui/controllers/invoice_form_controller.dart';
import 'package:invotek/generated/l10n.dart';

class InvoiceFormValidator {
  final InvoiceFormController formController;
  final Map<String, String> validationErrors = {};

  InvoiceFormValidator(this.formController);

  bool validateForm({
    required BuildContext context,
    required bool isCreditInvoiceMode,
    required TextEditingController returnReasonController,
  }) {
    validationErrors.clear();

    bool isValid = true;

    if (!validateBasicInfo(context)) {
      isValid = false;
    }

    if (!validateCustomer(context)) {
      isValid = false;
    }

    if (!validateItems(context)) {
      isValid = false;
    }

    if (isCreditInvoiceMode &&
        returnReasonController.text.trim().isEmpty) {
      validationErrors['returnReason'] = 'Return reason is required';
      isValid = false;
    }

    return isValid;
  }

  bool validateBasicInfo(BuildContext context) {
    final s = S.of(context);
    bool isValid = true;

    if (formController.selectedPaymentMethod.isEmpty) {
      validationErrors['paymentMethod'] = s.paymentMethodRequired;
      isValid = false;
    }

    return isValid;
  }

  bool validateCustomer(BuildContext context) {
    final s = S.of(context);
    bool isValid = true;

    if (!formController.isCustomerStepValid()) {
      validationErrors['customer'] = s.customerRequired;
      isValid = false;
    }

    return isValid;
  }

  bool validateItems(BuildContext context) {
    final s = S.of(context);
    bool isValid = true;

    if (formController.items.isEmpty) {
      validationErrors['items'] = s.itemsRequired;
      isValid = false;
    }

    final qtyError = formController.validateItemQuantities();
    if (qtyError != null) {
      validationErrors['items'] = qtyError;
      isValid = false;
    }

    return isValid;
  }

  String? getFirstError() {
    if (validationErrors.values.isNotEmpty) {
      return validationErrors.values.first;
    }
    return 'Please fill all required fields';
  }
}

