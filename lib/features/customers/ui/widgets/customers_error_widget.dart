import 'package:flutter/material.dart';
import 'package:invotek/core/widgets/failure_widget.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomersErrorWidget extends StatelessWidget {
  final Failure failure;
  final VoidCallback? onRetry;

  const CustomersErrorWidget({super.key, required this.failure, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return failure.when(
      server: (message, statusCode) => FailureWidget(
        failure: failure,
        onRetry: onRetry,
        customTitle: S.of(context).customersLoadError,
        customMessage: message,
      ),
      network: (message) => FailureWidget(
        failure: failure,
        onRetry: onRetry,
        customTitle: S.of(context).customersNetworkError,
        customMessage: message,
      ),
      validation: (message, errors) => FailureWidget(
        failure: failure,
        customTitle: S.of(context).customersValidationError,
        customMessage: message,
      ),
      unknown: (message) => FailureWidget(
        failure: failure,
        onRetry: onRetry,
        customTitle: S.of(context).customersUnknownError,
        customMessage: message,
      ),
      timeout: (message) => FailureWidget(
        failure: failure,
        onRetry: onRetry,
        customTitle: S.of(context).customersTimeoutError,
        customMessage: message,
      ),
      unauthorized: (message) => FailureWidget(
        failure: failure,
        customTitle: S.of(context).customersUnauthorizedError,
        customMessage: message,
      ),
      cache: (message) => FailureWidget(
        failure: failure,
        customTitle: S.of(context).customersCacheError,
        customMessage: message,
      ),
      subscriptionRequired: (message, redirectUrl) => FailureWidget(
        failure: failure,
        customTitle: S.of(context).subscriptionRequired,
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
        customActionText: S.of(context).chooseSubscription,
      ),
    );
  }
}
