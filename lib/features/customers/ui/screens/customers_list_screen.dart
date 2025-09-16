import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/customers/demo/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/widgets/cards/customers_header_widget.dart';
import 'package:invotek/features/customers/ui/widgets/lists/customers_state_builder.dart';
import 'package:invotek/features/customers/ui/widgets/cards/customer_options_bottom_sheet.dart';
import 'package:invotek/features/customers/ui/widgets/dialogs/delete_customer_dialog.dart';
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
  final _scrollController = ScrollController();
  String? _selectedStatus;
  String? _selectedCompany;

  @override
  void initState() {
    super.initState();
    _initializeOptions();
    _scrollController.addListener(_onScroll);
  }

  void _initializeOptions() {
    _selectedStatus = 'all_status';
    _selectedCompany = 'all_company';
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Load more when user is 200 pixels from the bottom
      final cubit = context.read<CustomersCubit>();
      if (cubit.hasMore) {
        cubit.loadNextPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocListener<CustomersCubit, CustomersState>(
        listener: (context, state) {
          print('🔄 CustomersListScreen received state: ${state.runtimeType}');
          state.whenOrNull(
            deleteSuccess:
                (
                  customers,
                  deletedId,
                  selectedCustomer,
                  currentPage,
                  totalPages,
                ) {
                  print(
                    '✅ DeleteSuccess received with ${customers.length} customers, deletedId: $deletedId',
                  );
                  // Customer deleted successfully - UI will update automatically
                  // No need to show SnackBar here as it's handled in the delete confirmation
                },
          );
        },
        child: RefreshIndicator(
          onRefresh: () async {
            CustomersCubit.get(context).loadFirstPage(refresh: true);
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                // Header Widget - Scrolls with content
                CustomersHeaderWidget(
                  onMenuPressed: _handleMenuPressed,
                  searchController: _searchController,
                  onSearchChanged: (query) {
                    // CustomersCubit.get(context).loadFirstPage(
                    //   refresh: true,
                    //   search: query.isEmpty ? null : query,
                    //   status: _selectedStatus == 'all_status'
                    //       ? null
                    //       : _selectedStatus,
                    //   company: _selectedCompany == 'all_company'
                    //       ? null
                    //       : _selectedCompany,
                    // );
                  },
                  selectedStatus: _selectedStatus ?? '',
                  selectedCompany: _selectedCompany ?? '',
                  onStatusChanged: _onStatusChanged,
                  onCompanyChanged: _onCompanyChanged,
                ),

                // Customers List Content
                CustomersStateBuilder(
                  onCustomerTap: (customer) =>
                      _showCustomerOptions(context, customer),
                  onCustomerView: _navigateToCustomerDetails,
                  onCustomerEdit: _navigateToEditCustomer,
                  onCustomerDelete: _showDeleteConfirmation,
                  onAddCustomer: _navigateToAddCustomer,
                  onRetry: _retry,
                  selectedStatus: _selectedStatus ?? '',
                  selectedCompany: _selectedCompany ?? '',
                  onStatusChanged: _onStatusChanged,
                  onCompanyChanged: _onCompanyChanged,
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddCustomer,
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(Icons.add, size: 26.sp, color: AppColors.white),
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
        // CustomersCubit.get(context).loadFirstPage(
        //   refresh: true,
        //   search: " query.isEmpty ? null : query",
        //   status: _selectedStatus == 'all_status' ? null : _selectedStatus,
        //   company: _selectedCompany == 'all_company' ? null : _selectedCompany,
        // );
      }
    }
  }

  void _onStatusChanged(String? status) {
    setState(() => _selectedStatus = status);
    // CustomersCubit.get(context).loadFirstPage(
    //   refresh: true,
    //   search: _searchController.text.isEmpty ? null : _searchController.text,
    //   status: _selectedStatus == 'all_status' ? null : _selectedStatus,
    //   company: _selectedCompany == 'all_company' ? null : _selectedCompany,
    // );
  }

  void _onCompanyChanged(String? company) {
    setState(() => _selectedCompany = company);
    // CustomersCubit.get(context).loadFirstPage(
    //   refresh: true,
    //   search: _searchController.text.isEmpty ? null : _searchController.text,
    //   status: _selectedStatus == 'all_status' ? null : _selectedStatus,
    //   company: _selectedCompany == 'all_company' ? null : _selectedCompany,
    // );
  }

  void _retry() {
    //  CustomersCubit.get(context).loadFirstPage(refresh: true);
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
    // Capture the cubit before showing the dialog
    final customersCubit = CustomersCubit.get(context);

    showDialog(
      context: context,
      builder: (context) => DeleteCustomerDialog(
        customer: customer,
        onConfirm: () {
          customersCubit.deleteCustomer(customer.id);
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
        },
      ),
    );
  }
}
