import 'package:flutter/material.dart';
import 'package:invotek/generated/l10n.dart';

mixin SnackbarMixin {
  void showErrorSnackBar(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
