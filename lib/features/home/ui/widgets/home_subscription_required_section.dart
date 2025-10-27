import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSubscriptionRequiredSection extends StatelessWidget {
  final String message;
  final String? redirectUrl;
  final VoidCallback? onCustomAction;
  final String? customActionText;

  const HomeSubscriptionRequiredSection({
    super.key,
    required this.message,
    this.redirectUrl,
    this.onCustomAction,
    this.customActionText,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Center(
        child: Column(
          children: [
            Icon(Icons.card_membership, size: 48.sp, color: Colors.orange[800]),
            SizedBox(height: 16.h),
            Text(
              S.of(context).subscriptionRequired,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.orange[800],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              message.isNotEmpty ? message : S.of(context).subscriptionRequiredMessage,
              style: TextStyle(
                fontSize: 16.sp,
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton.icon(
              onPressed:
                  onCustomAction ??
                  (redirectUrl != null ? () => _handleRedirect(context) : null),
              icon: Icon(Icons.card_membership),
              label: Text(customActionText ?? S.of(context).chooseSubscription),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[800],
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleRedirect(BuildContext context) async {
    if (redirectUrl == null) return;

    try {
      final uri = Uri.parse(redirectUrl!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _showErrorSnackBar(context);
      }
    } catch (e) {
      _showErrorSnackBar(context);
    }
  }

  void _showErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).cannotOpenSubscriptionLink),
        backgroundColor: Colors.red,
      ),
    );
  }
}
