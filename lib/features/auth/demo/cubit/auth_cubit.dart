import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invotek/core/server/api_result.dart';
import 'package:invotek/core/validation/validators.dart';
import 'package:invotek/features/auth/data/models/login_request.dart';
import 'package:invotek/features/auth/data/models/register_request.dart';
import 'package:invotek/features/auth/demo/entit/user_model.dart';
import 'package:invotek/features/auth/demo/repo/auth_repo.dart';
import 'package:invotek/generated/l10n.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo repo;
  AuthCubit(this.repo) : super(AuthState.initial());
  bool isLoginScreen = true;
  Future<void> navigateTo() async {
    isLoginScreen = !isLoginScreen;
    emit(AuthState.changeAuthScreenBody());
  }

  Future<void> login(LoginRequest request, BuildContext context) async {
    // التحقق من صحة البيانات
    final emailError = Validators.validateEmail(request.email);
    final passwordError = Validators.validatePassword(request.password);

    if (emailError != null || passwordError != null) {
      emit(AuthState.errorAuth(S.of(context).validationError));
      return;
    }

    emit(AuthState.loadingAuth());

    try {
      final response = await repo.login(request);
      response.when(
        success: (data) {
          emit(AuthState.successLogin(data));
        },
        failure: (errorHandler) {
          final errorMessage = errorHandler;
          emit(AuthState.errorAuth(errorMessage));
        },
      );
    } catch (e) {
      final errorMessage = e.toString();
      emit(AuthState.errorAuth(errorMessage));
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
      emit(AuthState.errorAuth(S.of(context).validationError));
      return;
    }

    emit(AuthState.loadingAuth());

    try {
      final response = await repo.register(request);
      response.when(
        success: (data) {
          emit(AuthState.successRegister(data));
        },
        failure: (errorHandler) {
          final errorMessage = errorHandler;
          emit(AuthState.errorAuth(errorMessage));
        },
      );
    } catch (e) {
      final errorMessage = e.toString();
      emit(AuthState.errorAuth(errorMessage));
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
      final errorMessage = e.toString();
      emit(AuthState.errorAuth(errorMessage));
    }
  }

  Future<void> logout() async {
    try {
      await repo.logout();
      emit(AuthState.successLogout());
    } catch (e) {
      final errorMessage = e.toString();
      emit(AuthState.errorAuth(errorMessage));
    }
  }
}
