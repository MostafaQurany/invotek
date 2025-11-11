import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/widgets/exit_confirmation_dialog.dart';

class AppExitHandler extends StatelessWidget {
  final Widget child;
  final bool enabled;

  const AppExitHandler({super.key, required this.child, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return child;
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          // الحصول على اسم الـ route الحالي
          final currentRoute = ModalRoute.of(context)?.settings.name;

          // استثناء Onboarding - السماح بالعودة العادية
          if (currentRoute == AppRoutes.onboardingRoute) {
            Navigator.of(context).pop();
            return;
          }

          // التحقق من إمكانية العودة للشاشة السابقة
          final canPop = Navigator.of(context).canPop();

          if (canPop) {
            // إذا كان يمكن pop، نسمح بالعودة العادية
            Navigator.of(context).pop();
          } else {
            // إذا لم يكن يمكن pop (آخر شاشة)، نعرض dialog التأكيد
            final shouldExit = await ExitConfirmationDialog.show(context);
            if (shouldExit == true) {
              SystemNavigator.pop();
            }
          }
        }
      },
      child: child,
    );
  }
}
