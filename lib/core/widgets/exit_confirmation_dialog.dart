import 'package:flutter/material.dart';
import 'package:invotek/generated/l10n.dart';

class ExitConfirmationDialog extends StatelessWidget {
  const ExitConfirmationDialog({super.key});

  static Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const ExitConfirmationDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      title: Text(
        S.of(context).exitAppConfirmation,
        style: TextStyle(
          color: colorScheme.onSurface,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        S.of(context).exitAppConfirmationMessage,
        style: TextStyle(color: colorScheme.onSurface),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            S.of(context).no,
            style: TextStyle(color: colorScheme.primary),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            S.of(context).yes,
            style: TextStyle(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
