import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/settings/cubit/tax_integration_cubit.dart';

class InvoiceFormHelpers {
  static String? getTaxInvoiceType(BuildContext context) {
    final taxState = context.read<TaxIntegrationCubit>().state;
    if (taxState is TaxIntegrationLoaded) {
      return taxState.status.taxInvoiceType;
    }
    return null;
  }

  static String getPaymentMethodCode(
    String paymentMethod,
    String? taxInvoiceType,
  ) {
    if (taxInvoiceType == 'income') {
      if (paymentMethod == 'cash') {
        return '011';
      } else if (paymentMethod == 'debts') {
        return '021';
      }
    } else if (taxInvoiceType == 'general') {
      if (paymentMethod == 'cash') {
        return '012';
      } else if (paymentMethod == 'debts') {
        return '022';
      }
    }
    // Default: return the payment method as is if taxInvoiceType is null
    return paymentMethod;
  }

  /// Convert payment method code to form value (cash or debts)
  static String convertPaymentMethodCodeToFormValue(String? paymentMethodCode) {
    if (paymentMethodCode == null) return 'cash';
    
    // Cash codes: 011 (income), 012 (general)
    if (paymentMethodCode == '011' || paymentMethodCode == '012') {
      return 'cash';
    }
    // Debts codes: 021 (income), 022 (general)
    if (paymentMethodCode == '021' || paymentMethodCode == '022') {
      return 'debts';
    }
    // Fallback for old codes
    return paymentMethodCode.toLowerCase();
  }

  /// Convert payment method code to display text
  static String getPaymentMethodDisplayText(String paymentMethodCode) {
    // Cash codes: 011 (income), 012 (general)
    if (paymentMethodCode == '011' || paymentMethodCode == '012') {
      return 'cash'; // Will be localized
    }
    // Debts codes: 021 (income), 022 (general)
    if (paymentMethodCode == '021' || paymentMethodCode == '022') {
      return 'debts'; // Will be localized
    }
    // Fallback for old codes
    return paymentMethodCode;
  }

  static String getAppBarTitle({
    required bool isCreditInvoiceMode,
    required bool isEditMode,
    required String createCreditInvoice,
    required String editInvoice,
    required String createNewInvoice,
  }) {
    if (isCreditInvoiceMode) {
      return createCreditInvoice;
    } else if (isEditMode) {
      return editInvoice;
    } else {
      return createNewInvoice;
    }
  }
}

