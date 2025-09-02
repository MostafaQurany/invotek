import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/features/onboarding/demo/cubit/onboarding_cubit.dart';
import 'package:invotek/features/onboarding/ui/widgets/onboarding_page_widget.dart';
import 'package:invotek/features/onboarding/ui/widgets/onboarding_indicators.dart';
import 'package:invotek/features/onboarding/ui/widgets/onboarding_buttons.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state.isCompleted) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.homeRoute,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();

          return Scaffold(
            backgroundColor: colorScheme.surface,
            body: SafeArea(
              child: Column(
                children: [
                  // PageView for pages
                  Expanded(
                    child: PageView.builder(
                      controller: cubit.pageController,
                      onPageChanged: (index) {
                        cubit.goToPage(index);
                      },
                      itemCount: cubit.pages.length,
                      itemBuilder: (context, index) {
                        final page = cubit.pages[index];
                        return OnboardingPageWidget(page: page);
                      },
                    ),
                  ),

                  // Page indicators
                  OnboardingIndicators(
                    currentPage: state.currentPage,
                    totalPages: cubit.pages.length,
                  ),

                  SizedBox(height: 20.h),

                  // Navigation buttons
                  OnboardingButtons(
                    currentPage: state.currentPage,
                    totalPages: cubit.pages.length,
                    onNext: cubit.nextPage,
                    onPrevious: cubit.previousPage,
                    onComplete: cubit.completeOnboarding,
                  ),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
