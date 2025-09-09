import 'package:flutter/material.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';
import 'package:invotek/generated/l10n.dart';

class DeleteCustomerDialog extends StatelessWidget {
  final CustomerModel customer;
  final VoidCallback onConfirm;

  const DeleteCustomerDialog({
    super.key,
    required this.customer,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final s = S.of(context);

    return AlertDialog(
      title: Text(s.confirmDeleteCustomer),
      content: Text(s.confirmDeleteCustomerMessage(customer.name)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(s.cancel),
        ),
        TextButton(
          onPressed: () {
            onConfirm();
            Navigator.pop(context);
          },
          style: TextButton.styleFrom(foregroundColor: colorScheme.error),
          child: Text(s.delete),
        ),
      ],
    );
  }
}
