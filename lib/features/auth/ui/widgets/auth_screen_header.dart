import 'package:flutter/material.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/generated/l10n.dart';

class AuthScreenHeader extends StatelessWidget {
  const AuthScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.6),
            AppColors.primary.withOpacity(0.8),
            AppColors.primary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.6, 1],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            S.of(context).welcome,
            style: theme.textTheme.headlineMedium?.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Image.asset(AppImages.logoWhite, height: 100),
        ],
      ),
    );
  }
}
