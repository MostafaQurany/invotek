import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/core/utils/screen_utils.dart';
import 'package:invotek/core/widgets/loading_widget.dart';
import 'package:invotek/features/auth/data/models/register_request.dart';
import 'package:invotek/features/auth/domain/cubit/auth_cubit.dart';
import 'package:invotek/features/auth/ui/widgets/confirm_password_text_field.dart';
import 'package:invotek/features/auth/ui/widgets/email_auth_text_field.dart';
import 'package:invotek/features/auth/ui/widgets/name_auth_text_field.dart';
import 'package:invotek/features/auth/ui/widgets/password_auth_text_field.dart';

import 'package:invotek/core/utils/snackbar_helper.dart';
import 'package:invotek/generated/l10n.dart';

class AuthRegisterScreenBody extends StatefulWidget {
  const AuthRegisterScreenBody({super.key});

  @override
  State<AuthRegisterScreenBody> createState() => _AuthRegisterScreenBodyState();
}

class _AuthRegisterScreenBodyState extends State<AuthRegisterScreenBody> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      final request = RegisterRequest(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      );
      context.read<AuthCubit>().register(request, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          successRegister: (userModel) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S.of(context).registerSuccess),
                backgroundColor: colorScheme.primary,
                behavior: SnackBarBehavior.floating,
              ),
            );
            // الـ listener في auth_screen سيتعامل مع التنقل للشاشة الرئيسية
          },
          errorRegister: (error) {
            SnackBarHelper.showFailureSnackBar(context, error);
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
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(image: AssetImage(AppImages.logoGreen), width: 0.45.sw),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: BlocBuilder<LocalizationCubit, LocalizationState>(
                      builder: (context, state) {
                        return TextButton(
                          child: Text(
                            state.locale.languageCode == 'ar'
                                ? S.of(context).english
                                : S.of(context).arabic,
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(
                                  decoration: TextDecoration.underline,
                                  fontSize: ScreenUtils.fontSizeMedium,
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

              SizedBox(height: 40.h),
              Text(S.of(context).register, style: textTheme.headlineMedium),
              SizedBox(height: 20.h),
              Text(
                S.of(context).fullName,
                style: textTheme.titleSmall!.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 5.h),

              NameAuthTextField(controller: _nameController),
              SizedBox(height: 20.h),
              Text(
                S.of(context).email,
                style: textTheme.titleSmall!.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 5.h),

              EmailAuthTextField(controller: _emailController),

              SizedBox(height: 20.h),
              Text(
                S.of(context).password,
                style: textTheme.titleSmall!.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 5.h),

              PasswordAuthTextField(controller: _passwordController),

              SizedBox(height: 20.h),
              Text(
                S.of(context).confirmPassword,
                style: textTheme.titleSmall!.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              SizedBox(height: 5.h),

              ConfirmPasswordTextField(
                controller: _confirmPasswordController,
                passwordController: _passwordController,
              ),

              SizedBox(height: 35.h),
              // Register
              SizedBox(
                width: 1.sw,
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return LoadingButton(
                      text: S.of(context).register,
                      onPressed: _handleRegister,
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
              SizedBox(height: 10.h),
              OrDivider(),
              SizedBox(height: 10.h),

              // google Sign in
              SignInWithGoogle(),

              SizedBox(height: 10.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).alreadyHaveAnAccount,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: colorScheme.primary,
                    ),
                    onPressed: () {
                      context.read<AuthCubit>().navigateTo();
                    },
                    child: Text(
                      S.of(context).login,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
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
        Text(S.of(context).or),
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
