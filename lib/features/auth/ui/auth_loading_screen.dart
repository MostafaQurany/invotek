import 'package:flutter/material.dart';
import 'package:invotek/core/widgets/app_loading_screen.dart';
import 'package:invotek/generated/l10n.dart';

class AuthLoadingScreen extends StatelessWidget {
  const AuthLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppLoadingScreen(
      message: S.of(context).loading,
      indicatorColor: colorScheme.primary,
    );
  }
}
