import 'package:flutter/material.dart';
import 'package:invotek/features/auth/ui/auth_screen.dart';

class AppRouter {
  static const String authRoute = '/';
  static const String homeRoute = '/home';

  static Map<String, WidgetBuilder> get routes {
    return {
      authRoute: (context) => const AuthScreen(),
      // Add other routes here as your app grows
      homeRoute: (context) => const AuthScreen(),
    };
  }
}