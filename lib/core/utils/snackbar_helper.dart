import 'package:flutter/material.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class SnackBarHelper {
  static void showFailureSnackBar(
    BuildContext context,
    Failure failure, {
    String? customMessage,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    failure.when(
      server: (message, statusCode) => _show(
        context,
        icon: Icons.error_outline,
        message: customMessage ?? message,
        backgroundColor: colorScheme.error,
      ),
      network: (message) => _show(
        context,
        icon: Icons.wifi_off,
        message: customMessage ?? S.of(context).networkError,
        backgroundColor: Colors.orange,
      ),
      cache: (message) => _show(
        context,
        icon: Icons.storage,
        message: customMessage ?? S.of(context).cacheError,
        backgroundColor: colorScheme.error,
      ),
      validation: (message, errors) => _show(
        context,
        icon: Icons.warning_amber,
        message: customMessage ?? message,
        backgroundColor: Colors.amber,
      ),
      unknown: (message) => _show(
        context,
        icon: Icons.help_outline,
        message: customMessage ?? S.of(context).unknownError,
        backgroundColor: colorScheme.error,
      ),
      timeout: (message) => _show(
        context,
        icon: Icons.timer_off,
        message: customMessage ?? S.of(context).timeoutError,
        backgroundColor: Colors.deepOrange,
      ),
      unauthorized: (message) => _show(
        context,
        icon: Icons.lock_outline,
        message: customMessage ?? S.of(context).unauthorizedError,
        backgroundColor: Colors.red[900]!,
      ),
      subscriptionRequired: (message, redirectUrl) => _show(
        context,
        icon: Icons.card_membership,
        message: customMessage ?? message,
        backgroundColor: Colors.orange[800]!,
        action: redirectUrl != null
            ? () async {
                // فتح رابط اختيار الباقة في المتصفح
                final uri = Uri.parse(redirectUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('لا يمكن فتح رابط الباقة'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            : null,
        actionText: redirectUrl != null ? 'اختيار الباقة' : null,
      ),
    );
  }

  static void _show(
    BuildContext context, {
    required IconData icon,
    required String message,
    required Color backgroundColor,
    VoidCallback? action,
    String? actionText,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: actionText ?? S.of(context).dismiss,
          textColor: Colors.white,
          onPressed:
              action ??
              () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
        ),
      ),
    );
  }
}
