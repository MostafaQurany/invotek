import 'package:flutter/material.dart';
import 'package:invotek/features/auth/ui/auth_screen.dart';
import 'package:invotek/features/home/ui/home_screen.dart';

class AppRouter {
  static const String authRoute = '/';
  static const String registerRoute = '/register';
  static const String homeRoute = '/home';
}

class RouterClass {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case AppRouter.authRoute:
        page = const AuthScreen();
        break;
      case AppRouter.homeRoute:
        page = const HomeScreen();
        break;
      default:
        page = Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        );
    }

    // Sliding transition (from right)
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide from right
        const end = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
      transitionDuration: const Duration(milliseconds: 350),
      settings: settings,
    );
  }
}
