import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/core/utils/snackbar_helper.dart';
import 'package:invotek/features/settings/constants/settings_permissions.dart';
import 'package:invotek/features/settings/cubit/photo_cubit.dart';
import 'package:invotek/features/settings/cubit/profile_cubit.dart';
import 'package:invotek/features/settings/cubit/update_profile_cubit.dart';
import 'package:invotek/features/settings/data/models/update_profile_request.dart';
import 'package:invotek/features/settings/ui/widgets/profile/profile_photo_card.dart';
import 'package:invotek/features/settings/ui/widgets/shared/shared_widgets.dart';
import 'package:invotek/generated/l10n.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _positionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _positionController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    final request = UpdateProfileRequest(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      position: _positionController.text.trim().isEmpty
          ? null
          : _positionController.text.trim(),
    );
    context.read<UpdateProfileCubit>().submit(request);
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
          S.of(context).editProfile,
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
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ProfileCubit>(
              create: (_) => getIt<ProfileCubit>()..loadProfile(),
            ),
            BlocProvider<UpdateProfileCubit>(
              create: (_) => getIt<UpdateProfileCubit>(),
            ),
            BlocProvider<PhotoCubit>(create: (_) => getIt<PhotoCubit>()),
          ],
          child: MultiBlocListener(
            listeners: [
              BlocListener<PhotoCubit, PhotoState>(
                listener: (context, state) {
                  if (state is PhotoError) {
                    SnackBarHelper.showFailureSnackBar(
                      context,
                      Failure.unknown(message: state.message),
                    );
                  } else if (state is PhotoUpdated) {
                    SnackBarHelper.showSuccessSnackBar(
                      context,
                      S.of(context).updatedSuccessfully,
                    );
                    context.read<ProfileCubit>().loadProfile();
                  }
                },
              ),
              BlocListener<UpdateProfileCubit, UpdateProfileState>(
                listener: (context, state) {
                  if (state is UpdateProfileError) {
                    SnackBarHelper.showFailureSnackBar(
                      context,
                      Failure.unknown(message: state.message),
                    );
                  } else if (state is UpdateProfileSuccess) {
                    SnackBarHelper.showSuccessSnackBar(
                      context,
                      S.of(context).updatedSuccessfully,
                    );
                    Navigator.of(context).pop();
                  }
                },
              ),
            ],
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return ListView(
                    padding: EdgeInsets.all(16.w),
                    children: [
                      const LoadingCard(height: 200),
                      SizedBox(height: 16.h),
                      const LoadingCard(height: 400),
                    ],
                  );
                }

                if (state is ProfileError) {
                  return Center(
                    child: EmptyStateWidget(
                      icon: Icons.error_outline,
                      title: S.of(context).expensesSomethingWentWrong,
                      description: state.message,
                      actionText: S.of(context).expensesTryAgain,
                      onAction: () =>
                          context.read<ProfileCubit>().loadProfile(),
                    ),
                  );
                }

                if (state is ProfileLoaded) {
                  // Initialize controllers only once
                  if (_nameController.text.isEmpty) {
                    _nameController.text = state.user.name ?? '';
                    _emailController.text = state.user.email ?? '';
                    _phoneController.text = (state.user.phone ?? '').toString();
                    _positionController.text = (state.user.position ?? '')
                        .toString();
                  }

                  return Form(
                    key: _formKey,
                    child: ListView(
                      padding: EdgeInsets.all(16.w),
                      children: [
                        // // Profile Photo Card
                        // SettingsCard(
                        //   child: ProfilePhotoCard(
                        //     photoUrl: state.user.profilePhotoUrl,
                        //     userName: state.user.name ?? '',
                        //     onPhotoSelected: (path) {
                        //       context.read<PhotoCubit>().upload(File(path));
                        //     },
                        //     onPhotoRemoved: () {
                        //       // TODO: Implement photo removal
                        //     },
                        //   ),
                        // ),
                        SizedBox(height: 16.h),

                        // Personal Information Card
                        SettingsCard(
                          title: S.of(context).settingsPersonalInfo,
                          showDivider: true,
                          child: Column(
                            children: [
                              EditableField(
                                label: S.of(context).name,
                                controller: _nameController,
                                validator: (v) =>
                                    (v == null || v.trim().isEmpty)
                                    ? S
                                          .of(context)
                                          .fieldIsRequired(S.of(context).name)
                                    : null,
                              ),
                              SizedBox(height: 16.h),
                              EditableField(
                                label: S.of(context).email,
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (v) =>
                                    (v == null || v.trim().isEmpty)
                                    ? S
                                          .of(context)
                                          .fieldIsRequired(S.of(context).email)
                                    : null,
                              ),
                              SizedBox(height: 16.h),
                              EditableField(
                                label: S.of(context).phone,
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                validator: (v) =>
                                    (v == null || v.trim().isEmpty)
                                    ? S
                                          .of(context)
                                          .fieldIsRequired(S.of(context).phone)
                                    : null,
                              ),
                              SizedBox(height: 16.h),
                              EditableField(
                                label: S.of(context).position,
                                controller: _positionController,
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 24.h),

                        // Action Buttons
                        Row(
                          children: [
                            Expanded(
                              child: ActionButton(
                                text: S.of(context).settingsCancel,
                                variant: ActionButtonVariant.secondary,
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child:
                                  BlocBuilder<
                                    UpdateProfileCubit,
                                    UpdateProfileState
                                  >(
                                    builder: (context, updateState) {
                                      return ActionButton(
                                        text: S.of(context).save,
                                        variant: ActionButtonVariant.primary,
                                        isLoading:
                                            updateState is UpdateProfileLoading,
                                        onPressed: () => _submit(context),
                                      );
                                    },
                                  ),
                            ),
                          ],
                        ),

                        SizedBox(height: 32.h),
                      ],
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
