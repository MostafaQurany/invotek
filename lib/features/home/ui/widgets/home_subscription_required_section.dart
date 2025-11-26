import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/utils/app_images.dart';
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
              message.isNotEmpty
                  ? message
                  : S.of(context).subscriptionRequiredMessage,
              style: TextStyle(
                fontSize: 16.sp,
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5.w,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed:
                      onCustomAction ??
                      (redirectUrl != null
                          ? () => _handleRedirect(context)
                          : null),
                  icon: Icon(Icons.card_membership),
                  label: Text(
                    customActionText ?? S.of(context).chooseSubscription,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[800],
                    foregroundColor: Colors.white,
                  ),
                ),
                // show what'sapp icon to navigate with +962 7 9893 4845
                IconButton(
                  onPressed: () => _openWhatsApp(context),
                  icon: Image.asset(
                    AppImages.whatsappIcon,
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
              ],
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

  void _openWhatsApp(BuildContext context) async {
    final phone = '962798934845'; // رقم كامل مع رمز الدولة (+962 7 9893 4845)

    // محاولة فتح WhatsApp باستخدام scheme مباشر
    final whatsappUri = Uri.parse('whatsapp://send?phone=$phone&text=');

    try {
      // محاولة فتح WhatsApp مباشرة
      if (await canLaunchUrl(whatsappUri)) {
        // استخدام platformDefault للسماح للنظام باختيار الطريقة المناسبة
        await launchUrl(whatsappUri, mode: LaunchMode.platformDefault);
        return;
      }
    } catch (e) {
      // إذا فشل، جرب رابط wa.me
    }

    // إذا فشل فتح WhatsApp مباشرة، استخدم رابط wa.me
    try {
      final webUri = Uri.parse('https://wa.me/$phone');
      if (await canLaunchUrl(webUri)) {
        // استخدام platformDefault
        await launchUrl(webUri, mode: LaunchMode.platformDefault);
      } else {
        _showErrorSnackBar(context);
      }
    } catch (e) {
      _showErrorSnackBar(context);
    }
  }
}
