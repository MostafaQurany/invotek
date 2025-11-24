import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/settings/constants/settings_permissions.dart';
import 'package:invotek/features/settings/cubit/company_cubit.dart';
import 'package:invotek/features/settings/cubit/tax_integration_cubit.dart';
import 'package:invotek/features/settings/data/models/update_company_settings_request.dart';
import 'package:invotek/features/settings/ui/widgets/company/logo_upload_card.dart';
import 'package:invotek/features/settings/ui/widgets/shared/shared_widgets.dart';
import 'package:invotek/generated/l10n.dart';

class CompanySettingsScreen extends StatefulWidget {
  const CompanySettingsScreen({super.key});

  @override
  State<CompanySettingsScreen> createState() => _CompanySettingsScreenState();
}

class _CompanySettingsScreenState extends State<CompanySettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _merchantCodeController;

  String? _selectedInvoiceType;
  String? _selectedLogoPath;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _merchantCodeController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _merchantCodeController.dispose();
    super.dispose();
  }

  void _markAsChanged() {
    if (!_hasChanges) {
      setState(() => _hasChanges = true);
    }
  }

  void _saveChanges(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final request = UpdateCompanySettingsRequest(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        address: _addressController.text,
        taxMerchantCode: _merchantCodeController.text.isEmpty
            ? null
            : _merchantCodeController.text,
        taxInvoiceType: _selectedInvoiceType,
      );

      context.read<CompanyCubit>().updateCompany(request);
      setState(() => _hasChanges = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.onPrimary,
            size: 24.sp,
          ),
        ),
        title: Text(
          S.of(context).companySettings,
          style: AppTextTheme.textTheme.headlineMedium?.copyWith(
            color: AppColors.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: PermissionWidget(
        permission: SettingsPermissions.settings,
        fallback: Center(
          child: EmptyStateWidget(
            icon: Icons.lock_outline,
            title: S.of(context).settingsNoPermissionToView,
            description: S.of(context).settingsNoPermissionToAct,
          ),
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<CompanyCubit>(
              create: (_) => getIt<CompanyCubit>()..load(),
            ),
            BlocProvider<TaxIntegrationCubit>(
              create: (_) => getIt<TaxIntegrationCubit>()..loadStatus(),
            ),
          ],
          child: BlocConsumer<CompanyCubit, CompanyState>(
            listener: (context, state) {
              if (state is CompanyLoaded) {
                if (state.updateError != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.updateError!),
                      backgroundColor: AppColors.error,
                    ),
                  );
                } else if (!state.isUpdating && _hasChanges) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(S.of(context).settingsSaveChanges),
                      backgroundColor: AppColors.success,
                    ),
                  );
                }

                // Initialize controllers with loaded data
                if (_nameController.text.isEmpty) {
                  _nameController.text = state.company.name ?? '';
                  _emailController.text = state.company.email ?? '';
                  _phoneController.text = state.company.phone ?? '';
                  _addressController.text = state.company.address ?? '';
                  _merchantCodeController.text =
                      state.company.taxMerchantCode ?? '';
                  // التأكد من أن القيمة المحملة موجودة في القائمة
                  final loadedType = state.company.taxInvoiceType;
                  if (loadedType == 'general' || loadedType == 'income') {
                    _selectedInvoiceType = loadedType;
                  } else {
                    _selectedInvoiceType = null; // أو 'income' كقيمة افتراضية
                  }
                }
              }
            },
            builder: (context, state) {
              if (state is CompanyLoading) {
                return ListView(
                  padding: EdgeInsets.all(16.w),
                  children: [
                    const LoadingCard(height: 200),
                    SizedBox(height: 16.h),
                    const LoadingCard(height: 300),
                    SizedBox(height: 16.h),
                    const LoadingCard(height: 200),
                  ],
                );
              }

              if (state is CompanyError) {
                return Center(
                  child: EmptyStateWidget(
                    icon: Icons.error_outline,
                    title: S.of(context).expensesSomethingWentWrong,
                    description: state.message,
                    actionText: S.of(context).expensesTryAgain,
                    onAction: () => context.read<CompanyCubit>().load(),
                  ),
                );
              }

              if (state is! CompanyLoaded) {
                return const SizedBox.shrink();
              }

              final company = state.company;
              final isUpdating = state.isUpdating;

              return Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(16.w),
                  children: [
                    // Logo Upload Card
                    SettingsCard(
                      child: LogoUploadCard(
                        logoUrl: company.logoUrl,
                        isLoading: isUpdating,
                        onLogoSelected: (path) {
                          setState(() {
                            _selectedLogoPath = path;
                            _markAsChanged();
                          });
                          // TODO: Implement logo upload to server
                        },
                        onLogoRemoved: () {
                          setState(() {
                            _selectedLogoPath = null;
                            _markAsChanged();
                          });
                          // TODO: Implement logo removal from server
                        },
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Basic Information Card
                    SettingsCard(
                      title: S.of(context).settingsBasicInfo,
                      showDivider: true,
                      child: Column(
                        children: [
                          EditableField(
                            label: S.of(context).settingsCompanyName,
                            controller: _nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).pleaseEnterCompanyName;
                              }
                              return null;
                            },
                            enabled: !isUpdating,
                          ),
                          SizedBox(height: 16.h),
                          EditableField(
                            label: S.of(context).companyEmail,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return S.of(context).emailIsRequired;
                              }
                              return null;
                            },
                            enabled: !isUpdating,
                          ),
                          SizedBox(height: 16.h),
                          EditableField(
                            label: S.of(context).settingsPhone,
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            enabled: !isUpdating,
                          ),
                          SizedBox(height: 16.h),
                          EditableField(
                            label: S.of(context).settingsAddress,
                            controller: _addressController,
                            maxLines: 3,
                            enabled: !isUpdating,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Tax Integration Card
                    BlocBuilder<TaxIntegrationCubit, TaxIntegrationState>(
                      builder: (context, taxState) {
                        final isActive =
                            taxState is TaxIntegrationLoaded &&
                            taxState.status.taxIntegrationActive;

                        return SettingsCard(
                          title: S.of(context).settingsTaxIntegration,
                          showDivider: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    S.of(context).status,
                                    style: AppTextTheme.textTheme.bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  StatusBadge(
                                    text: isActive
                                        ? S.of(context).settingsUserActive
                                        : S.of(context).settingsUserInactive,
                                    type: isActive
                                        ? StatusBadgeType.success
                                        : StatusBadgeType.error,
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              EditableField(
                                label: S.of(context).settingsMerchantCode,
                                controller: _merchantCodeController,
                                enabled: !isUpdating,
                              ),
                              SizedBox(height: 16.h),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).settingsInvoiceType,
                                    style: AppTextTheme.textTheme.bodyMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textPrimary,
                                        ),
                                  ),
                                  SizedBox(height: 8.h),
                                  DropdownButtonFormField<String>(
                                    value: _selectedInvoiceType == 'general' ||
                                            _selectedInvoiceType == 'income'
                                        ? _selectedInvoiceType
                                        : null,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: AppColors.border,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: AppColors.border,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                        borderSide: BorderSide(
                                          color: AppColors.primary,
                                          width: 2,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                        vertical: 12.h,
                                      ),
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                        value: 'general',
                                        child: Text(
                                          S.of(context).settingsGeneral,
                                        ),
                                      ),
                                      DropdownMenuItem(
                                        value: 'income',
                                        child: Text(
                                          S.of(context).settingsIncome,
                                        ),
                                      ),
                                    ],
                                    onChanged: isUpdating
                                        ? null
                                        : (value) {
                                            setState(() {
                                              _selectedInvoiceType = value;
                                              _markAsChanged();
                                            });
                                          },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 24.h),

                    // Action Buttons
                    Builder(
                      builder: (builderContext) => Row(
                        children: [
                          Expanded(
                            child: ActionButton(
                              text: S.of(context).settingsCancel,
                              variant: ActionButtonVariant.secondary,
                              onPressed: isUpdating
                                  ? null
                                  : () => Navigator.of(context).pop(),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: ActionButton(
                              text: S.of(context).settingsSaveChanges,
                              variant: ActionButtonVariant.primary,
                              isLoading: isUpdating,
                              onPressed: _hasChanges && !isUpdating
                                  ? () => _saveChanges(builderContext)
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 32.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
