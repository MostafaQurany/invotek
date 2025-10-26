import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/core/utils/screen_utils.dart';
import 'package:invotek/core/widgets/loading_widget.dart';
import 'package:invotek/features/auth/domain/cubit/auth_cubit.dart';
import 'package:invotek/features/auth/ui/widgets/email_auth_text_field.dart';

import 'package:invotek/core/utils/snackbar_helper.dart';
import 'package:invotek/generated/l10n.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSendCode() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().forgetPassword(_emailController.text, context);
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
                successForgetPassword: (message, email) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: colorScheme.primary,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  // التنقل إلى شاشة التحقق من الكود
                  Navigator.pushNamed(
                    context,
                    AppRoutes.verifyOtp,
                    arguments: email,
                  );
                },
                errorAuth: (error) {
                  SnackBarHelper.showFailureSnackBar(context, error);
                },
                orElse: () {},
              );
            },
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 15.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: colorScheme.onSurface,
                          size: 24.sp,
                        ),
                      ),
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
                                BlocBuilder<
                                  LocalizationCubit,
                                  LocalizationState
                                >(
                                  builder: (context, state) {
                                    return TextButton(
                                      child: Text(
                                        state.locale.languageCode == 'ar'
                                            ? S.of(context).english
                                            : S.of(context).arabic,
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
                        S.of(context).forgetPasswordTitle,
                        style: textTheme.headlineMedium?.copyWith(
                          fontSize: ScreenUtils.fontSizeTitle,
                        ),
                      ),
                      SizedBox(height: ScreenUtils.paddingMedium),
                      Text(
                        S.of(context).forgetPasswordDesc,
                        style: textTheme.titleSmall!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(height: ScreenUtils.paddingSmall),

                      EmailAuthTextField(controller: _emailController),

                      SizedBox(height: 60.h),

                      // Send Code Button
                      SizedBox(
                        width: ScreenUtils.screenWidth,
                        child: BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            return LoadingButton(
                              text: S.of(context).sendVerificationCode,
                              onPressed: _handleSendCode,
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

                      // Back to Login
                      Center(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            S.of(context).backToLoginScreen,
                            style: textTheme.titleMedium?.copyWith(
                              color: colorScheme.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
