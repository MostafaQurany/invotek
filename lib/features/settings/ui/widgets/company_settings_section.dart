import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../generated/l10n.dart';
import '../../../users_and_permissions/ui/widgets/forms/custom_text_field.dart';
import '../../cubit/company_cubit.dart';

class CompanySettingsSection extends StatefulWidget {
  const CompanySettingsSection({super.key});

  @override
  State<CompanySettingsSection> createState() => _CompanySettingsSectionState();
}

class _CompanySettingsSectionState extends State<CompanySettingsSection> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyCubit, CompanyState>(
      builder: (context, state) {
        if (state is CompanyLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CompanyError) {
          return Center(child: Text(state.message));
        }
        if (state is! CompanyLoaded) {
          return const SizedBox.shrink();
        }
        final c = state.company;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoTile(S.of(context).companyName, c.name, Icons.business),
            SizedBox(height: 12.h),
            _infoTile(S.of(context).companyEmail, c.email, Icons.email),
            SizedBox(height: 12.h),
            _infoTile(S.of(context).companyPhone, c.phone, Icons.phone),
            SizedBox(height: 12.h),
            _infoTile(S.of(context).companyAddress, c.address ?? '-', Icons.location_on),
            SizedBox(height: 12.h),
            _infoTile(S.of(context).status, c.status, Icons.verified_user),
          ],
        );
      },
    );
  }

  Widget _infoTile(String label, String value, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppColors.primary, size: 24.sp),
      title: Text(
        label,
        style: AppTextTheme.textTheme.titleSmall?.copyWith(
          color: AppColors.onSurfaceVariant,
        ),
      ),
      subtitle: Text(
        value,
        style: AppTextTheme.textTheme.titleMedium?.copyWith(
          color: AppColors.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
