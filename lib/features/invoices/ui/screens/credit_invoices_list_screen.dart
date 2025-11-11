import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';
import 'package:invotek/features/invoices/constants/invoices_permissions.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/invoices/demo/cubit/credit_invoices_cubit.dart';
import 'package:invotek/features/invoices/ui/widgets/bottomsheets/invoices_filters_bottom_sheet.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoices_header_widget.dart';
import 'package:invotek/features/invoices/ui/widgets/lists/credit_invoices_state_builder.dart';
import 'package:invotek/generated/l10n.dart';

class CreditInvoicesListScreenWithProvider extends StatelessWidget {
  const CreditInvoicesListScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreditInvoicesCubit>.value(
      value: getIt<CreditInvoicesCubit>(),
      child: const CreditInvoicesListScreen(),
    );
  }
}

class CreditInvoicesListScreen extends StatefulWidget {
  const CreditInvoicesListScreen({super.key});

  @override
  State<CreditInvoicesListScreen> createState() =>
      _CreditInvoicesListScreenState();
}

class _CreditInvoicesListScreenState extends State<CreditInvoicesListScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  String? _selectedStatus;
  String? _selectedPaymentMethod;
  String? _selectedCustomer;
  String? _sortOrder;
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
    _initializeOptions();
    context.read<CreditInvoicesCubit>().loadFirstPage(
      refresh: true,
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: _selectedStatus == 'all' ? null : _selectedStatus,
      paymentMethod: _selectedPaymentMethod == 'all'
          ? null
          : _selectedPaymentMethod,
      customerId: _selectedCustomer == 'all' ? null : _selectedCustomer,
      sortBy: 'created_at',
      sortOrder: _sortOrder,
    );
    _setupScrollListener();
  }

  void _initializeOptions() {
    _selectedStatus = 'all';
    _selectedPaymentMethod = 'all';
    _selectedCustomer = 'all';
    _sortOrder = 'desc';
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * 0.8) {
        _loadMoreInvoices();
      }
    });
  }

  void _loadMoreInvoices() {
    if (!_isNavigating) {
      context.read<CreditInvoicesCubit>().loadNextPage();
    }
  }

  void _onSearchChanged(String query) {
    if (query.length >= 2 || query.isEmpty) {
      context.read<CreditInvoicesCubit>().loadFirstPage(
        search: query.isEmpty ? null : query,
        status: _selectedStatus == 'all' ? null : _selectedStatus,
        paymentMethod: _selectedPaymentMethod == 'all'
            ? null
            : _selectedPaymentMethod,
        customerId: _selectedCustomer == 'all' ? null : _selectedCustomer,
        sortBy: 'created_at',
        sortOrder: _sortOrder,
      );
    }
  }

  void _onStatusChanged(String? status) {
    if (mounted) {
      setState(() {
        _selectedStatus = status;
      });
    }
    context.read<CreditInvoicesCubit>().loadFirstPage(
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: status == 'all' ? null : status,
      paymentMethod: _selectedPaymentMethod == 'all'
          ? null
          : _selectedPaymentMethod,
      customerId: _selectedCustomer == 'all' ? null : _selectedCustomer,
      sortBy: 'created_at',
      sortOrder: _sortOrder,
    );
  }

  void _onPaymentMethodChanged(String? paymentMethod) {
    if (mounted) {
      setState(() {
        _selectedPaymentMethod = paymentMethod;
      });
    }
    context.read<CreditInvoicesCubit>().loadFirstPage(
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: _selectedStatus == 'all' ? null : _selectedStatus,
      paymentMethod: paymentMethod == 'all' ? null : paymentMethod,
      customerId: _selectedCustomer == 'all' ? null : _selectedCustomer,
      sortBy: 'created_at',
      sortOrder: _sortOrder,
    );
  }

  void _onCustomerChanged(String? customer) {
    if (mounted) {
      setState(() {
        _selectedCustomer = customer;
      });
    }
    context.read<CreditInvoicesCubit>().loadFirstPage(
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: _selectedStatus == 'all' ? null : _selectedStatus,
      paymentMethod: _selectedPaymentMethod == 'all'
          ? null
          : _selectedPaymentMethod,
      customerId: customer == 'all' ? null : customer,
      sortBy: 'created_at',
      sortOrder: _sortOrder,
    );
  }

  void _onRefresh() {
    context.read<CreditInvoicesCubit>().loadFirstPage(
      refresh: true,
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: _selectedStatus == 'all' ? null : _selectedStatus,
      paymentMethod: _selectedPaymentMethod == 'all'
          ? null
          : _selectedPaymentMethod,
      customerId: _selectedCustomer == 'all' ? null : _selectedCustomer,
      sortBy: 'created_at',
      sortOrder: _sortOrder,
    );
  }

  void _onInvoiceTap(InvoiceModel invoice) {
    if (!_isNavigating && mounted) {
      setState(() {
        _isNavigating = true;
      });
      Navigator.pushNamed(
        context,
        AppRoutes.enhancedInvoiceDetailsRoute,
        arguments: invoice.id?.toString() ?? '0',
      ).then((_) {
        if (mounted) {
          setState(() {
            _isNavigating = false;
          });
        }
      });
    }
  }

  void _onInvoiceView(InvoiceModel invoice) => _onInvoiceTap(invoice);

  void _onInvoiceEdit(InvoiceModel invoice) {}
  void _onInvoiceDelete(InvoiceModel invoice) {}
  void _onAddInvoice() {}

  void _onRetry() => _onRefresh();

  void _openFilters() async {
    final result = await showModalBottomSheet<InvoicesFiltersResult>(
      context: context,
      builder: (context) => InvoicesFiltersBottomSheet(
        initialStatus: _selectedStatus ?? 'all',
        initialSortOrder: _sortOrder ?? 'desc',
      ),
    );

    if (result != null && mounted) {
      setState(() {
        _selectedStatus = result.status;
        _sortOrder = result.sortOrder;
      });
      _onRefresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    
    return PermissionWidget(
      permission: InvoicesPermissions.view,
      fallback: Center(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_outline,
                size: 64.sp,
                color: AppColors.textSecondary,
              ),
              SizedBox(height: 16.h),
              Text(
                s.invoicesNoPermissionToView,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (!didPop) {
            final canPop = Navigator.of(context).canPop();
            if (canPop) {
              // السماح بالرجوع العادي بدون dialog
              Navigator.of(context).pop();
            } else {
              // فتح zoomDrawer والانتقال إلى home
              try {
                final zoomDrawer = ZoomDrawer.of(context);
                if (zoomDrawer != null) {
                  // إغلاق zoomDrawer إذا كان مفتوحاً
                  if (zoomDrawer.isOpen()) {
                    zoomDrawer.close();
                  }
                  // الانتقال إلى home باستخدام NavigationCubit
                  context.read<NavigationCubit>().navigateToRoute(AppRoutes.homeRoute);
                } else {
                  // Fallback: الانتقال إلى home مباشرة
                  Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
                }
              } catch (e) {
                // Fallback: الانتقال إلى home مباشرة
                Navigator.of(context).pushReplacementNamed(AppRoutes.homeRoute);
              }
            }
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: _HeaderDelegate(
                  min: 150.h,
                  max: 150.h,
                  child: InvoicesHeaderWidget(
                    title: s.creditInvoicesTitle,
                    searchController: _searchController,
                    onSearchChanged: _onSearchChanged,
                    selectedStatus: _selectedStatus,
                    selectedPaymentMethod: _selectedPaymentMethod,
                    selectedCustomer: _selectedCustomer,
                    onStatusChanged: _onStatusChanged,
                    onPaymentMethodChanged: _onPaymentMethodChanged,
                    onCustomerChanged: _onCustomerChanged,
                    onRefresh: _onRefresh,
                    onOpenFilters: _openFilters,
                  ),
                ),
              ),
              CreditInvoicesStateBuilder(
                onInvoiceTap: _onInvoiceTap,
                onInvoiceView: _onInvoiceView,
                onInvoiceEdit: _onInvoiceEdit,
                onInvoiceDelete: _onInvoiceDelete,
                onAddInvoice: _onAddInvoice,
                onRetry: _onRetry,
                selectedStatus: _selectedStatus ?? 'all',
                selectedPaymentMethod: _selectedPaymentMethod ?? 'all',
                selectedCustomer: _selectedCustomer ?? 'all',
                onStatusChanged: _onStatusChanged,
                onPaymentMethodChanged: _onPaymentMethodChanged,
                onCustomerChanged: _onCustomerChanged,
              ),
            ],
          ),
        ),
          floatingActionButton: const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  _HeaderDelegate({required this.child, required this.min, required this.max});
  final Widget child;
  final double min;
  final double max;

  @override
  double get minExtent => min;

  @override
  double get maxExtent => max;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox(
      height: maxExtent,
      child: Material(color: AppColors.white, child: child),
    );
  }

  @override
  bool shouldRebuild(covariant _HeaderDelegate old) =>
      old.child != child || old.min != min || old.max != max;
}
