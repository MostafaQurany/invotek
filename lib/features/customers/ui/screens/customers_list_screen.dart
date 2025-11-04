import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/common_filters_bottom_sheet.dart';
import 'package:invotek/features/customers/domain/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/screens/add_customer_screen.dart';
import 'package:invotek/features/customers/ui/screens/edit_customer_screen.dart';
import 'package:invotek/features/customers/ui/widgets/cards/customer_options_bottom_sheet.dart';
import 'package:invotek/features/customers/ui/widgets/cards/customers_header_widget.dart';
import 'package:invotek/features/customers/ui/widgets/dialogs/delete_customer_dialog.dart';
import 'package:invotek/features/customers/ui/widgets/lists/customers_state_builder.dart';
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
  String? _selectedSortBy;
  String? _selectedSortOrder;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _initializeOptions();
    _scrollController.addListener(_onScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      CustomersCubit.get(context).loadFirstPage(refresh: true);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    FocusScope.of(context).unfocus();
  }

  void _initializeOptions() {
    _selectedStatus = 'all_status';
    _selectedCompany = 'all_company';
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) {
      print('❌ ScrollController has no clients!');
      return;
    }

    final position = _scrollController.position;
    final pixels = position.pixels;
    final maxScrollExtent = position.maxScrollExtent;

    print('🔄 Scroll: $pixels / $maxScrollExtent');
    print('🔄 ScrollController hasClients: ${_scrollController.hasClients}');
    print('🔄 ScrollController attached: ${_scrollController.hasClients}');

    // Check if we're near the bottom (within 200 pixels)
    if (pixels >= maxScrollExtent - 200) {
      final cubit = context.read<CustomersCubit>();
      print(
        '📄 Near bottom! hasMore: ${cubit.hasMore}, currentPage: ${cubit.currentPage}, totalPages: ${cubit.totalPages}',
      );

      if (cubit.hasMore) {
        print('🚀 Loading next page...');
        cubit.loadNextPage();
      } else {
        print('❌ No more pages to load');
      }
    }
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      _loadWithAllFilters(search: query.isEmpty ? null : query);
    });
  }

  void _loadWithAllFilters({String? search}) {
    try {
      final cubit = CustomersCubit.get(context);
      if (!cubit.isClosed) {
        cubit.loadFirstPage(
          refresh: true,
          search:
              search ??
              (_searchController.text.isEmpty ? null : _searchController.text),
          status: _selectedStatus == 'all_status' ? null : _selectedStatus,
          company: _selectedCompany == 'all_company' ? null : _selectedCompany,
          sortBy: _selectedSortBy,
          sortOrder: _selectedSortOrder,
        );
      }
    } catch (e) {
      print('❌ Error loading filters: $e');
    }
  }

  void _showFiltersBottomSheet() {
    final s = S.of(context);

    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      ),
      builder: (context) => CommonFiltersBottomSheet(
        title: s.filterCustomers,
        filterGroups: [
          // Status Filter
          FilterGroup(
            key: 'status',
            label: s.customerStatus,
            initialValue: _selectedStatus == 'all_status'
                ? null
                : _selectedStatus,
            options: [
              FilterOption(value: null, label: s.all),
              FilterOption(value: 'active', label: s.activeStatus),
              FilterOption(value: 'inactive', label: s.inactiveStatus),
            ],
          ),
          // Sort By Filter
          FilterGroup(
            key: 'sort_by',
            label: s.sortBy,
            initialValue: _selectedSortBy,
            options: [
              FilterOption(value: null, label: s.all),
              FilterOption(value: 'created_at', label: s.sortByCreatedAt),
              FilterOption(value: 'updated_at', label: s.sortByUpdatedAt),
            ],
          ),
          // Sort Order Filter
          FilterGroup(
            key: 'sort_order',
            label: s.sortOrder,
            initialValue: _selectedSortOrder,
            options: [
              FilterOption(value: 'asc', label: s.ascending),
              FilterOption(value: 'desc', label: s.descending),
            ],
          ),
        ],
        onApply: (selectedFilters) {
          setState(() {
            _selectedStatus = selectedFilters['status'] ?? 'all_status';
            _selectedSortBy = selectedFilters['sort_by'];
            _selectedSortOrder = selectedFilters['sort_order'];
          });

          _loadWithAllFilters();
        },
        onReset: () {
          setState(() {
            _selectedStatus = 'all_status';
            _selectedSortBy = null;
            _selectedSortOrder = null;
          });
        },
      ),
    );
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
            try {
              final cubit = CustomersCubit.get(context);
              if (!cubit.isClosed) {
                await cubit.loadFirstPage(refresh: true);
              }
            } catch (e) {
              print('❌ Error refreshing: $e');
              // If cubit is closed, we can't refresh
            }
          },
          child: Column(
            children: [
              // Header Widget - Scrolls with content
              CustomersHeaderWidget(
                onMenuPressed: _handleMenuPressed,
                searchController: _searchController,
                onSearchChanged: _onSearchChanged,
                selectedStatus: _selectedStatus ?? 'all_status',
                selectedCompany: _selectedCompany ?? 'all_company',
                onStatusChanged: _onStatusChanged,
                onCompanyChanged: _onCompanyChanged,
                onFilterPressed: _showFiltersBottomSheet,
              ),

              // Customers List Content
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28.r),
                      topRight: Radius.circular(28.r),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(28.r),
                      topRight: Radius.circular(28.r),
                    ),
                    child: CustomersStateBuilder(
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
                      scrollController: _scrollController,
                    ),
                  ),
                ),
              ),
            ],
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
    _loadWithAllFilters();
  }

  void _onCompanyChanged(String? company) {
    setState(() => _selectedCompany = company);
    _loadWithAllFilters();
  }

  void _retry() {
    _loadWithAllFilters();
  }

  // Navigation Methods
  void _navigateToAddCustomer() {
    final customersCubit = CustomersCubit.get(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AddCustomerScreenWithProvider(cubit: customersCubit),
      ),
    );
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
          final customersCubit = CustomersCubit.get(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditCustomerScreenWithProvider(
                customer: customer,
                cubit: customersCubit,
              ),
            ),
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
