import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/services/storage_service.dart';
import 'package:invotek/features/onboarding/data/models/onboarding_page.dart';

class OnboardingState {
  final int currentPage;
  final bool isCompleted;
  final String? error;

  OnboardingState({this.currentPage = 0, this.isCompleted = false, this.error});

  OnboardingState copyWith({
    int? currentPage,
    bool? isCompleted,
    String? error,
  }) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      isCompleted: isCompleted ?? this.isCompleted,
      error: error ?? this.error,
    );
  }

  factory OnboardingState.initial() => OnboardingState();
}

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.initial());

  final PageController pageController = PageController();
  final List<OnboardingPage> pages = OnboardingData.getPages();

  void nextPage() {
    if (state.currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(state.copyWith(currentPage: state.currentPage + 1));
    }
  }

  void previousPage() {
    if (state.currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(state.copyWith(currentPage: state.currentPage - 1));
    }
  }

  void goToPage(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    emit(state.copyWith(currentPage: pageIndex));
  }

  Future<void> completeOnboarding() async {
    try {
      await StorageService.saveBool('onboarding_completed', true);
      emit(state.copyWith(isCompleted: true));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<bool> isOnboardingCompleted() async {
    try {
      return StorageService.getBool('onboarding_completed') ?? false;
    } catch (e) {
      return false;
    }
  }

  // دالة لإعادة تعيين Onboarding (للاختبار)
  Future<void> resetOnboarding() async {
    try {
      await StorageService.setFirstTime(true);
      await StorageService.removeBool('onboarding_completed');
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
