import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/features/auth/ui/widgets/auth_screen_header.dart';
import 'package:invotek/features/auth/ui/widgets/auth_text_filed.dart';
import 'package:invotek/features/auth/ui/widgets/confirm_password_text_field.dart';
import 'package:invotek/features/auth/ui/widgets/email_auth_text_field.dart';
import 'package:invotek/features/auth/ui/widgets/name_auth_text_field.dart';
import 'package:invotek/features/auth/ui/widgets/password_auth_text_field.dart';
import 'package:invotek/generated/l10n.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isLoginScreen = true;
  bool animateOut = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AuthScreenHeader(),
                const SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      // Name Field (Always in tree, slide in/out)
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        switchInCurve: Curves.fastEaseInToSlowEaseOut,
                        switchOutCurve: Curves.easeInExpo,
                        transitionBuilder: (child, animation) {
                          final offsetAnimation = Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).animate(animation);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                        child: isLoginScreen
                            ? const SizedBox.shrink(key: ValueKey('empty_name'))
                            : const NameAuthTextField(
                                key: ValueKey('name_field'),
                              ),
                      ),

                      const SizedBox(height: 16),

                      const EmailAuthTextField(),
                      const SizedBox(height: 16),
                      const PasswordAuthTextField(),
                      const SizedBox(height: 16),

                      // Confirm Password Field (Always in tree, slide in/out)
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        switchInCurve: Curves.fastEaseInToSlowEaseOut,
                        switchOutCurve: Curves.easeInExpo,
                        transitionBuilder: (child, animation) {
                          final offsetAnimation = Tween<Offset>(
                            begin: const Offset(1, 0),
                            end: Offset.zero,
                          ).animate(animation);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                        child: isLoginScreen
                            ? const SizedBox.shrink(key: ValueKey('empty_name'))
                            : const ConfirmPasswordTextField(
                                key: ValueKey('ConfirmPasswordTextField'),
                              ),
                      ),

                      const SizedBox(height: 32),

                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.secondary,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: Text(
                            isLoginScreen
                                ? S.of(context).login
                                : S.of(context).register,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Switch between login/register
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isLoginScreen
                  ? S.of(context).dontHaveAnAccount
                  : S.of(context).alreadyHaveAnAccount,
              style: theme.textTheme.bodyLarge,
            ),
            TextButton(
              onPressed: () async {
                setState(() => animateOut = true);
                await Future.delayed(const Duration(milliseconds: 400));
                setState(() {
                  isLoginScreen = !isLoginScreen;
                  animateOut = false;
                });
              },
              child: Text(
                isLoginScreen ? S.of(context).register : S.of(context).login,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
