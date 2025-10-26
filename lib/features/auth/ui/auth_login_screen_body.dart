import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/core/utils/screen_utils.dart';
import 'package:invotek/core/widgets/loading_widget.dart';
import 'package:invotek/features/auth/data/models/login_request.dart';
import 'package:invotek/features/auth/domain/cubit/auth_cubit.dart';
import 'package:invotek/features/auth/ui/widgets/email_auth_text_field.dart';
import 'package:invotek/features/auth/ui/widgets/password_auth_text_field.dart';

import '../../../generated/l10n.dart';
import 'package:invotek/core/utils/snackbar_helper.dart';

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

                    TextButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(AppRoutes.forgetPassword);
                      },
                      child: Text(S.of(context).forgetPassword),
                    ),
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
                    SignInWithGoogle(
                      iosClientId: "",
                      serverClientId:
                          "453415325077-62ac8mt6d3tov4ovsdm3bum127qup82s.apps.googleusercontent.com",
                      onAllData: (accessToken, idToken, user) {
                        print("accessToken: $accessToken");
                        print("idToken: $idToken");
                        print("user: $user");
                        if (idToken.isNotEmpty) {
                          context.read<AuthCubit>().googleLogin(
                            idToken,
                            context,
                          );
                        }
                      },
                    ),

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
        Text(S.of(context).or),
        SizedBox(width: 20.w),
        Expanded(child: Divider(thickness: 0.5, color: colorScheme.outline)),
      ],
    );
  }
}

class SignInWithGoogle extends StatefulWidget {
  final Function(GoogleSignInAccount?)? onSuccess;
  final Function(String)? onError;
  final Function(String accessToken, String idToken, GoogleSignInAccount? user)?
  onAllData;
  final Function(String token)? onAccessToken;
  final Function(String idToken)? onIdToken;
  final String? iosClientId;
  final String? serverClientId;
  final List<String> scopes;
  final bool showText;
  final String? customText;

  const SignInWithGoogle({
    super.key,
    this.onSuccess,
    this.onError,
    this.onAccessToken,
    this.onIdToken,
    this.iosClientId,
    this.serverClientId,
    this.onAllData,
    this.scopes = const [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ],
    this.showText = true,
    this.customText,
  });
  @override
  State<SignInWithGoogle> createState() => _SignInWithGoogleState();
}

class _SignInWithGoogleState extends State<SignInWithGoogle> {
  final GoogleSignIn _signIn = GoogleSignIn.instance;
  GoogleSignInAccount? _user;
  StreamSubscription<GoogleSignInAuthenticationEvent>? _authSub;
  bool _isLoading = false;

  @override
  void dispose() {
    _authSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: colorScheme.onSurface.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _isLoading ? null : _handleGoogleSignIn,
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: _isLoading
                ? Center(
                    child: SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          colorScheme.primary,
                        ),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.googleIcon,
                        width: 24.w,
                        height: 24.h,
                        fit: BoxFit.contain,
                      ),
                      if (widget.showText) ...[
                        SizedBox(width: 12.w),
                        Text(
                          widget.customText ?? 'Sign in with Google',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textAccent,
                          ),
                        ),
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleGoogleSignIn() async {
    final s = S.of(context);
    setState(() => _isLoading = true);

    try {
      await _setupGoogle();

      if (_signIn.supportsAuthenticate()) {
        await _signIn.authenticate();
        await Future.delayed(const Duration(milliseconds: 500));

        if (_user == null) {
          _emitError(s.loginCancelled);
          return;
        }
      }

      if (_user == null) {
        _emitError(s.failedToGetUserData);
        return;
      }

      final existing = await _user!.authorizationClient.authorizationForScopes(
        widget.scopes,
      );

      final accessToken = (existing?.accessToken.isNotEmpty ?? false)
          ? existing!.accessToken
          : (await _user!.authorizationClient.authorizeScopes(
              widget.scopes,
            )).accessToken;

      final auth = _user!.authentication;
      final idToken = auth.idToken;

      widget.onAccessToken?.call(accessToken);
      widget.onIdToken?.call(idToken ?? '');
      widget.onSuccess?.call(_user);
      widget.onAllData?.call(accessToken, idToken ?? '', _user);
    } on GoogleSignInException catch (e) {
      final msg = switch (e.code) {
        GoogleSignInExceptionCode.canceled => s.loginCancelled,
        _ => '${s.googleSignInError}: ${e.description}',
      };
      _emitError(msg);
    } catch (e) {
      final err = e.toString();
      var msg = s.loginError;
      if (err.contains('network_error')) msg = s.networkError;
      if (err.contains('play_services_not_available')) {
        msg = s.playServicesNotAvailable;
      }
      if (err.contains('sign_in_failed')) {
        msg = s.signInFailed;
      }
      _emitError(msg);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _setupGoogle() async {
    await _signIn.initialize(
      clientId: widget.iosClientId,
      serverClientId: widget.serverClientId,
    );

    _authSub = _signIn.authenticationEvents.listen(
      (event) {
        if (event is GoogleSignInAuthenticationEventSignIn) {
          _user = event.user;
        } else if (event is GoogleSignInAuthenticationEventSignOut) {
          _user = null;
        }
      },
      onError: (e) {
        print("Error in Google Auth: ${e.toString()}");
      },
    );
  }

  void _emitError(String message) {
    widget.onError?.call(message);
    print('❌ $message');
  }
}
