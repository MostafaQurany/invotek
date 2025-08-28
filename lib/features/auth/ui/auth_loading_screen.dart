import 'package:flutter/material.dart';
import 'package:invotek/core/widgets/app_loading_screen.dart';

class AuthLoadingScreen extends StatelessWidget {
  const AuthLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLoadingScreen(
      message: 'Loading...',
      indicatorColor: Colors.green,
    );
  }
}
