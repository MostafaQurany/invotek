import 'package:flutter/material.dart';
import 'package:invotek/generated/l10n.dart';

class MenuItem {
  final String title;
  final String titleKey;
  final IconData icon;
  final String route;
  final bool isSelected;
  final Color? color;

  const MenuItem({
    required this.title,
    required this.titleKey,
    required this.icon,
    required this.route,
    this.isSelected = false,
    this.color,
  });

  MenuItem copyWith({
    String? title,
    String? titleKey,
    IconData? icon,
    String? route,
    bool? isSelected,
    Color? color,
  }) {
    return MenuItem(
      title: title ?? this.title,
      titleKey: titleKey ?? this.titleKey,
      icon: icon ?? this.icon,
      route: route ?? this.route,
      isSelected: isSelected ?? this.isSelected,
      color: color ?? this.color,
    );
  }

  String getLocalizedTitle(S s) {
    switch (titleKey) {
      case 'home':
        return 'الرئيسية';
      case 'users_permissions':
        return s.usersPermissionsTitle;
      case 'clients_products':
        return s.clientsProductsTitle;
      case 'expenses':
        return s.expensesTitle;
      case 'tax_invoices':
        return s.taxInvoicesTitle;
      case 'reports':
        return 'التقارير';
      case 'settings':
        return 'الإعدادات';
      default:
        return title;
    }
  }
}

class MenuData {
  static List<MenuItem> getMenuItems() {
    return [
      MenuItem(
        title: 'الرئيسية',
        titleKey: 'home',
        icon: Icons.home,
        route: '/home',
        isSelected: true,
      ),
      MenuItem(
        title: 'المستخدمين والصلاحيات',
        titleKey: 'users_permissions',
        icon: Icons.people,
        route: '/users',
      ),
      MenuItem(
        title: 'العملاء والمنتجات',
        titleKey: 'clients_products',
        icon: Icons.inventory,
        route: '/clients',
      ),
      MenuItem(
        title: 'المصروفات',
        titleKey: 'expenses',
        icon: Icons.account_balance_wallet,
        route: '/expenses',
      ),
      MenuItem(
        title: 'الفواتير الضريبية',
        titleKey: 'tax_invoices',
        icon: Icons.receipt_long,
        route: '/invoices',
      ),
      MenuItem(
        title: 'التقارير',
        titleKey: 'reports',
        icon: Icons.analytics,
        route: '/reports',
      ),
      MenuItem(
        title: 'الإعدادات',
        titleKey: 'settings',
        icon: Icons.settings,
        route: '/settings',
      ),
    ];
  }
}
