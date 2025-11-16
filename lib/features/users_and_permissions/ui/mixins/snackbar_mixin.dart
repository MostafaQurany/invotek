import 'package:flutter/material.dart';
import 'package:invotek/generated/l10n.dart';

mixin SnackbarMixin {
  /// إغلاق أي SnackBar مفتوح قبل إظهار واحد جديد
  void _hideCurrentSnackBar(BuildContext context) {
    try {
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      if (scaffoldMessenger.mounted) {
        scaffoldMessenger.hideCurrentSnackBar();
      }
    } catch (e) {
      // Silently handle errors to prevent crashes
      debugPrint('Error hiding snackbar: $e');
    }
  }

  void showErrorSnackBar(BuildContext context, String error) {
    _hideCurrentSnackBar(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void showSuccessSnackBar(BuildContext context, String message) {
    _hideCurrentSnackBar(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void showUserAddedSuccessSnackBar(BuildContext context) {
    showSuccessSnackBar(context, S.of(context).userAddedSuccessfully);
  }

  void showUserCreationErrorSnackBar(BuildContext context) {
    showErrorSnackBar(context, S.of(context).errorCreatingUser);
  }
}
