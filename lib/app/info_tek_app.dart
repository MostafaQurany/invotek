import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/routes/app_router.dart';
import 'package:invotek/core/theme/app_theme.dart';
import 'package:invotek/generated/l10n.dart';

class InfoTekApp extends StatelessWidget {
  const InfoTekApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugRepaintRainbowEnabled = false;
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'InfoTek',
          theme: AppTheme.lightTheme,
          initialRoute: AppRouter.authRoute,
          routes: AppRouter.routes,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        );
      },
    );
  }
}
