import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/di/init_dependencies_map.dart';
import 'package:invotek/core/widgets/loading_widgets.dart';
import 'package:invotek/features/auth/data/models/login_request.dart';
import 'package:invotek/features/auth/data/models/register_request.dart';
import 'package:invotek/features/auth/domain/cubit/auth_cubit.dart';
import 'package:invotek/features/auth/ui/widgets/auth_screen_header.dart';
import 'package:invotek/features/auth/ui/widgets/confirm_password_text_field.dart';
import 'package:invotek/features/auth/ui/widgets/email_auth_text_field.dart';
import 'package:invotek/features/auth/ui/widgets/name_auth_text_field.dart';
import 'package:invotek/features/auth/ui/widgets/password_auth_text_field.dart';
import 'package:invotek/features/home/ui/home_screen.dart';

import '../../../generated/l10n.dart';

class AuthDraffScreen extends StatefulWidget {
  const AuthDraffScreen({super.key});

  @override
  State<AuthDraffScreen> createState() => _AuthDraffScreenState();
}

class _AuthDraffScreenState extends State<AuthDraffScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoginScreen = true;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  void _handleAuth(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isExpanded = true);
      await Future.delayed(const Duration(milliseconds: 800));
      await Future.delayed(const Duration(milliseconds: 500));

      final cubit = context.read<AuthCubit>();
      if (_isLoginScreen) {
        cubit.login(
          LoginRequest(
            email: _emailController.text,
            password: _passwordController.text,
          ),
          context,
        );
      } else {
        cubit.register(
          RegisterRequest(
            name: _nameController.text,
            email: _emailController.text,
            password: _passwordController.text,
            confirmPassword: _confirmPasswordController.text,
          ),
          context,
        );
      }
    }
  }

  // ----------- Animated Field Builder with Fade + Slide -----------
  Widget _buildAnimatedField({
    required bool visible,
    required Widget child,
    required String keyName,
    bool slideFromRight = true,
    int milliseconds = 400,
  }) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: milliseconds),
      switchInCurve: Curves.linearToEaseOut,
      switchOutCurve: Curves.linearToEaseOut,
      transitionBuilder: (child, animation) {
        final slide = Tween<Offset>(
          begin: Offset(slideFromRight ? 1 : -1, 0),
          end: Offset.zero,
        ).animate(animation);
        final fade = CurvedAnimation(parent: animation, curve: Curves.easeIn);
        return FadeTransition(
          opacity: fade,
          child: SlideTransition(position: slide, child: child),
        );
      },
      child: visible
          ? Container(key: ValueKey(keyName), child: child)
          : SizedBox(key: ValueKey("empty_$keyName"), height: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => getIt<AuthCubit>(),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            successLogin: (response) {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const HomeScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                        final offsetAnimation =
                            Tween<Offset>(
                              begin: const Offset(0.0, 1.0),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOut,
                              ),
                            );
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                ),
              );
            },
            successRegister: (response) {
              setState(() {
                _isLoginScreen = true;
                _isExpanded = false;
              });
            },
            errorAuth: (error) {
              setState(() => _isExpanded = false);
            },
            orElse: () {},
          );
        },
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return LoadingWidgets.overlayLoading(
              isLoading: state.maybeWhen(
                loadingAuth: () => true,
                orElse: () => false,
              ),
              message: S.of(context).loading,
              child: Scaffold(
                backgroundColor: colorScheme.surface,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AuthScreenHeader(isExpanded: _isExpanded),
                        const SizedBox(height: 32),
                        if (!_isExpanded)
                          Form(
                            key: _formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  // Name (Register Only)
                                  _buildAnimatedField(
                                    visible: !_isLoginScreen,
                                    child: NameAuthTextField(
                                      controller: _nameController,
                                    ),
                                    keyName: 'name_field',
                                    slideFromRight: true,
                                  ),
                                  if (!_isLoginScreen)
                                    const SizedBox(height: 16),
                                  // Email
                                  _buildAnimatedField(
                                    visible: true,
                                    child: EmailAuthTextField(
                                      controller: _emailController,
                                    ),
                                    keyName: _isLoginScreen
                                        ? 'login_email'
                                        : 'register_email',
                                    slideFromRight: !_isLoginScreen,
                                  ),
                                  const SizedBox(height: 16),
                                  // Password
                                  _buildAnimatedField(
                                    visible: true,
                                    child: PasswordAuthTextField(
                                      controller: _passwordController,
                                    ),
                                    keyName: _isLoginScreen
                                        ? 'login_pass'
                                        : 'register_pass',
                                    slideFromRight: !_isLoginScreen,
                                  ),
                                  const SizedBox(height: 16),
                                  // Confirm Password (Register Only)
                                  _buildAnimatedField(
                                    visible: !_isLoginScreen,
                                    child: ConfirmPasswordTextField(
                                      controller: _confirmPasswordController,
                                      passwordController: _passwordController,
                                    ),
                                    keyName: 'confirm_field',
                                    slideFromRight: true,
                                  ),
                                  if (!_isLoginScreen)
                                    const SizedBox(height: 16),
                                  // زر الدخول/التسجيل
                                  SizedBox(
                                    width: double.infinity,
                                    child: FilledButton(
                                      onPressed: state.maybeWhen(
                                        loadingAuth: () => null,
                                        orElse: () =>
                                            () => _handleAuth(context),
                                      ),
                                      style: FilledButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                      child: state.maybeWhen(
                                        loadingAuth: () =>
                                            LoadingWidgets.buttonLoading(
                                              text: _isLoginScreen
                                                  ? S
                                                        .of(context)
                                                        .rejesterLoading
                                                  : S.of(context).loginLoadin,
                                            ),
                                        orElse: () => Text(
                                          _isLoginScreen
                                              ? S.of(context).login
                                              : S.of(context).rejester,
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  // زر التحويل بين الشاشتين
                                  TextButton(
                                    onPressed: state.maybeWhen(
                                      loadingAuth: () => null,
                                      orElse: () {
                                        return () {
                                          setState(() {
                                            _isLoginScreen = !_isLoginScreen;
                                            // Clear fields on toggle
                                            if (_isLoginScreen) {
                                              _nameController.clear();
                                              _confirmPasswordController
                                                  .clear();
                                            }
                                          });
                                        };
                                      },
                                    ),
                                    child: Text(
                                      _isLoginScreen
                                          ? S.of(context).noHaveAccountRejester
                                          : S.of(context).haveAccountLogin,
                                      style: TextStyle(
                                        color: colorScheme.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
