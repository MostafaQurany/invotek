import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invotek/core/error/failures.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/theme/app_text_theme.dart';
import 'package:invotek/core/utils/snackbar_helper.dart';
import 'package:invotek/features/settings/cubit/photo_cubit.dart';
import 'package:invotek/features/settings/cubit/profile_cubit.dart';
import 'package:invotek/features/settings/cubit/update_profile_cubit.dart';
import 'package:invotek/features/settings/data/models/update_profile_request.dart';
import 'package:invotek/generated/l10n.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _positionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().loadProfile();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _positionController.dispose();
    super.dispose();
  }

  Future<void> _pickAndUploadPhoto() async {
    try {
      final picker = ImagePicker();
      final picked = await picker.pickImage(source: ImageSource.gallery);
      if (picked == null) return;
      context.read<PhotoCubit>().upload(File(picked.path));
    } catch (e) {
      SnackBarHelper.showFailureSnackBar(
        context,
        Failure.unknown(
          message: S
              .of(context)
              .errorOccurredWithMessage((e is Exception) ? e.toString() : '$e'),
        ),
      );
    }
  }

  void _submit() {
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
    return MultiBlocListener(
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
            }
          },
        ),
      ],
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileError) {
            return Center(child: Text(state.message));
          }
          if (state is ProfileLoaded) {
            _nameController.text = state.user.name ?? '';
            _emailController.text = state.user.email ?? '';
            _phoneController.text = (state.user.phone ?? '').toString();
            _positionController.text = (state.user.position ?? '').toString();
          }

          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28.r,
                      child: CachedNetworkImage(
                        imageUrl:
                            (state is ProfileLoaded &&
                                state.user.profilePhotoUrl != null)
                            ? state.user.profilePhotoUrl!
                            : "",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.person, color: AppColors.primary),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    ElevatedButton.icon(
                      onPressed: _pickAndUploadPhoto,
                      icon: const Icon(Icons.photo_camera),
                      label: Text(S.of(context).updatePhoto),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                _buildField(
                  controller: _nameController,
                  label: S.of(context).name,
                  icon: Icons.person,
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? S.of(context).fieldIsRequired(S.of(context).name)
                      : null,
                ),
                SizedBox(height: 12.h),
                _buildField(
                  controller: _emailController,
                  label: S.of(context).email,
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? S.of(context).fieldIsRequired(S.of(context).email)
                      : null,
                ),
                SizedBox(height: 12.h),
                _buildField(
                  controller: _phoneController,
                  label: S.of(context).phone,
                  icon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? S.of(context).fieldIsRequired(S.of(context).phone)
                      : null,
                ),
                SizedBox(height: 12.h),
                _buildField(
                  controller: _positionController,
                  label: S.of(context).position,
                  icon: Icons.work_outline,
                ),

                SizedBox(height: 16.h),

                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                    builder: (context, st) {
                      final loading = st is UpdateProfileLoading;
                      return ElevatedButton(
                        onPressed: loading ? null : _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.onPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: loading
                            ? SizedBox(
                                width: 20.w,
                                height: 20.w,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                S.of(context).save,
                                style: AppTextTheme.textTheme.titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.white,
                                    ),
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
