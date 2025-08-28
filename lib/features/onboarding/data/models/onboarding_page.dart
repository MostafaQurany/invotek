import 'package:flutter/material.dart';
import 'package:invotek/generated/l10n.dart';

class OnboardingPage {
  final String titleKey;
  final String descriptionKey;
  final String imagePath;
  final Color backgroundColor;
  final Color textColor;

  const OnboardingPage({
    required this.titleKey,
    required this.descriptionKey,
    required this.imagePath,
    required this.backgroundColor,
    required this.textColor,
  });

  String getTitle(S s) {
    switch (titleKey) {
      case 'welcome':
        return s.onboardingWelcome;
      case 'users':
        return s.onboardingUsers;
      case 'clients':
        return s.onboardingClients;
      case 'expenses':
        return s.onboardingExpenses;
      case 'invoices':
        return s.onboardingInvoices;
      default:
        return titleKey;
    }
  }

  String getDescription(S s) {
    switch (descriptionKey) {
      case 'welcome':
        return s.onboardingWelcomeDesc;
      case 'users':
        return s.onboardingUsersDesc;
      case 'clients':
        return s.onboardingClientsDesc;
      case 'expenses':
        return s.onboardingExpensesDesc;
      case 'invoices':
        return s.onboardingInvoicesDesc;
      default:
        return descriptionKey;
    }
  }
}

class OnboardingData {
  static List<OnboardingPage> getPages() {
    return [
      const OnboardingPage(
        titleKey: 'welcome',
        descriptionKey: 'welcome',
        imagePath: 'assets/images/logo_green.png',
        backgroundColor: Color(0xFF4CAF50),
        textColor: Colors.white,
      ),
      const OnboardingPage(
        titleKey: 'users',
        descriptionKey: 'users',
        imagePath: 'assets/icons/personal_icon.png',
        backgroundColor: Color(0xFF2196F3),
        textColor: Colors.white,
      ),
      const OnboardingPage(
        titleKey: 'clients',
        descriptionKey: 'clients',
        imagePath: 'assets/icons/invoice_money_icon.png',
        backgroundColor: Color(0xFF9C27B0),
        textColor: Colors.white,
      ),
      const OnboardingPage(
        titleKey: 'expenses',
        descriptionKey: 'expenses',
        imagePath: 'assets/icons/invoice_money_icon.png',
        backgroundColor: Color(0xFFFF9800),
        textColor: Colors.white,
      ),
      const OnboardingPage(
        titleKey: 'invoices',
        descriptionKey: 'invoices',
        imagePath: 'assets/icons/invoice_with_checked_icon.png',
        backgroundColor: Color(0xFFF44336),
        textColor: Colors.white,
      ),
    ];
  }
}
