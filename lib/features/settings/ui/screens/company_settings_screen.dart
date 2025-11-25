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

  // الحالة الأصلية للبيانات
  String? _originalName;
  String? _originalEmail;
  String? _originalPhone;
  String? _originalAddress;
  String? _originalMerchantCode;
  String? _originalInvoiceType;
  String? _originalSelectedLogoPath;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _merchantCodeController = TextEditingController();

    // إضافة listeners لتتبع التغييرات
    _nameController.addListener(_checkForChanges);
    _emailController.addListener(_checkForChanges);
    _phoneController.addListener(_checkForChanges);
    _addressController.addListener(_checkForChanges);
    _merchantCodeController.addListener(_checkForChanges);
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

  /// التحقق من وجود تغييرات في النماذج
  /// Check for changes in form fields
  void _checkForChanges() {
    final hasFormChanges =
        _nameController.text != _originalName ||
        _emailController.text != _originalEmail ||
        _phoneController.text != _originalPhone ||
        _addressController.text != _originalAddress ||
        _merchantCodeController.text != _originalMerchantCode ||
        _selectedInvoiceType != _originalInvoiceType ||
        _selectedLogoPath != _originalSelectedLogoPath;

    if (hasFormChanges != _hasChanges) {
      setState(() => _hasChanges = hasFormChanges);
    }
  }

  /// حفظ الحالة الأصلية للبيانات
  /// Save original state of data
  void _saveOriginalState({
    required String? name,
    required String? email,
    required String? phone,
    required String? address,
    required String? merchantCode,
    required String? invoiceType,
    required String? logoUrl,
  }) {
    _originalName = name;
    _originalEmail = email;
    _originalPhone = phone;
    _originalAddress = address;
    _originalMerchantCode = merchantCode;
    _originalInvoiceType = invoiceType;
    // logoUrl محفوظ في company.logoUrl ولا حاجة لحفظه منفصلاً
    _originalSelectedLogoPath = null;
  }

  /// إعادة تعيين الحالة إلى الحالة الأصلية
  /// Reset state to original values
  void _resetToOriginalState() {
    _nameController.text = _originalName ?? '';
    _emailController.text = _originalEmail ?? '';
    _phoneController.text = _originalPhone ?? '';
    _addressController.text = _originalAddress ?? '';
    _merchantCodeController.text = _originalMerchantCode ?? '';
    _selectedInvoiceType = _originalInvoiceType;
    _selectedLogoPath = _originalSelectedLogoPath;
    setState(() => _hasChanges = false);
  }

  /// التحقق من وجود تغييرات قبل الخروج
  /// Check if there are changes before popping
  Future<bool> _onWillPop() async {
    if (!_hasChanges) {
      return true; // السماح بالخروج إذا لم تكن هناك تغييرات
    }

    // عرض dialog للتحقق من الخروج
    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تغييرات غير محفوظة'),
        content: const Text(
          'لديك تغييرات غير محفوظة. هل أنت متأكد أنك تريد تجاهلها؟',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(S.of(context).settingsCancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('تجاهل'),
          ),
        ],
      ),
    );

    if (shouldPop == true) {
      // إعادة تعيين الحالة الأصلية
      _resetToOriginalState();
      return true;
    }

    return false;
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
      // تحديث الحالة الأصلية بعد الحفظ الناجح
      _saveOriginalState(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        address: _addressController.text,
        merchantCode: _merchantCodeController.text.isEmpty
            ? null
            : _merchantCodeController.text,
        invoiceType: _selectedInvoiceType,
        logoUrl: null, // سيتم تحديثها من الـ response
      );
      setState(() => _hasChanges = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await _onWillPop();
        if (shouldPop && mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              final shouldPop = await _onWillPop();
              if (shouldPop && mounted) {
                Navigator.of(context).pop();
              }
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.primary,
              size: 24.sp,
            ),
          ),
          title: Text(
            S.of(context).companySettings,
            style: AppTextTheme.textTheme.headlineMedium?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.white,
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

                  // Initialize controllers with loaded data and save original state
                  if (_nameController.text.isEmpty) {
                    final company = state.company;
                    _nameController.text = company.name ?? '';
                    _emailController.text = company.email ?? '';
                    _phoneController.text = company.phone ?? '';
                    _addressController.text = company.address ?? '';
                    _merchantCodeController.text =
                        company.taxMerchantCode ?? '';

                    // التأكد من أن القيمة المحملة موجودة في القائمة
                    final loadedType = company.taxInvoiceType;
                    if (loadedType == 'general' || loadedType == 'income') {
                      _selectedInvoiceType = loadedType;
                    } else {
                      _selectedInvoiceType = null;
                    }

                    // حفظ الحالة الأصلية
                    _saveOriginalState(
                      name: company.name,
                      email: company.email,
                      phone: company.phone,
                      address: company.address,
                      merchantCode: company.taxMerchantCode,
                      invoiceType: _selectedInvoiceType,
                      logoUrl: company.logoUrl,
                    );
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
                          selectedImagePath: _selectedLogoPath,
                          isLoading: isUpdating,
                          onLogoSelected: (path) {
                            setState(() {
                              _selectedLogoPath = path;
                              _checkForChanges();
                            });
                            // TODO: Implement logo upload to server
                          },
                          onLogoRemoved: () {
                            setState(() {
                              _selectedLogoPath = null;
                              _checkForChanges();
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

                      // // Tax Integration Card
                      // BlocBuilder<TaxIntegrationCubit, TaxIntegrationState>(
                      //   builder: (context, taxState) {
                      //     final isActive =
                      //         taxState is TaxIntegrationLoaded &&
                      //         taxState.status.taxIntegrationActive;

                      //     return SettingsCard(
                      //       title: S.of(context).settingsTaxIntegration,
                      //       showDivider: true,
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Row(
                      //             children: [
                      //               Text(
                      //                 S.of(context).status,
                      //                 style: AppTextTheme.textTheme.bodyMedium
                      //                     ?.copyWith(fontWeight: FontWeight.w500),
                      //               ),
                      //               const Spacer(),
                      //               StatusBadge(
                      //                 text: isActive
                      //                     ? S.of(context).settingsUserActive
                      //                     : S.of(context).settingsUserInactive,
                      //                 type: isActive
                      //                     ? StatusBadgeType.success
                      //                     : StatusBadgeType.error,
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(height: 16.h),
                      //           EditableField(
                      //             label: S.of(context).settingsMerchantCode,
                      //             controller: _merchantCodeController,
                      //             enabled: !isUpdating,
                      //           ),
                      //           SizedBox(height: 16.h),
                      //           Column(
                      //             crossAxisAlignment: CrossAxisAlignment.start,
                      //             children: [
                      //               Text(
                      //                 S.of(context).settingsInvoiceType,
                      //                 style: AppTextTheme.textTheme.bodyMedium
                      //                     ?.copyWith(
                      //                       fontWeight: FontWeight.w500,
                      //                       color: AppColors.textPrimary,
                      //                     ),
                      //               ),
                      //               SizedBox(height: 8.h),
                      //               DropdownButtonFormField<String>(
                      //                 initialValue:
                      //                     _selectedInvoiceType == 'general' ||
                      //                         _selectedInvoiceType == 'income'
                      //                     ? _selectedInvoiceType
                      //                     : null,
                      //                 decoration: InputDecoration(
                      //                   border: OutlineInputBorder(
                      //                     borderRadius: BorderRadius.circular(
                      //                       8.r,
                      //                     ),
                      //                     borderSide: BorderSide(
                      //                       color: AppColors.border,
                      //                     ),
                      //                   ),
                      //                   enabledBorder: OutlineInputBorder(
                      //                     borderRadius: BorderRadius.circular(
                      //                       8.r,
                      //                     ),
                      //                     borderSide: BorderSide(
                      //                       color: AppColors.border,
                      //                     ),
                      //                   ),
                      //                   focusedBorder: OutlineInputBorder(
                      //                     borderRadius: BorderRadius.circular(
                      //                       8.r,
                      //                     ),
                      //                     borderSide: BorderSide(
                      //                       color: AppColors.primary,
                      //                       width: 2,
                      //                     ),
                      //                   ),
                      //                   contentPadding: EdgeInsets.symmetric(
                      //                     horizontal: 16.w,
                      //                     vertical: 12.h,
                      //                   ),
                      //                 ),
                      //                 items: [
                      //                   DropdownMenuItem(
                      //                     value: 'general',
                      //                     child: Text(
                      //                       S.of(context).settingsGeneral,
                      //                     ),
                      //                   ),
                      //                   DropdownMenuItem(
                      //                     value: 'income',
                      //                     child: Text(
                      //                       S.of(context).settingsIncome,
                      //                     ),
                      //                   ),
                      //                 ],
                      //                 onChanged: isUpdating
                      //                     ? null
                      //                     : (value) {
                      //                         setState(() {
                      //                           _selectedInvoiceType = value;
                      //                           _markAsChanged();
                      //                         });
                      //                       },
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // ),

                      // SizedBox(height: 24.h),

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
                                    : () async {
                                        final shouldPop = await _onWillPop();
                                        if (shouldPop && mounted) {
                                          Navigator.of(context).pop();
                                        }
                                      },
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: ActionButton(
                                text: S.of(context).save,
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
      ),
    );
  }
}
