import 'package:flutter/material.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/generated/l10n.dart';

class OnboardingPage {
  final String titleKey;
  final String descriptionKey;
  final String imagePath;
  final Color textColor;

  const OnboardingPage({
    required this.titleKey,
    required this.descriptionKey,
    required this.imagePath,
    required this.textColor,
  });

  String getTitle(S s) {
    switch (titleKey) {
      case 'One':
        return s.onboardingOne;
      case 'Two':
        return s.onboardingTwo;
      case 'Three':
        return s.onboardingThree;
      default:
        return titleKey;
    }
  }

  String getDescription(S s) {
    switch (descriptionKey) {
      case 'One':
        return s.onboardingOneDec;
      case 'Two':
        return s.onboardingTwoDec;
      case 'Three':
        return s.onboardingThreeDec;
      default:
        return descriptionKey;
    }
  }
}

class OnboardingData {
  static List<OnboardingPage> getPages() {
    return [
      OnboardingPage(
        titleKey: 'One',
        descriptionKey: 'One',
        imagePath: AppImages.onboardingOne,
        textColor: Colors.black,
      ),
      const OnboardingPage(
        titleKey: 'Two',
        descriptionKey: 'Two',
        imagePath: AppImages.onboardingTwo,
        textColor: Colors.black,
      ),
      const OnboardingPage(
        titleKey: 'Three',
        descriptionKey: 'Three',
        imagePath: AppImages.onboardingThree,
        textColor: Colors.black,
      ),
    ];
  }
}
