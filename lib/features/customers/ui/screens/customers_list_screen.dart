import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/di/init_dependencies_map.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/customers/demo/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/widgets/customers_app_bar.dart';
import 'package:invotek/features/customers/ui/widgets/customers_search_and_filters.dart';
import 'package:invotek/features/customers/ui/widgets/customers_state_builder.dart';
import 'package:invotek/features/customers/ui/widgets/customer_options_bottom_sheet.dart';
import 'package:invotek/features/customers/ui/widgets/delete_customer_dialog.dart';
import 'package:invotek/features/customers/ui/widgets/search_bar_delegate.dart';
import 'package:invotek/generated/l10n.dart';

class CustomersListScreen extends StatefulWidget {
  const CustomersListScreen({super.key});

  @override
  State<CustomersListScreen> createState() => _CustomersListScreenState();
}

class CustomersListScreenWithProvider extends StatelessWidget {
  const CustomersListScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomersListScreen();
  }
}

class _CustomersListScreenState extends State<CustomersListScreen> {
  final _searchController = TextEditingController();
  String? _selectedStatus;
  String? _selectedCompany;

  @override
  void initState() {
    super.initState();
    _initializeOptions();
  }

  void _initializeOptions() {
    _selectedStatus = 'all_status';
    _selectedCompany = 'all_company';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          // App Bar
          CustomersAppBar(
            onMenuPressed: _handleMenuPressed,
            onAddPressed: _navigateToAddCustomer,
          ),

          // Search and Filters
          SliverPersistentHeader(
            pinned: true,
            delegate: SearchBarDelegate(
              child: CustomersSearchAndFilters(
                searchController: _searchController,
                selectedStatus: _selectedStatus ?? '',
                selectedCompany: _selectedCompany ?? '',
                onSearchChanged: _onSearchChanged,
                onStatusChanged: _onStatusChanged,
                onCompanyChanged: _onCompanyChanged,
                onClearFilters: _clearFilters,
              ),
            ),
          ),

          // Customers List
          CustomersStateBuilder(
            onCustomerTap: (customer) =>
                _showCustomerOptions(context, customer),
            onCustomerView: _navigateToCustomerDetails,
            onCustomerEdit: _navigateToEditCustomer,
            onCustomerDelete: _showDeleteConfirmation,
            onAddCustomer: _navigateToAddCustomer,
            onRetry: _retry,
          ),

          // Bottom spacing
          SliverToBoxAdapter(child: SizedBox(height: 16.h)),
        ],
      ),
    );
  }

  // Event Handlers
  void _handleMenuPressed() {
    try {
      final zoomDrawer = ZoomDrawer.of(context);
      if (zoomDrawer != null) {
        zoomDrawer.toggle();
      } else {
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        } else {
          Navigator.of(context).pushReplacementNamed('/home');
        }
      }
    } catch (e) {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      } else {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    }
  }

  void _onSearchChanged(String query) {
    CustomersCubit.get(context).loadFirstPage(
      refresh: true,
      search: query.isEmpty ? null : query,
      status: _selectedStatus == 'all_status' ? null : _selectedStatus,
      company: _selectedCompany == 'all_company' ? null : _selectedCompany,
    );
  }

  void _onStatusChanged(String? status) {
    setState(() => _selectedStatus = status);
    CustomersCubit.get(context).loadFirstPage(
      refresh: true,
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: _selectedStatus == 'all_status' ? null : _selectedStatus,
      company: _selectedCompany == 'all_company' ? null : _selectedCompany,
    );
  }

  void _onCompanyChanged(String? company) {
    setState(() => _selectedCompany = company);
    CustomersCubit.get(context).loadFirstPage(
      refresh: true,
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: _selectedStatus == 'all_status' ? null : _selectedStatus,
      company: _selectedCompany == 'all_company' ? null : _selectedCompany,
    );
  }

  void _clearFilters() {
    setState(() {
      _searchController.clear();
      _selectedStatus = 'all_status';
      _selectedCompany = 'all_company';
    });
    CustomersCubit.get(context).loadFirstPage(refresh: true);
  }

  void _retry() {
    CustomersCubit.get(context).loadFirstPage(refresh: true);
  }

  // Navigation Methods
  void _navigateToAddCustomer() {
    Navigator.pushNamed(context, AppRoutes.addCustomerRoute);
  }

  void _navigateToCustomerDetails(CustomerModel customer) async {
    final result = await Navigator.pushNamed(
      context,
      AppRoutes.customerDetailsRoute,
      arguments: customer,
    );

    // Handle deletion result
    if (result == 'deleted' && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).customerDeletedSuccessfully),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      );
    }
  }

  void _navigateToEditCustomer(CustomerModel customer) {
    Navigator.pushNamed(
      context,
      AppRoutes.editCustomerRoute,
      arguments: customer,
    );
  }

  void _showCustomerOptions(BuildContext context, CustomerModel customer) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      builder: (context) => CustomerOptionsBottomSheet(
        customer: customer,
        onViewDetails: () {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            AppRoutes.customerDetailsRoute,
            arguments: customer,
          );
        },
        onEdit: () {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            AppRoutes.editCustomerRoute,
            arguments: customer,
          );
        },
        onDelete: () {
          Navigator.pop(context);
          _showDeleteConfirmation(customer);
        },
      ),
    );
  }

  void _showDeleteConfirmation(CustomerModel customer) {
    showDialog(
      context: context,
      builder: (context) => DeleteCustomerDialog(
        customer: customer,
        onConfirm: () {
          CustomersCubit.get(context).deleteCustomer(customer.id);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).customerDeletedSuccessfully)),
          );
        },
      ),
    );
  }
}
