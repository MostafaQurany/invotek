import 'package:flutter/material.dart';
import 'package:invotek/core/widgets/failure_widget.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

class ExpensesErrorWidget extends StatelessWidget {
  final Failure failure;
  final VoidCallback? onRetry;

  const ExpensesErrorWidget({super.key, required this.failure, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return failure.when(
      server: (message, statusCode) => FailureWidget(
        failure: failure,
        onRetry: onRetry,
        customTitle: S.of(context).expensesLoadError,
        customMessage: message,
      ),
      network: (message) => FailureWidget(
        failure: failure,
        onRetry: onRetry,
        customTitle: S.of(context).expensesNetworkError,
        customMessage: message,
      ),
      validation: (message, errors) => FailureWidget(
        failure: failure,
        customTitle: S.of(context).expensesValidationError,
        customMessage: message,
      ),
      unknown: (message) => FailureWidget(
        failure: failure,
        onRetry: onRetry,
        customTitle: S.of(context).expensesUnknownError,
        customMessage: message,
      ),
      timeout: (message) => FailureWidget(
        failure: failure,
        onRetry: onRetry,
        customTitle: S.of(context).expensesTimeoutError,
        customMessage: message,
      ),
      unauthorized: (message) => FailureWidget(
        failure: failure,
        customTitle: S.of(context).expensesUnauthorizedError,
        customMessage: message,
      ),
      cache: (message) => FailureWidget(
        failure: failure,
        customTitle: S.of(context).expensesCacheError,
        customMessage: message,
      ),
      subscriptionRequired: (message, redirectUrl) => FailureWidget(
        failure: failure,
        customTitle: S.of(context).subscriptionRequiredTitle,
        customMessage: message,
        customAction: redirectUrl != null
            ? () async {
                // فتح رابط الباقة في المتصفح الخارجي
                final uri = Uri.parse(redirectUrl);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  // إذا فشل فتح الرابط، انتقل لصفحة الباقات المحلية
                  Navigator.pushNamed(
                    context,
                    AppRoutes.subscriptionPackagesRoute,
                  );
                }
              }
            : () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.subscriptionPackagesRoute,
                );
              },
        customActionText: S.of(context).subscriptionRequiredAction,
      ),
    );
  }
}
