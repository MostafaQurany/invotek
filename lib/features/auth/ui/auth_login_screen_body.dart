import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/core/utils/screen_utils.dart';
import 'package:invotek/core/widgets/loading_widget.dart';
import 'package:invotek/features/auth/data/models/login_request.dart';
import 'package:invotek/features/auth/demo/cubit/auth_cubit.dart';
import 'package:invotek/features/auth/ui/widgets/email_auth_text_field.dart';
import 'package:invotek/features/auth/ui/widgets/password_auth_text_field.dart';

import '../../../generated/l10n.dart';

class AuthLoginScreenBody extends StatefulWidget {
  const AuthLoginScreenBody({super.key});

  @override
  State<AuthLoginScreenBody> createState() => _AuthLoginScreenBodyState();
}

class _AuthLoginScreenBodyState extends State<AuthLoginScreenBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      final request = LoginRequest(
        email: _emailController.text,
        password: _passwordController.text,
      );
      context.read<AuthCubit>().login(request, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                successLogin: (userModel) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(S.of(context).loginSuccess),
                      backgroundColor: colorScheme.primary,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                errorAuth: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error),
                      backgroundColor: colorScheme.error,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                orElse: () {},
              );
            },
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: ScreenUtils.paddingLarge),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          image: AssetImage(AppImages.logoGreen),
                          width: ScreenUtils.responsiveWidthPercent(45),
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child:
                              BlocBuilder<LocalizationCubit, LocalizationState>(
                                builder: (context, state) {
                                  return TextButton(
                                    child: Text(
                                      state.locale.languageCode == 'ar'
                                          ? 'English'
                                          : 'العربية',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize:
                                                ScreenUtils.fontSizeMedium,
                                          ),
                                    ),
                                    onPressed: () {
                                      if (state.locale.languageCode == 'ar') {
                                        context
                                            .read<LocalizationCubit>()
                                            .changeLanguageToEnglish();
                                      } else {
                                        context
                                            .read<LocalizationCubit>()
                                            .changeLanguageToArabic();
                                      }
                                    },
                                  );
                                },
                              ),
                        ),
                      ],
                    ),

                    SizedBox(height: ScreenUtils.paddingXLarge),
                    Text(
                      S.of(context).signIn,
                      style: textTheme.headlineMedium?.copyWith(
                        fontSize: ScreenUtils.fontSizeTitle,
                      ),
                    ),
                    SizedBox(height: ScreenUtils.paddingMedium),
                    Text(
                      S.of(context).email,
                      style: textTheme.titleSmall!.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    SizedBox(height: ScreenUtils.paddingSmall),

                    EmailAuthTextField(controller: _emailController),

                    SizedBox(height: ScreenUtils.paddingMedium),
                    Text(
                      S.of(context).password,
                      style: textTheme.titleSmall!.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontSize: ScreenUtils.fontSizeMedium,
                      ),
                    ),
                    SizedBox(height: ScreenUtils.paddingSmall),

                    PasswordAuthTextField(controller: _passwordController),

                    SizedBox(height: ScreenUtils.paddingLarge),
                    // Sign in
                    SizedBox(
                      width: ScreenUtils.screenWidth,
                      child: BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return LoadingButton(
                            text: S.of(context).signIn,
                            onPressed: _handleLogin,
                            isLoading: state.maybeWhen(
                              loadingAuth: () => true,
                              orElse: () => false,
                            ),
                            backgroundColor: colorScheme.primary,
                            textColor: colorScheme.onPrimary,
                            indicatorColor: colorScheme.onPrimary,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: ScreenUtils.paddingMedium),
                    OrDivider(),
                    SizedBox(height: ScreenUtils.paddingMedium),

                    // google Sign in
                    SignInWithGoogle(),

                    SizedBox(height: ScreenUtils.paddingMedium),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).notAMember,
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(
                                color: colorScheme.onSurfaceVariant,
                                fontSize: ScreenUtils.fontSizeMedium,
                              ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: colorScheme.primary,
                          ),
                          onPressed: () {
                            // Navigate to register screen
                            context.read<AuthCubit>().navigateTo();
                          },
                          child: Text(
                            S.of(context).createAnAccount,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  decoration: TextDecoration.underline,
                                  fontSize: ScreenUtils.fontSizeMedium,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(child: Divider(thickness: 0.5, color: colorScheme.outline)),
        SizedBox(width: 20.w),
        Text("Or"),
        SizedBox(width: 20.w),
        Expanded(child: Divider(thickness: 0.5, color: colorScheme.outline)),
      ],
    );
  }
}

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(AppImages.googleIcon), width: 20.w),
          SizedBox(width: 20.w),
          Text(
            S.of(context).signInWithGoogle,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
