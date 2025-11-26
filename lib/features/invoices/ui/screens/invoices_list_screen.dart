import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/utils/permission_helper.dart';
import 'package:invotek/features/home/cubit/navigation_cubit.dart';
import 'package:invotek/features/invoices/constants/invoices_permissions.dart';
import 'package:invotek/features/invoices/domain/entities/invoice_entity.dart';
import 'package:invotek/features/invoices/domain/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/ui/screens/invoice_form_screen_with_provider.dart';
import 'package:invotek/features/invoices/ui/widgets/bottomsheets/invoices_filters_bottom_sheet.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoices_header_widget.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/delete_invoice_dialog.dart';
import 'package:invotek/features/invoices/ui/widgets/lists/invoices_state_builder.dart';
import 'package:invotek/features/settings/cubit/tax_integration_cubit.dart';
import 'package:invotek/generated/l10n.dart';

class InvoicesListScreen extends StatefulWidget {
  const InvoicesListScreen({super.key});

  @override
  State<InvoicesListScreen> createState() => _InvoicesListScreenState();
}

class InvoicesListScreenWithProvider extends StatelessWidget {
  const InvoicesListScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const InvoicesListScreen();
  }
}

class _InvoicesListScreenState extends State<InvoicesListScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  String? _selectedStatus;
  String? _selectedPaymentMethod;
  String? _selectedCustomer;
  String? _sortOrder;
  bool _isNavigating = false;
  Timer? _debounceTimer;

  @override
  void initState() {
    super.initState();
    _initializeOptions();
    _setupScrollListener();
    if (mounted) {
      context.read<InvoicesCubit>().loadFirstPage(
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
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * 0.8) {
        _loadMoreInvoices();
      }
    });
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
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _loadMoreInvoices() {
    if (!_isNavigating) {
      context.read<InvoicesCubit>().loadNextPage();
    }
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      if (query.length >= 2 || query.isEmpty) {
        context.read<InvoicesCubit>().loadFirstPage(
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
    });
  }

  void _onStatusChanged(String? status) {
    if (mounted) {
      setState(() {
        _selectedStatus = status;
      });
    }
    context.read<InvoicesCubit>().loadFirstPage(
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
    context.read<InvoicesCubit>().loadFirstPage(
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
    context.read<InvoicesCubit>().loadFirstPage(
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
    context.read<TaxIntegrationCubit>().loadStatus();
    context.read<InvoicesCubit>().loadFirstPage(
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

  void _onInvoiceTap(InvoiceEntity invoice) {
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

  void _onInvoiceView(InvoiceEntity invoice) {
    _onInvoiceTap(invoice);
  }

  void _onInvoiceEdit(InvoiceEntity invoice) {
    if (!_isNavigating && mounted) {
      // التحقق من التكامل الضريبي قبل الانتقال
      final taxState = context.read<TaxIntegrationCubit>().state;
      if (taxState is TaxIntegrationLoaded) {
        if (!taxState.status.taxIntegrationActive) {
          _showTaxIntegrationRequiredDialog();
          return; // منع الانتقال
        }
      }

      setState(() {
        _isNavigating = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InvoiceFormScreenWithProvider(invoice: invoice),
        ),
      ).then((_) {
        if (mounted) {
          setState(() {
            _isNavigating = false;
          });
        }
      });
    }
  }

  void _onInvoiceDelete(InvoiceEntity invoice) {
    showDialog(
      context: context,
      builder: (context) => DeleteInvoiceDialog(
        invoice: invoice,
        onDelete: () async {
          Navigator.pop(context); // Close dialog first
          await context.read<InvoicesCubit>().deleteInvoice(invoice.id ?? 0);
        },
      ),
    );
  }

  void _onInvoiceReturn(InvoiceEntity invoice) {
    if (!_isNavigating && mounted) {
      // التحقق من وجود فواتير إرجاع مرتبطة بالفاتورة
      final hasReturnedInvoices =
          invoice.returnedInvoices != null &&
          invoice.returnedInvoices!.isNotEmpty;

      if (hasReturnedInvoices) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).invoiceAlreadyHasCreditInvoice),
            backgroundColor: AppColors.warning,
          ),
        );
        return;
      }

      setState(() {
        _isNavigating = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              InvoiceFormScreenWithProvider(originalInvoice: invoice),
        ),
      ).then((_) {
        if (mounted) {
          setState(() {
            _isNavigating = false;
          });
          context.read<InvoicesCubit>().refreshCurrentFilters();
        }
      });
    }
  }

  void _onInvoiceSend(InvoiceEntity invoice) {
    if (!_isNavigating && mounted && invoice.id != null) {
      setState(() {
        _isNavigating = true;
      });
      context.read<InvoicesCubit>().sendInvoice(invoiceId: invoice.id!);
    }
  }

  void _onAddInvoice() {
    if (!_isNavigating && mounted) {
      // التحقق من التكامل الضريبي قبل الانتقال
      final taxState = context.read<TaxIntegrationCubit>().state;
      if (taxState is TaxIntegrationLoaded) {
        if (!taxState.status.taxIntegrationActive) {
          _showTaxIntegrationRequiredDialog();
          return; // منع الانتقال
        }
      }

      setState(() {
        _isNavigating = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InvoiceFormScreenWithProvider(),
        ),
      ).then((_) {
        if (mounted) {
          setState(() {
            _isNavigating = false;
          });
        }
      });
    }
  }

  void _onRetry() {
    _onRefresh();
  }

  void _showTaxIntegrationRequiredDialog() {
    final s = S.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(s.taxIntegrationNotActive),
        content: Text(s.taxIntegrationNotActiveMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(s.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, AppRoutes.settingsRoute);
            },
            child: Text(s.goToSettings),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
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
                context.read<NavigationCubit>().navigateToRoute(
                  AppRoutes.homeRoute,
                );
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
      child: BlocListener<InvoicesCubit, InvoicesState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (invoices, selectedInvoice, currentPage, totalPages) {
              if (_isNavigating) {
                setState(() {
                  _isNavigating = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(S.of(context).invoiceSentSuccessfully),
                    backgroundColor: AppColors.success,
                  ),
                );
              }
            },
            failure:
                (invoices, selectedInvoice, currentPage, totalPages, failure) {
                  if (_isNavigating) {
                    setState(() {
                      _isNavigating = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(failure.message),
                        backgroundColor: AppColors.error,
                      ),
                    );
                  }
                },
            orElse: () {},
          );
        },
        child: Scaffold(
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                _onRefresh();
              },
              child: CustomScrollView(
                controller: _scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  // Header with Search and Filters
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _HeaderDelegate(
                      min: 150.h, // collapsed height
                      max: 150
                          .h, // same as min => no collapse, always fixed size
                      child: InvoicesHeaderWidget(
                        title: S.of(context).invoices,
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

                  // Invoices List with State Management
                  InvoicesStateBuilder(
                    onInvoiceTap: _onInvoiceTap,
                    onInvoiceView: _onInvoiceView,
                    onInvoiceEdit: _onInvoiceEdit,
                    onInvoiceDelete: _onInvoiceDelete,
                    onInvoiceReturn: _onInvoiceReturn,
                    onInvoiceSend: _onInvoiceSend,
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
          ),
          floatingActionButton: PermissionWidget(
            permission: InvoicesPermissions.create,
            fallback: Tooltip(
              message: S.of(context).invoicesNoPermissionToAct,
              child: FloatingActionButton.extended(
                heroTag: "add_invoice",
                onPressed: null,
                backgroundColor: AppColors.grey.withOpacity(0.5),
                foregroundColor: Colors.white.withOpacity(0.7),
                icon: const Icon(Icons.lock_outline),
                label: Text(
                  S.of(context).addInvoice,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            child: FloatingActionButton.extended(
              heroTag: "add_invoice",
              onPressed: _onAddInvoice,
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              icon: const Icon(Icons.add),
              label: Text(
                S.of(context).addInvoice,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Opens filters bottom sheet to select status and sort order
  void _openFilters() async {
    final result = await showModalBottomSheet<InvoicesFiltersResult>(
      context: context,
      useSafeArea: false,
      isScrollControlled: true,
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
      child: Material(
        // to get proper elevation/ink if needed
        color: AppColors.white,
        child: child,
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _HeaderDelegate old) =>
      old.child != child || old.min != min || old.max != max;
}
