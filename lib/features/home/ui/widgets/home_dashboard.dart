import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/cubits/localization_cubit.dart';
import 'package:invotek/core/services/storage_service.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/screen_utils.dart';
import 'package:invotek/core/widgets/responsive_button.dart';
import 'package:invotek/core/widgets/responsive_card.dart';
import 'package:invotek/core/widgets/responsive_text_field.dart';
import 'package:invotek/generated/l10n.dart';

class HomeDashboard extends StatefulWidget {
  const HomeDashboard({super.key});

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).welcome,
          style: TextStyle(
            fontSize: ScreenUtils.fontSizeTitle,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          BlocBuilder<LocalizationCubit, LocalizationState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  if (state.locale.languageCode == 'ar') {
                    context.read<LocalizationCubit>().changeLanguageToEnglish();
                  } else {
                    context.read<LocalizationCubit>().changeLanguageToArabic();
                  }
                },
                icon: Icon(Icons.language, size: ScreenUtils.iconSizeMedium),
              );
            },
          ),
          IconButton(
            onPressed: () async {
              await StorageService.removeToken();
              await StorageService.removeUserData();
              if (mounted) {
                Navigator.of(context).pushReplacementNamed('/auth');
              }
            },
            icon: Icon(Icons.logout, size: ScreenUtils.iconSizeMedium),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: ScreenUtils.responsivePadding(all: ScreenUtils.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Field
            ResponsiveSearchField(
              controller: _searchController,
              onChanged: (value) {
                // Handle search
                print('Searching for: $value');
              },
            ),

            SizedBox(height: ScreenUtils.paddingLarge),

            // Welcome Section
            ResponsiveInfoCard(
              title: S.of(context).welcome,
              subtitle: S.of(context).welcomeToInvotekApp,
              description: S.of(context).easyInvoiceCustomerManagement,
              icon: Icons.dashboard,
              iconColor: AppColors.primary,
              backgroundColor: AppColors.primary.withOpacity(0.1),
            ),

            SizedBox(height: ScreenUtils.paddingLarge),

            // Quick Actions
            Text(
              S.of(context).quickActions,
              style: TextStyle(
                fontSize: ScreenUtils.fontSizeXLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            SizedBox(height: ScreenUtils.paddingMedium),

            // Action Cards
            ResponsiveActionCard(
              title: S.of(context).customerManagement,
              subtitle: S.of(context).addEditDeleteCustomers,
              icon: Icons.people,
              iconColor: AppColors.primary,
              onTap: () {
                // Navigate to customers
                print('Navigate to customers');
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: ScreenUtils.iconSizeSmall,
                color: AppColors.grey,
              ),
            ),

            SizedBox(height: ScreenUtils.paddingSmall),

            ResponsiveActionCard(
              title: S.of(context).invoiceManagement,
              subtitle: S.of(context).createEditInvoices,
              icon: Icons.receipt,
              iconColor: Colors.orange,
              onTap: () {
                // Navigate to invoices
                print('Navigate to invoices');
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: ScreenUtils.iconSizeSmall,
                color: AppColors.grey,
              ),
            ),

            SizedBox(height: ScreenUtils.paddingSmall),

            ResponsiveActionCard(
              title: S.of(context).reports,
              subtitle: S.of(context).viewReportsStatistics,
              icon: Icons.analytics,
              iconColor: Colors.green,
              onTap: () {
                // Navigate to reports
                print('Navigate to reports');
              },
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: ScreenUtils.iconSizeSmall,
                color: AppColors.grey,
              ),
            ),

            SizedBox(height: ScreenUtils.paddingLarge),

            // Buttons Section
            Text(
              S.of(context).quickActionsTitle,
              style: TextStyle(
                fontSize: ScreenUtils.fontSizeXLarge,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            SizedBox(height: ScreenUtils.paddingMedium),

            ResponsiveButton(
              text: 'إضافة عميل جديد',
              icon: Icons.person_add,
              onPressed: () {
                // Add new customer
                print('Add new customer');
              },
            ),

            SizedBox(height: ScreenUtils.paddingSmall),

            ResponsiveButton(
              text: 'إنشاء فاتورة جديدة',
              icon: Icons.add_shopping_cart,
              backgroundColor: Colors.orange,
              onPressed: () {
                // Create new invoice
                print('Create new invoice');
              },
            ),

            SizedBox(height: ScreenUtils.paddingSmall),

            ResponsiveOutlinedButton(
              text: 'عرض جميع الفواتير',
              icon: Icons.list,
              onPressed: () {
                // View all invoices
                print('View all invoices');
              },
            ),

            SizedBox(height: ScreenUtils.paddingLarge),

            // Device Info Card
            ResponsiveInfoCard(
              title: 'معلومات الجهاز',
              subtitle: S.of(context).screenDimensionsPerformance,
              description:
                  '''
العرض: ${ScreenUtils.screenWidth.toStringAsFixed(0)}px
الارتفاع: ${ScreenUtils.screenHeight.toStringAsFixed(0)}px
نوع الجهاز: ${ScreenUtils.isTablet ? 'تابلت' : 'هاتف'}
نسبة البكسل: ${ScreenUtils.pixelRatio.toStringAsFixed(2)}
              ''',
              icon: Icons.device_hub,
              iconColor: Colors.blue,
            ),

            SizedBox(height: ScreenUtils.paddingLarge),
          ],
        ),
      ),
    );
  }
}
