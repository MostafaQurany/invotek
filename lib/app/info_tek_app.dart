import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/providers/app_providers.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/services/storage_service.dart';
import 'package:invotek/core/theme/app_theme.dart';
import 'package:invotek/core/widgets/app_exit_handler.dart';
import 'package:invotek/features/auth/ui/auth_screen.dart';
import 'package:invotek/features/home/ui/home_screen_with_drawer.dart';
import 'package:invotek/features/onboarding/ui/onboarding_screen.dart';
import 'package:invotek/generated/l10n.dart';

class InfoTekApp extends StatelessWidget {
  const InfoTekApp({super.key});

  Future<Widget> _getInitialScreen() async {
    // التحقق من أول مرة للمستخدم
    final isFirstTime = StorageService.isFirstTime();

    if (isFirstTime) {
      // إذا كان أول مرة، نضع is_first_time = false ونظهر Onboarding
      await StorageService.setFirstTime(false);
      return const OnboardingScreen();
    }

    // التحقق من تسجيل الدخول
    final isLoggedIn =
        (StorageService.getToken() != null &&
            StorageService.getToken()!.isNotEmpty) &&
        StorageService.getUserData() != null;

    if (!isLoggedIn) {
      return const AuthScreen();
    }

    // التحقق من إكمال Onboarding
    final onboardingCompleted =
        StorageService.getBool('onboarding_completed') ?? false;

    if (!onboardingCompleted) {
      return const OnboardingScreen();
    }

    return const HomeScreenWithDrawer();
  }

  @override
  Widget build(BuildContext context) {
    debugRepaintRainbowEnabled = false;
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: AppProviders.providers,
          child: BlocBuilder<LocalizationCubit, LocalizationState>(
            builder: (context, localizationState) {
              return AppExitHandler(
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Invotek',
                  theme: AppTheme.lightTheme,

                  locale: localizationState.locale,
                  supportedLocales: const [Locale('en'), Locale('ar')],
                  localizationsDelegates: [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  home: FutureBuilder<Widget>(
                    future: _getInitialScreen(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Scaffold(
                          body: Center(child: CircularProgressIndicator()),
                        );
                      }

                      return snapshot.data ?? const AuthScreen();
                    },
                  ),
                  routes: AppRoutes.routes,
                  onGenerateRoute: AppRoutes.onGenerateRoute,
                  onUnknownRoute: AppRoutes.onUnknownRoute,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
