import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/settings/constants/settings_permissions.dart';
import 'package:invotek/features/settings/cubit/tax_integration_cubit.dart';
import 'package:invotek/features/settings/ui/widgets/shared/shared_widgets.dart';
import 'package:invotek/generated/l10n.dart';

class TacIntegrationSettingsScreen extends StatefulWidget {
  const TacIntegrationSettingsScreen({super.key});

  @override
  State<TacIntegrationSettingsScreen> createState() =>
      _TacIntegrationSettingsScreenState();
}

class _TacIntegrationSettingsScreenState
    extends State<TacIntegrationSettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _merchantCodeController;
  String? _selectedInvoiceType;
  @override
  void initState() {
    super.initState();
    _merchantCodeController = TextEditingController();
  }

  @override
  void dispose() {
    _merchantCodeController.dispose();
    super.dispose();
  }

  void _saveChanges(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_selectedInvoiceType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('الرجاء اختيار نوع الفاتورة'),
            backgroundColor: AppColors.error,
          ),
        );
        return;
      }

      context.read<TaxIntegrationCubit>().activate(
        taxMerchantCode: _merchantCodeController.text.trim(),
        taxInvoiceType: _selectedInvoiceType!,
      );
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
            color: AppColors.primary,
            size: 24.sp,
          ),
        ),
        title: Text(
          S.of(context).settingsTaxIntegration,
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
        permission: SettingsPermissions.view,
        fallback: Center(
          child: EmptyStateWidget(
            icon: Icons.lock_outline,
            title: S.of(context).settingsNoPermissionToView,
            description: S.of(context).settingsNoPermissionToAct,
          ),
        ),
        child: BlocProvider<TaxIntegrationCubit>(
          create: (_) => getIt<TaxIntegrationCubit>()..loadStatus(),
          child: BlocConsumer<TaxIntegrationCubit, TaxIntegrationState>(
            listener: (context, state) {
              if (state is TaxIntegrationLoaded) {
                // ملء الحقول بالبيانات الموجودة عند التحميل
                if (_merchantCodeController.text.isEmpty) {
                  _merchantCodeController.text =
                      state.status.taxMerchantCode ?? '';
                  final loadedType = state.status.taxInvoiceType;
                  if (loadedType == 'general' || loadedType == 'income') {
                    _selectedInvoiceType = loadedType;
                  }
                }

                // // عند الحفظ الناجح، إغلاق الشاشة
                if (state.status.taxIntegrationActive) {
                  //   Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(S.of(context).settingsSaveChanges),
                      backgroundColor: AppColors.success,
                    ),
                  );
                }
              } else if (state is TaxIntegrationError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                    backgroundColor: AppColors.error,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state is TaxIntegrationLoading) {
                return ListView(
                  padding: EdgeInsets.all(16.w),
                  children: [
                    const LoadingCard(height: 200),
                    SizedBox(height: 16.h),
                    const LoadingCard(height: 300),
                  ],
                );
              }

              if (state is TaxIntegrationError) {
                return Center(
                  child: EmptyStateWidget(
                    icon: Icons.error_outline,
                    title: S.of(context).expensesSomethingWentWrong,
                    description: state.message,
                    actionText: S.of(context).expensesTryAgain,
                    onAction: () =>
                        context.read<TaxIntegrationCubit>().loadStatus(),
                  ),
                );
              }

              final isUpdating = state is TaxIntegrationActionInProgress;

              return Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(16.w),
                  children: [
                    // Tax Integration Settings Card
                    SettingsCard(
                      title: S.of(context).settingsTaxIntegration,
                      showDivider: true,
                      child: Column(
                        children: [
                          EditableField(
                            label: S.of(context).settingsMerchantCode,
                            controller: _merchantCodeController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'الرجاء إدخال رمز التاجر';
                              }
                              return null;
                            },
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
                                initialValue: _selectedInvoiceType,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide(
                                      color: AppColors.border,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide(
                                      color: AppColors.border,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
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
                                    child: Text(S.of(context).settingsGeneral),
                                  ),
                                  DropdownMenuItem(
                                    value: 'income',
                                    child: Text(S.of(context).settingsIncome),
                                  ),
                                ],
                                onChanged: isUpdating
                                    ? null
                                    : (value) {
                                        setState(() {
                                          _selectedInvoiceType = value;
                                        });
                                      },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'الرجاء اختيار نوع الفاتورة';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16.h),

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
                              text: S.of(context).save,
                              variant: ActionButtonVariant.primary,
                              isLoading: isUpdating,
                              onPressed: isUpdating
                                  ? null
                                  : () => _saveChanges(builderContext),
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
