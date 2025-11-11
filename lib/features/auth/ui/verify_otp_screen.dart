import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/core/utils/screen_utils.dart';
import 'package:invotek/core/widgets/loading_widget.dart';
import 'package:invotek/features/auth/domain/cubit/auth_cubit.dart';
import 'package:pinput/pinput.dart';

import 'package:invotek/core/utils/snackbar_helper.dart';
import 'package:invotek/generated/l10n.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;

  const VerifyOtpScreen({super.key, required this.email});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _pinController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Timer? _timer;
  int _countdown = 60;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  void dispose() {
    _pinController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      }
    });
  }

  void _handleVerifyCode() {
    final code = _pinController.text;
    if (code.length == 6) {
      context.read<AuthCubit>().verifyCode(widget.email, code, context);
    }
  }

  void _handleResendCode() {
    if (_canResend) {
      context.read<AuthCubit>().forgetPassword(widget.email, context);
      setState(() {
        _canResend = false;
        _countdown = 60;
      });
      _startCountdown();
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
                successVerifyCode: (verifyToken) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(S.of(context).verifyCode),
                      backgroundColor: colorScheme.primary,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  // التنقل إلى شاشة إعادة تعيين كلمة المرور
                  Navigator.pushNamed(
                    context,
                    AppRoutes.resetPassword,
                    arguments: verifyToken,
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
                        S.of(context).verifyCodeTitle,
                        style: textTheme.headlineMedium?.copyWith(
                          fontSize: ScreenUtils.fontSizeTitle,
                        ),
                      ),
                      SizedBox(height: ScreenUtils.paddingMedium),
                      Text(
                        S.of(context).verifyCodeDesc(widget.email),
                        style: textTheme.titleSmall!.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(height: ScreenUtils.paddingLarge),

                      // Helper message for email OTP
                      Container(
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: colorScheme.primary.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: colorScheme.primary,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                S.of(context).authCopyCodeFromEmail,
                                style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurface,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: ScreenUtils.paddingLarge),

                      // OTP Input using Pinput
                      Pinput(
                        controller: _pinController,
                        length: 6,
                        defaultPinTheme: PinTheme(
                          width: 50.w,
                          height: 55.h,
                          textStyle: textTheme.headlineMedium?.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: colorScheme.outline),
                            borderRadius: BorderRadius.circular(8.r),
                            color: colorScheme.surface,
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 50.w,
                          height: 55.h,
                          textStyle: textTheme.headlineMedium?.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: colorScheme.primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                            color: colorScheme.surface,
                          ),
                        ),
                        submittedPinTheme: PinTheme(
                          width: 50.w,
                          height: 55.h,
                          textStyle: textTheme.headlineMedium?.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: BoxDecoration(
                            color: colorScheme.primaryContainer,
                            border: Border.all(color: colorScheme.primary),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        errorPinTheme: PinTheme(
                          width: 50.w,
                          height: 55.h,
                          textStyle: textTheme.headlineMedium?.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: colorScheme.error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                            color: colorScheme.surface,
                          ),
                        ),
                        onCompleted: (pin) => _handleVerifyCode(),
                        autofocus: true,
                        closeKeyboardWhenCompleted: false,
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 9.h),
                              width: 22.w,
                              height: 1.h,
                              color: colorScheme.primary,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 40.h),

                      // Verify Button
                      SizedBox(
                        width: ScreenUtils.screenWidth,
                        child: BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            return LoadingButton(
                              text: S.of(context).verifyCode,
                              onPressed: _handleVerifyCode,
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

                      // Resend Code
                      Center(
                        child: _canResend
                            ? TextButton(
                                onPressed: _handleResendCode,
                                child: Text(
                                  S.of(context).resendCode,
                                  style: textTheme.titleMedium?.copyWith(
                                    color: colorScheme.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            : Text(
                                S
                                    .of(context)
                                    .resendCodeIn(_countdown.toString()),
                                style: textTheme.titleSmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                      ),

                      SizedBox(height: ScreenUtils.paddingMedium),

                      // Back to Login
                      Center(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            S.of(context).login,
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
