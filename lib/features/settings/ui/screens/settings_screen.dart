import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/common_menu_button.dart';
import 'package:invotek/features/settings/cubit/company_cubit.dart';
import 'package:invotek/features/settings/cubit/tax_integration_cubit.dart';
import 'package:invotek/features/settings/ui/widgets/account_settings_card.dart';
import 'package:invotek/features/settings/ui/widgets/company_profile_card.dart';
import 'package:invotek/features/settings/ui/widgets/hardware_settings_card.dart';
import 'package:invotek/features/settings/ui/widgets/tax_integration_card.dart';
import 'package:invotek/features/settings/ui/widgets/about_contact_card.dart';
import 'package:invotek/features/settings/ui/widgets/others_card.dart';
import 'package:invotek/features/settings/ui/widgets/system_settings_card.dart';
import 'package:invotek/core/cubits/permissions_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CompanyCubit>()..load()),
        BlocProvider(
          create: (context) => getIt<TaxIntegrationCubit>()..loadStatus(),
        ),
        BlocProvider(create: (context) => getIt<PermissionsCubit>()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        appBar: AppBar(
          leading: SizedBox.shrink(),
          actions: [Center(child: CommonMenuButton(color: AppColors.primary))],
          title: Text(S.of(context).systemSettings),
          centerTitle: false,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CompanyProfileCard(),
              const SizedBox(height: 16),
              const TaxIntegrationCard(),
              const SizedBox(height: 16),
              const AccountSettingsCard(),
              const SizedBox(height: 16),
              const HardwareSettingsCard(),
              const SizedBox(height: 16),
              const SystemSettingsCard(),
              // const SizedBox(height: 16),
              // const AboutContactCard(),
              const SizedBox(height: 16),
              const OthersCard(),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
