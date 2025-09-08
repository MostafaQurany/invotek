import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invotek/core/widgets/exit_confirmation_dialog.dart';

class AppExitHandler extends StatelessWidget {
  final Widget child;

  const AppExitHandler({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        print('didPop: $didPop');
        if (!didPop) {
          final shouldExit = await ExitConfirmationDialog.show(context);
          if (shouldExit == true) {
            SystemNavigator.pop();
          }
        }
      },
      child: child,
    );
  }
}
