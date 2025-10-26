import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/core/validation/validators.dart';
import 'package:invotek/features/auth/data/models/login_request.dart';
import 'package:invotek/features/auth/data/models/register_request.dart';
import 'package:invotek/features/auth/data/models/google_login_request.dart';
import 'package:invotek/features/auth/data/models/forget_password_request.dart';
import 'package:invotek/features/auth/data/models/verify_code_request.dart';
import 'package:invotek/features/auth/data/models/reset_password_request.dart';
import 'package:invotek/features/auth/domain/entit/user_model.dart';
import 'package:invotek/features/auth/domain/repo/auth_repo.dart';
import 'package:invotek/generated/l10n.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repo;
  AuthCubit(this.repo) : super(AuthState.initial());
  bool isLoginScreen = true;

  Future<void> navigateTo() async {
    isLoginScreen = !isLoginScreen;
    emit(AuthState.changeAuthScreenBody(DateTime.now()));
  }

  Future<void> login(LoginRequest request, BuildContext context) async {
    // التحقق من صحة البيانات
    final emailError = Validators.validateEmail(request.email);
    final passwordError = Validators.validatePassword(request.password);

    if (emailError != null || passwordError != null) {
      emit(
        AuthState.errorAuth(
          Failure.validation(message: S.of(context).validationError),
        ),
      );
      return;
    }

    emit(AuthState.loadingAuth());

    try {
      final response = await repo.login(request);
      response.when(
        success: (data) {
          emit(AuthState.successLogin(data));
        },
        failure: (failure) {
          emit(AuthState.errorAuth(failure));
        },
      );
    } catch (e) {
      emit(AuthState.errorAuth(Failure.unknown(message: e.toString())));
    }
  }

  Future<void> register(RegisterRequest request, BuildContext context) async {
    // التحقق من صحة البيانات
    final nameError = Validators.validateName(request.name!);
    final emailError = Validators.validateEmail(request.email!);
    final passwordError = Validators.validatePassword(request.password!);
    final confirmPasswordError = Validators.validateConfirmPassword(
      request.confirmPassword ?? '',
      request.password!,
    );

    if (nameError != null ||
        emailError != null ||
        passwordError != null ||
        confirmPasswordError != null) {
      emit(
        AuthState.errorAuth(
          Failure.validation(message: S.of(context).validationError),
        ),
      );
      return;
    }

    emit(AuthState.loadingAuth());

    try {
      final response = await repo.register(request);
      response.when(
        success: (data) {
          emit(AuthState.successRegister(data));
        },
        failure: (failure) {
          emit(AuthState.errorAuth(failure));
        },
      );
    } catch (e) {
      emit(AuthState.errorAuth(Failure.unknown(message: e.toString())));
    }
  }

  Future<void> checkLoginStatus() async {
    try {
      final isLoggedIn = await repo.isUserLoggedIn();
      if (isLoggedIn) {
        final cachedUser = await repo.getCachedUser();
        if (cachedUser != null) {
          emit(AuthState.successLogin(cachedUser));
        }
      }
    } catch (e) {
      emit(AuthState.errorAuth(Failure.unknown(message: e.toString())));
    }
  }

  Future<void> logout() async {
    try {
      await repo.logout();
      emit(AuthState.successLogout());
    } catch (e) {
      emit(AuthState.errorAuth(Failure.unknown(message: e.toString())));
    }
  }

  Future<void> forgetPassword(String email, BuildContext context) async {
    // التحقق من صحة البريد الإلكتروني
    final emailError = Validators.validateEmail(email);

    if (emailError != null) {
      emit(
        AuthState.errorAuth(
          Failure.validation(message: S.of(context).emailInvalid),
        ),
      );
      return;
    }

    emit(AuthState.loadingAuth());

    try {
      final request = ForgetPasswordRequest(email);
      final response = await repo.forgetPassword(request);
      response.when(
        success: (data) {
          emit(AuthState.successForgetPassword(data.message, email));
        },
        failure: (failure) {
          emit(AuthState.errorAuth(failure));
        },
      );
    } catch (e) {
      emit(AuthState.errorAuth(Failure.unknown(message: e.toString())));
    }
  }

  Future<void> verifyCode(
    String email,
    String code,
    BuildContext context,
  ) async {
    // التحقق من صحة الكود
    if (code.length != 6) {
      emit(
        AuthState.errorAuth(
          Failure.validation(message: S.of(context).validationError),
        ),
      );
      return;
    }

    emit(AuthState.loadingAuth());

    try {
      final request = VerifyCodeRequest(email: email, code: code);
      final response = await repo.verifyCode(request);
      response.when(
        success: (data) {
          emit(AuthState.successVerifyCode(data.data?.verifyToken ?? ''));
        },
        failure: (failure) {
          emit(AuthState.errorAuth(failure));
        },
      );
    } catch (e) {
      emit(AuthState.errorAuth(Failure.unknown(message: e.toString())));
    }
  }

  Future<void> resetPassword(
    String verifyToken,
    String password,
    String confirmPassword,
    BuildContext context,
  ) async {
    // التحقق من صحة كلمة المرور
    final passwordError = Validators.validatePassword(password);
    final confirmPasswordError = Validators.validateConfirmPassword(
      confirmPassword,
      password,
    );

    if (passwordError != null || confirmPasswordError != null) {
      emit(
        AuthState.errorAuth(
          Failure.validation(message: S.of(context).validationError),
        ),
      );
      return;
    }

    emit(AuthState.loadingAuth());

    try {
      final request = ResetPasswordRequest(
        verifyToken: verifyToken,
        password: password,
        passwordConfirmation: confirmPassword,
      );
      final response = await repo.resetPassword(request);
      response.when(
        success: (data) {
          emit(AuthState.successResetPassword(data.message));
        },
        failure: (failure) {
          emit(AuthState.errorAuth(failure));
        },
      );
    } catch (e) {
      emit(AuthState.errorAuth(Failure.unknown(message: e.toString())));
    }
  }

  Future<void> googleLogin(String idToken, BuildContext context) async {
    emit(AuthState.loadingAuth());

    try {
      final request = GoogleLoginRequest(idToken: idToken);
      final response = await repo.googleLogin(request);
      response.when(
        success: (data) {
          emit(AuthState.successLogin(data));
        },
        failure: (failure) {
          emit(AuthState.errorAuth(failure));
        },
      );
    } catch (e) {
      emit(AuthState.errorAuth(Failure.unknown(message: e.toString())));
    }
  }
}
