import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/permission_helper.dart';
import '../../../../core/utils/snackbar_helper.dart';
import '../../../../core/error/failures.dart';
import '../../../../generated/l10n.dart';
import '../../../users_and_permissions/ui/widgets/forms/custom_text_field.dart';
import '../../constants/settings_permissions.dart';
import '../../cubit/company_cubit.dart';
import '../../cubit/tax_integration_cubit.dart';

class CompanySettingsSection extends StatefulWidget {
  const CompanySettingsSection({super.key});

  @override
  State<CompanySettingsSection> createState() => _CompanySettingsSectionState();
}

class _CompanySettingsSectionState extends State<CompanySettingsSection> {
  final TextEditingController _merchantCodeController = TextEditingController();
  String _invoiceType = 'income';
  TaxIntegrationState? _previousTaxState;

  @override
  void initState() {
    super.initState();
    // تحميل الحالة الحالية عند فتح الشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final taxState = context.read<TaxIntegrationCubit>().state;
      _previousTaxState = taxState;
      if (taxState is TaxIntegrationLoaded) {
        if (taxState.status.taxInvoiceType != null) {
          setState(() {
            _invoiceType = taxState.status.taxInvoiceType!;
          });
        }
      } else {
        // إذا لم تكن الحالة محملة، قم بتحميلها
        context.read<TaxIntegrationCubit>().loadStatus();
      }
    });
  }

  @override
  void dispose() {
    _merchantCodeController.dispose();
    super.dispose();
  }

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
            _infoTile(
              S.of(context).companyName,
              c.name ?? S.of(context).noName,
              Icons.business,
            ),
            SizedBox(height: 12.h),
            _infoTile(
              S.of(context).companyEmail,
              c.email ?? S.of(context).noEmail,
              Icons.email,
            ),
            SizedBox(height: 12.h),
            _infoTile(
              S.of(context).companyPhone,
              c.phone ?? S.of(context).noPhone,
              Icons.phone,
            ),
            SizedBox(height: 12.h),
            _infoTile(
              S.of(context).companyAddress,
              c.address ?? '-',
              Icons.location_on,
            ),
            SizedBox(height: 12.h),
            _infoTile(
              S.of(context).status,
              c.status ?? S.of(context).noStatus,
              Icons.verified_user,
            ),
            SizedBox(height: 24.h),
            _buildTaxIntegrationCard(context),
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

  Widget _buildTaxIntegrationCard(BuildContext context) {
    final s = S.of(context);
    return BlocListener<TaxIntegrationCubit, TaxIntegrationState>(
      listenWhen: (previous, current) {
        // الاستماع فقط عند تغيير الحالة من ActionInProgress إلى Loaded أو Error
        return (previous is TaxIntegrationActionInProgress &&
                (current is TaxIntegrationLoaded ||
                    current is TaxIntegrationError)) ||
            (previous is TaxIntegrationLoaded &&
                current is TaxIntegrationLoaded &&
                previous.status.taxIntegrationActive !=
                    current.status.taxIntegrationActive);
      },
      listener: (context, state) {
        final wasInProgress =
            _previousTaxState is TaxIntegrationActionInProgress;
        _previousTaxState = state;

        if (state is TaxIntegrationLoaded) {
          // مسح الحقول بعد التفعيل الناجح
          if (_merchantCodeController.text.isNotEmpty) {
            _merchantCodeController.clear();
          }
          // إعادة تعيين نوع الفاتورة من الحالة الحالية
          if (state.status.taxInvoiceType != null) {
            setState(() {
              _invoiceType = state.status.taxInvoiceType!;
            });
          }
          // إظهار رسالة نجاح عند اكتمال العملية
          if (wasInProgress) {
            SnackBarHelper.showSuccessSnackBar(
              context,
              state.status.taxIntegrationActive
                  ? s.settingsActivateIntegration
                  : s.settingsDeactivate,
            );
          }
        } else if (state is TaxIntegrationError) {
          // إظهار رسالة خطأ
          SnackBarHelper.showFailureSnackBar(
            context,
            Failure.unknown(message: state.message),
          );
        }
      },
      child: BlocBuilder<TaxIntegrationCubit, TaxIntegrationState>(
        buildWhen: (previous, current) {
          // إعادة البناء فقط عند تغيير الحالة بشكل فعلي
          if (previous is TaxIntegrationLoaded &&
              current is TaxIntegrationLoaded) {
            return previous.status.taxIntegrationActive !=
                    current.status.taxIntegrationActive ||
                previous.status.taxInvoiceType !=
                    current.status.taxInvoiceType ||
                previous.status.taxMerchantCode !=
                    current.status.taxMerchantCode;
          }
          return previous != current;
        },
        builder: (context, state) {
          if (state is TaxIntegrationLoading ||
              state is TaxIntegrationActionInProgress) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TaxIntegrationError) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle(S.of(context).settingsTaxIntegration),
                SizedBox(height: 8.h),
                Text(
                  state.message,
                  style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.error,
                  ),
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: OutlinedButton(
                    onPressed: () =>
                        context.read<TaxIntegrationCubit>().loadStatus(),
                    child: Text(S.of(context).settingsRetry),
                  ),
                ),
              ],
            );
          }
          if (state is! TaxIntegrationLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle(S.of(context).settingsTaxIntegration),
                SizedBox(height: 8.h),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: OutlinedButton(
                    onPressed: () =>
                        context.read<TaxIntegrationCubit>().loadStatus(),
                    child: Text(S.of(context).settingsUpdateStatus),
                  ),
                ),
              ],
            );
          }

          final status = state.status;
          final isActive = status.taxIntegrationActive;

          final s = S.of(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _sectionTitle(s.settingsTaxIntegration),
              SizedBox(height: 8.h),
              _infoTile(
                s.settingsStatus,
                isActive ? s.settingsActive : s.settingsInactive,
                Icons.verified,
              ),
              SizedBox(height: 12.h),
              if (status.taxInvoiceType != null) ...[
                _infoTile(
                  s.settingsTaxInvoiceType,
                  status.taxInvoiceType!,
                  Icons.receipt_long,
                ),
                SizedBox(height: 12.h),
              ],
              if (status.taxMerchantCode != null) ...[
                PermissionWidget(
                  permission: SettingsPermissions.taxIntegrationView,
                  fallback: Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Text(
                        s.settingsNoPermissionToView,
                        style: AppTextTheme.textTheme.bodyMedium?.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  child: _infoTile(
                    s.settingsTaxMerchantCode,
                    status.taxMerchantCode!,
                    Icons.qr_code,
                  ),
                ),
                SizedBox(height: 16.h),
              ],
              if (!isActive)
                _buildActivateForm(context)
              else
                _buildDeactivateButton(context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildActivateForm(BuildContext context) {
    final s = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.settingsActivateIntegration,
          style: AppTextTheme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          label: s.settingsTaxMerchantCode,
          controller: _merchantCodeController,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Text(
              '${s.settingsInvoiceType}:',
              style: AppTextTheme.textTheme.titleSmall,
            ),
            SizedBox(width: 8.w),
            DropdownButton<String>(
              value: _invoiceType,
              items: [
                DropdownMenuItem(
                  value: 'income',
                  child: Text(s.settingsIncome),
                ),
                DropdownMenuItem(
                  value: 'general',
                  child: Text(s.settingsGeneral),
                ),
              ],
              onChanged: (v) {
                if (v != null) setState(() => _invoiceType = v);
              },
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: ElevatedButton.icon(
            onPressed: () {
              final code = _merchantCodeController.text.trim();
              if (code.isEmpty) return;
              context.read<TaxIntegrationCubit>().activate(
                taxMerchantCode: code,
                taxInvoiceType: _invoiceType,
              );
            },
            icon: const Icon(Icons.check_circle_outline),
            label: Text(s.settingsActivate),
          ),
        ),
      ],
    );
  }

  Widget _buildDeactivateButton(BuildContext context) {
    final s = S.of(context);
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: OutlinedButton.icon(
        onPressed: () => context.read<TaxIntegrationCubit>().deactivate(),
        icon: const Icon(Icons.cancel_outlined),
        label: Text(s.settingsDeactivate),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: AppTextTheme.textTheme.titleLarge?.copyWith(
        color: AppColors.onSurface,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
