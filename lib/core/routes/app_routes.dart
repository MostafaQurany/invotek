import 'package:flutter/material.dart';
import 'package:invotek/features/auth/ui/auth_screen.dart';
import 'package:invotek/features/home/ui/home_screen.dart';
import 'package:invotek/features/onboarding/ui/onboarding_screen.dart';

class AppRoutes {
  static const String authRoute = '/auth';
  static const String homeRoute = '/home';
  static const String onboardingRoute = '/onboarding';

  static Map<String, WidgetBuilder> get routes => {
    authRoute: (context) => const AuthScreen(),
    homeRoute: (context) => const HomeScreen(),
    onboardingRoute: (context) => const OnboardingScreen(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authRoute:
        return MaterialPageRoute(builder: (context) => const AuthScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case onboardingRoute:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      default:
        return null;
    }
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(title: const Text('صفحة غير موجودة')),
        body: const Center(child: Text('الصفحة المطلوبة غير موجودة')),
      ),
    );
  }
}
