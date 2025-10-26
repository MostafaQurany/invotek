import 'package:flutter/material.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class FailureWidget extends StatelessWidget {
  final Failure failure;
  final VoidCallback? onRetry;
  final String? customTitle;
  final String? customMessage;
  final VoidCallback? customAction;
  final String? customActionText;

  const FailureWidget({
    super.key,
    required this.failure,
    this.onRetry,
    this.customTitle,
    this.customMessage,
    this.customAction,
    this.customActionText,
  });

  @override
  Widget build(BuildContext context) {
    return failure.when(
      server: (message, statusCode) => _buildErrorWidget(
        context,
        icon: Icons.error_outline,
        title: customTitle ?? S.of(context).serverError,
        message: customMessage ?? message,
        statusCode: statusCode,
      ),
      network: (message) => _buildErrorWidget(
        context,
        icon: Icons.wifi_off,
        title: customTitle ?? S.of(context).networkError,
        message: customMessage ?? message,
        showRetry: true,
      ),
      cache: (message) => _buildErrorWidget(
        context,
        icon: Icons.storage,
        title: customTitle ?? S.of(context).cacheError,
        message: customMessage ?? message,
      ),
      validation: (message, errors) => _buildErrorWidget(
        context,
        icon: Icons.warning_amber,
        title: customTitle ?? S.of(context).validationError,
        message: customMessage ?? message,
        showValidationErrors: errors,
      ),
      unknown: (message) => _buildErrorWidget(
        context,
        icon: Icons.help_outline,
        title: customTitle ?? S.of(context).unknownError,
        message: customMessage ?? message,
      ),
      timeout: (message) => _buildErrorWidget(
        context,
        icon: Icons.timer_off,
        title: customTitle ?? S.of(context).timeoutError,
        message: customMessage ?? message,
        showRetry: true,
      ),
      unauthorized: (message) => _buildErrorWidget(
        context,
        icon: Icons.lock_outline,
        title: customTitle ?? S.of(context).unauthorizedError,
        message: customMessage ?? message,
      ),
      subscriptionRequired: (message, redirectUrl) => _buildErrorWidget(
        context,
        icon: Icons.card_membership,
        title: customTitle ?? 'اختيار الباقة مطلوب',
        message: customMessage ?? message,
        showRetry: false,
        customAction:
            customAction ??
            (redirectUrl != null
                ? () async {
                    // فتح رابط اختيار الباقة
                    final uri = Uri.parse(redirectUrl);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('لا يمكن فتح رابط الباقة'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                : null),
        customActionText:
            customActionText ?? (redirectUrl != null ? 'اختيار الباقة' : null),
      ),
    );
  }

  Widget _buildErrorWidget(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String message,
    int? statusCode,
    bool showRetry = false,
    Map<String, List<String>>? showValidationErrors,
    VoidCallback? customAction,
    String? customActionText,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Theme.of(context).colorScheme.error),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            if (statusCode != null) ...[
              const SizedBox(height: 8),
              Text(
                'Status Code: $statusCode',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            if (showValidationErrors != null &&
                showValidationErrors.isNotEmpty) ...[
              const SizedBox(height: 16),
              ...showValidationErrors.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ...entry.value.map(
                        (error) => Text(
                          '• $error',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
            if (showRetry && onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: Text(S.of(context).retry),
              ),
            ],
            if (customAction != null && customActionText != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: customAction,
                icon: const Icon(Icons.card_membership),
                label: Text(customActionText),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
