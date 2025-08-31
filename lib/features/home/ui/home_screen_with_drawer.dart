import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/app_images.dart';
import 'package:invotek/features/clients/ui/screens/add_client_screen.dart';
import 'package:invotek/features/clients/ui/screens/clients_list_screen.dart';
import 'package:invotek/features/home/demo/cubit/menu_cubit.dart';
import 'package:invotek/features/home/ui/home_screen.dart';
import 'package:invotek/features/home/ui/widgets/menu_screen.dart';
import 'package:invotek/features/products/demo/entit/product_model.dart';
import 'package:invotek/features/products/ui/screens/add_product_screen.dart';
import 'package:invotek/features/products/ui/screens/edit_product_screen.dart';
import 'package:invotek/features/products/ui/screens/product_details_screen.dart';
import 'package:invotek/features/products/ui/screens/products_list_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/add_user_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/manage_permissions_screen.dart';
import 'package:invotek/features/users_and_permissions/ui/screens/users_permissions_screen.dart';

class HomeScreenWithDrawer extends StatelessWidget {
  const HomeScreenWithDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuCubit(),
      child: ZoomDrawer(
        controller: ZoomDrawerController(),
        menuScreen: const MenuScreen(),
        mainScreen: const HomeScreenWithAppBar(),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        slideWidth: MediaQuery.of(context).size.width * 0.85,
        menuBackgroundColor: AppColors.primary,
        duration: const Duration(milliseconds: 275),
        mainScreenScale: 0.3,
        mainScreenTapClose: true,
      ),
    );
  }
}

class HomeScreenWithAppBar extends StatelessWidget {
  const HomeScreenWithAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MenuCubit, MenuState>(
        builder: (context, state) {
          // تحديد الشاشة بناءً على المسار الحالي
          switch (state.currentRoute) {
            case AppRoutes.usersPermissionsRoute:
              return const UsersPermissionsScreenWithProvider();
            case '/users/list':
              return const UsersPermissionsScreenWithProvider();
            case '/users/add':
              return const AddUserScreenWithProvider();
            case '/users/permissions':
              return const ManagePermissionsScreenWithProvider();
            case '/clients/list':
              return const ClientsListScreenWithProvider();
            case '/clients/add':
              return const AddClientScreenWithProvider();
            case '/products/list':
              return const ProductsListScreenWithProvider();
            case '/products/add':
              return const AddProductScreenWithProvider();
            case '/products/edit':
              final args = state.routeArguments;
              if (args is Product) {
                return EditProductScreenWithProvider(product: args);
              }
              return const HomeScreen();
            case '/products/details':
              final args = state.routeArguments;
              if (args is Product) {
                return ProductDetailsScreen(product: args);
              }
              return const HomeScreen();
            case '/home':
            default:
              return const HomeScreen();
          }
        },
      ),
    );
  }
}
