import 'package:flutter/material.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/generated/l10n.dart';

class MenuItem {
  final String title;
  final String titleKey;
  final IconData icon;
  final String route;
  final bool isSelected;
  final Color? color;
  final bool hasSubItems;
  final List<MenuItem> subItems;
  final String? permissionKey;

  const MenuItem({
    required this.title,
    required this.titleKey,
    required this.icon,
    required this.route,
    this.isSelected = false,
    this.color,
    this.hasSubItems = false,
    this.subItems = const [],
    this.permissionKey,
  });

  MenuItem copyWith({
    String? title,
    String? titleKey,
    IconData? icon,
    String? route,
    bool? isSelected,
    Color? color,
    bool? hasSubItems,
    List<MenuItem>? subItems,
    String? permissionKey,
  }) {
    return MenuItem(
      title: title ?? this.title,
      titleKey: titleKey ?? this.titleKey,
      icon: icon ?? this.icon,
      route: route ?? this.route,
      isSelected: isSelected ?? this.isSelected,
      color: color ?? this.color,
      hasSubItems: hasSubItems ?? this.hasSubItems,
      subItems: subItems ?? this.subItems,
      permissionKey: permissionKey ?? this.permissionKey,
    );
  }

  String getLocalizedTitle(S s) {
    switch (titleKey) {
      case 'home':
        return s.home;
      case 'users_permissions':
        return s.usersPermissionsTitle;
      case 'users_list':
        return s.usersList;
      case 'manage_permissions':
        return s.managePermissions;
      case 'customers':
        return s.customersManagement;
      case 'products_categories':
        return s.productsCategoriesManagement;
      case 'product_categories':
        return s.productCategories;
      case 'products_list':
        return s.productsList;
      case 'expenses':
        return s.expensesManagement;
      case 'expenses_list':
        return s.expensesList;
      case 'expense_categories':
        return s.expenseCategories;
      case 'tax_invoices':
        return s.taxInvoices;
      case 'invoices_list':
        return s.invoicesList;
      case 'returned_invoices':
        return s.returnedInvoices;
      case 'settings':
        return s.settings;
      case 'company_settings':
        return s.companySettings;
      case 'system_settings':
        return s.systemSettings;
      case 'backup':
        return s.backup;
      case 'credit_invoices':
        return s.creditInvoicesTitle;
      default:
        return title;
    }
  }
}

class MenuData {
  static double index = 0;

  static List<MenuItem> getMenuItems() {
    return [
      MenuItem(
        title: 'الرئيسية',
        titleKey: 'home',
        icon: Icons.home,
        route: AppRoutes.homeRoute,
        isSelected: index == 0,
        permissionKey: 'dashboard.view',
      ),
      MenuItem(
        title: 'إدارة المستخدمين والصلاحيات',
        titleKey: 'users_permissions',
        icon: Icons.people,
        route: AppRoutes.usersListRoute,
        hasSubItems: false,
        isSelected: index == 1,
        permissionKey: 'users.view',
        // subItems: [
        //   MenuItem(
        //     title: 'قائمة المستخدمين',
        //     titleKey: 'users_list',
        //     icon: Icons.list,
        //     route: AppRoutes.usersListRoute,
        //     isSelected: index == 1.1,
        //     permissionKey: 'users.view',
        //   ),
        //
        //   MenuItem(
        //     title: 'إدارة الصلاحيات',
        //     titleKey: 'manage_permissions',
        //     icon: Icons.security,
        //     route: AppRoutes.managePermissionsRoute,
        //     isSelected: index == 1.2,
        //     permissionKey: 'roles.view',
        //   ),
        // ],
      ),

      MenuItem(
        title: 'إدارة العملاء',
        titleKey: 'customers',
        icon: Icons.people_outline,
        route: AppRoutes.customersListRoute,
        hasSubItems: false,
        isSelected: index == 2,
        permissionKey: 'customers.view',
      ),
      MenuItem(
        title: 'إدارة المنتجات وفئاتها',
        titleKey: 'products_categories',
        icon: Icons.inventory,
        route: '/products',
        hasSubItems: true,
        isSelected: index == 3,
        permissionKey: 'products.view',
        subItems: [
          MenuItem(
            title: 'قائمة المنتجات',
            titleKey: 'products_list',
            icon: Icons.list,
            route: AppRoutes.productsListRoute,
            isSelected: index == 3.1,
            permissionKey: 'products.view',
          ),
          // categories
          MenuItem(
            title: 'فئات المنتجات',
            titleKey: 'product_categories',
            icon: Icons.category,
            route: AppRoutes.categoriesListRoute,
            isSelected: index == 3.2,
            permissionKey: 'product-categories.view',
          ),
        ],
      ),
      MenuItem(
        title: 'إدارة المصروفات وفئاتها',
        titleKey: 'expenses',
        icon: Icons.account_balance_wallet,
        route: '/expenses',
        hasSubItems: true,
        isSelected: index == 4,
        permissionKey: 'expenses.view',
        subItems: [
          MenuItem(
            title: 'قائمة المصروفات',
            titleKey: 'expenses_list',
            icon: Icons.list,
            route: AppRoutes.expensesListRoute,
            isSelected: index == 4.1,
            permissionKey: 'expenses.view',
          ),
          MenuItem(
            title: 'فئات المصروفات',
            titleKey: 'expense_categories',
            icon: Icons.category,
            route: AppRoutes.expenseCategoriesListRoute,
            isSelected: index == 4.2,
            permissionKey: 'expense-categories.view',
          ),
        ],
      ),
      MenuItem(
        title: 'الفواتير الضريبية',
        titleKey: 'tax_invoices',
        icon: Icons.receipt_long,
        route: '/invoices',
        hasSubItems: true,
        isSelected: index == 5,
        permissionKey: 'tax-invoices.view',
        subItems: [
          MenuItem(
            title: 'قائمة الفواتير',
            titleKey: 'invoices_list',
            icon: Icons.list,
            route: AppRoutes.invoicesListRoute,
            isSelected: index == 5.1,
            permissionKey: 'tax-invoices.view',
          ),
          MenuItem(
            title: 'الفواتير الآجلة',
            titleKey: 'credit_invoices',
            icon: Icons.receipt_long,
            route: AppRoutes.creditInvoicesListRoute,
            isSelected: index == 5.2,
            permissionKey: 'tax-invoices.view',
          ),
        ],
      ),
      MenuItem(
        title: 'الإعدادات',
        titleKey: 'settings',
        icon: Icons.settings,
        route: AppRoutes.settingsRoute,
        hasSubItems: false,
        permissionKey: 'dashboard.settings',
      ),
    ];
  }
}
