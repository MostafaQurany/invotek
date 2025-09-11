import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/features/auth/demo/cubit/auth_cubit.dart';
import 'package:invotek/features/auth/ui/auth_loading_screen.dart';
import 'package:invotek/features/auth/ui/auth_login_screen_body.dart';
import 'package:invotek/features/auth/ui/auth_register_screen_body.dart';

import '../../../core/utils/app_images.dart';
import '../../../generated/l10n.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                successLogin: (data) => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.homeRoute,
                  (route) => false,
                ),
                successRegister: (data) => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.homeRoute,
                  (route) => false,
                ),
                orElse: () => false,
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                loadingAuth: () => const AuthLoadingScreen(),
                orElse: () => BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (context.read<AuthCubit>().isLoginScreen) {
                      return const AuthLoginScreenBody();
                    } else {
                      return const AuthRegisterScreenBody();
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class AuthScreenHeader extends StatelessWidget {
  const AuthScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(AppImages.logoGreen), width: 0.45.sw);
  }
}

// class AuthRegisterScreenBody extends StatelessWidget {
//   const AuthRegisterScreenBody({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final textTeme = Theme.of(context).textTheme;
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 20.h),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Image(image: AssetImage(AppImages.logoGreen), width: 0.45.sw),
//               Align(
//                 alignment: AlignmentDirectional.centerEnd,
//                 child: BlocBuilder<LanguageBloc, LanguageState>(
//                   builder: (context, state) {
//                     if (state is LanguageLoaded) {
//                       final currentLanguage =
//                           AppLocalizationService.currentLanguageName;
//                       final nextLanguage = state.locale.languageCode == 'ar'
//                           ? 'English'
//                           : 'العربية';
//
//                       return TransitionUtils.animatedLanguageButton(
//                         currentLanguage: currentLanguage,
//                         newLanguage: nextLanguage,
//                         onPressed: () {
//                           context.read<LanguageBloc>().toggleLanguage();
//                         },
//                       );
//                       // } else if (state is LanguageChanging) {
//                       //   return TransitionUtils.languageChangeLoader(
//                       //     message: 'Changing language...',
//                       //   );
//                     } else {
//                       return SizedBox.shrink();
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//
//           SizedBox(height: 40.h),
//           Text(S.of(context).signIn, style: textTeme.headlineMedium),
//           SizedBox(height: 20),
//           Text(
//             S.of(context).fullName,
//             style: textTeme.titleSmall!.copyWith(color: AppColors.greyDark),
//           ),
//           SizedBox(height: 5),
//
//           NameAuthTextField(controller: TextEditingController()),
//           SizedBox(height: 20),
//           Text(
//             S.of(context).email,
//             style: textTeme.titleSmall!.copyWith(color: AppColors.greyDark),
//           ),
//           SizedBox(height: 5),
//
//           EmailAuthTextField(controller: TextEditingController()),
//
//           SizedBox(height: 20),
//           Text(
//             S.of(context).password,
//             style: textTeme.titleSmall!.copyWith(color: AppColors.greyDark),
//           ),
//           SizedBox(height: 5),
//
//           PasswordAuthTextField(controller: TextEditingController()),
//
//           SizedBox(height: 20),
//           Text(
//             S.of(context).confirmPassword,
//             style: textTeme.titleSmall!.copyWith(color: AppColors.greyDark),
//           ),
//           SizedBox(height: 5),
//
//           ConfirmPasswordTextField(
//             controller: TextEditingController(),
//             passwordController: TextEditingController(),
//           ),
//
//           SizedBox(height: 35.h),
//           // Sign in
//           SizedBox(
//             width: 1.sw,
//             child: ElevatedButton(
//               onPressed: () {},
//               child: Text(S.of(context).signIn),
//             ),
//           ),
//           SizedBox(height: 10),
//           OrDivider(),
//           SizedBox(height: 10),
//
//           // google Sign in
//           SignInWithGoogle(),
//
//           SizedBox(height: 10),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//
//             children: [
//               Text(
//                 S.of(context).notAMember,
//                 style: Theme.of(
//                   context,
//                 ).textTheme.titleMedium!.copyWith(color: AppColors.grey),
//               ),
//               TextButton(
//                 style: TextButton.styleFrom(foregroundColor: AppColors.black),
//                 onPressed: () {},
//                 child: Text(
//                   S.of(context).createAnAccount,
//                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(child: Divider(thickness: 0.5, color: colorScheme.outline)),
        SizedBox(width: 20.w),
        Text(S.of(context).or),
        SizedBox(width: 20.w),
        Expanded(child: Divider(thickness: 0.5, color: colorScheme.outline)),
      ],
    );
  }
}

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(AppImages.googleIcon), width: 20.w),
          SizedBox(width: 20.w),
          Text(
            S.of(context).signInWithGoogle,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
