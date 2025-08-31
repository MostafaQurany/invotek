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

  const MenuItem({
    required this.title,
    required this.titleKey,
    required this.icon,
    required this.route,
    this.isSelected = false,
    this.color,
    this.hasSubItems = false,
    this.subItems = const [],
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
    );
  }

  String getLocalizedTitle(S s) {
    switch (titleKey) {
      case 'home':
        return 'الرئيسية';
      case 'users_permissions':
        return s.usersPermissionsTitle;
      case 'users_list':
        return s.usersList;
      case 'add_user':
        return s.addUser;
      case 'manage_permissions':
        return s.managePermissions;
      case 'clients_products':
        return s.clientsProductsTitle;
      case 'clients_list':
        return s.clientsList;
      case 'add_client':
        return s.addClient;
      case 'manage_products':
        return s.manageProducts;
      case 'product_categories':
        return s.productCategories;
      case 'expenses':
        return s.expensesTitle;
      case 'expenses_list':
        return s.expensesList;
      case 'add_expense':
        return s.addExpense;
      case 'expense_categories':
        return s.expenseCategories;
      case 'tax_invoices':
        return s.taxInvoicesTitle;
      case 'invoices_list':
        return s.invoicesList;
      case 'create_invoice':
        return s.createInvoice;
      case 'posted_invoices':
        return s.postedInvoices;
      case 'returned_invoices':
        return s.returnedInvoices;
      case 'reports':
        return 'التقارير';
      case 'sales_report':
        return s.salesReport;
      case 'expenses_report':
        return s.expensesReport;
      case 'customers_report':
        return s.customersReport;
      case 'products_report':
        return s.productsReport;
      case 'settings':
        return 'الإعدادات';
      case 'company_settings':
        return s.companySettings;
      case 'system_settings':
        return s.systemSettings;
      case 'backup':
        return s.backup;
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
        title: 'إدارة المستخدمين والصلاحيات',
        titleKey: 'users_permissions',
        icon: Icons.people,
        route: AppRoutes.usersPermissionsRoute,
        hasSubItems: false,
        // subItems: [
        //   MenuItem(
        //     title: 'قائمة المستخدمين',
        //     titleKey: 'users_list',
        //     icon: Icons.list,
        //     route: '/users/list',
        //   ),
        //   MenuItem(
        //     title: 'إضافة مستخدم جديد',
        //     titleKey: 'add_user',
        //     icon: Icons.person_add,
        //     route: '/users/add',
        //   ),
        //   MenuItem(
        //     title: 'إدارة الصلاحيات',
        //     titleKey: 'manage_permissions',
        //     icon: Icons.security,
        //     route: '/users/permissions',
        //   ),
        // ],
      ),
      MenuItem(
        title: 'العملاء والمنتجات',
        titleKey: 'clients_products',
        icon: Icons.inventory,
        route: '/clients',
        hasSubItems: true,
        subItems: [
          MenuItem(
            title: 'قائمة العملاء',
            titleKey: 'clients_list',
            icon: Icons.people,
            route: '/clients/list',
          ),
          MenuItem(
            title: 'إضافة عميل جديد',
            titleKey: 'add_client',
            icon: Icons.person_add,
            route: '/clients/add',
          ),
          MenuItem(
            title: 'إدارة المنتجات',
            titleKey: 'manage_products',
            icon: Icons.inventory_2,
            route: '/products',
            hasSubItems: true,
            subItems: [
              MenuItem(
                title: 'قائمة المنتجات',
                titleKey: 'products_list',
                icon: Icons.list,
                route: '/products/list',
              ),
              MenuItem(
                title: 'إضافة منتج جديد',
                titleKey: 'add_product',
                icon: Icons.add_box,
                route: '/products/add',
              ),
            ],
          ),
          MenuItem(
            title: 'فئات المنتجات',
            titleKey: 'product_categories',
            icon: Icons.category,
            route: '/products/categories',
          ),
        ],
      ),
      MenuItem(
        title: 'المصروفات',
        titleKey: 'expenses',
        icon: Icons.account_balance_wallet,
        route: '/expenses',
        hasSubItems: false,
        // subItems: [
        //   MenuItem(
        //     title: 'قائمة المصروفات',
        //     titleKey: 'expenses_list',
        //     icon: Icons.list,
        //     route: '/expenses/list',
        //   ),
        //   MenuItem(
        //     title: 'إضافة مصروف جديد',
        //     titleKey: 'add_expense',
        //     icon: Icons.add,
        //     route: '/expenses/add',
        //   ),
        //   MenuItem(
        //     title: 'فئات المصروفات',
        //     titleKey: 'expense_categories',
        //     icon: Icons.category,
        //     route: '/expenses/categories',
        //   ),
        // ],
      ),
      MenuItem(
        title: 'الفواتير الضريبية',
        titleKey: 'tax_invoices',
        icon: Icons.receipt_long,
        route: '/invoices',
        hasSubItems: false,
        // subItems: [
        //   MenuItem(
        //     title: 'قائمة الفواتير',
        //     titleKey: 'invoices_list',
        //     icon: Icons.list,
        //     route: '/invoices/list',
        //   ),
        //   MenuItem(
        //     title: 'إنشاء فاتورة جديدة',
        //     titleKey: 'create_invoice',
        //     icon: Icons.add,
        //     route: '/invoices/create',
        //   ),
        //   MenuItem(
        //     title: 'الفواتير المعلنة',
        //     titleKey: 'posted_invoices',
        //     icon: Icons.check_circle,
        //     route: '/invoices/posted',
        //   ),
        //   MenuItem(
        //     title: 'الفواتير المرتجعة',
        //     titleKey: 'returned_invoices',
        //     icon: Icons.undo,
        //     route: '/invoices/returned',
        //   ),
        // ],
      ),
      MenuItem(
        title: 'التقارير',
        titleKey: 'reports',
        icon: Icons.analytics,
        route: '/reports',
        hasSubItems: false,
        // subItems: [
        //   MenuItem(
        //     title: 'تقرير المبيعات',
        //     titleKey: 'sales_report',
        //     icon: Icons.trending_up,
        //     route: '/reports/sales',
        //   ),
        //   MenuItem(
        //     title: 'تقرير المصروفات',
        //     titleKey: 'expenses_report',
        //     icon: Icons.trending_down,
        //     route: '/reports/expenses',
        //   ),
        //   MenuItem(
        //     title: 'تقرير العملاء',
        //     titleKey: 'customers_report',
        //     icon: Icons.people,
        //     route: '/reports/customers',
        //   ),
        //   MenuItem(
        //     title: 'تقرير المنتجات',
        //     titleKey: 'products_report',
        //     icon: Icons.inventory,
        //     route: '/reports/products',
        //   ),
        // ],
      ),
      MenuItem(
        title: 'الإعدادات',
        titleKey: 'settings',
        icon: Icons.settings,
        route: '/settings',
        hasSubItems: false,
        // subItems: [
        //   MenuItem(
        //     title: 'إعدادات الشركة',
        //     titleKey: 'company_settings',
        //     icon: Icons.business,
        //     route: '/settings/company',
        //   ),
        //   MenuItem(
        //     title: 'إعدادات النظام',
        //     titleKey: 'system_settings',
        //     icon: Icons.settings_system_daydream,
        //     route: '/settings/system',
        //   ),
        //   MenuItem(
        //     title: 'النسخ الاحتياطي',
        //     titleKey: 'backup',
        //     icon: Icons.backup,
        //     route: '/settings/backup',
        //   ),
        // ],
      ),
    ];
  }
}
