import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/invoices/demo/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/invoices/ui/screens/edit_invoice_screen.dart';
import 'package:invotek/features/invoices/ui/widgets/cards/invoices_header_widget.dart';
import 'package:invotek/features/invoices/ui/widgets/lists/invoices_state_builder.dart';
import 'package:invotek/features/invoices/ui/widgets/dialogs/delete_invoice_dialog.dart';
import 'package:invotek/core/routes/app_routes.dart';
import 'package:invotek/core/utils/permission_helper.dart';
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
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
    _initializeOptions();
    _setupScrollListener();
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
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreInvoices() {
    if (!_isNavigating) {
      context.read<InvoicesCubit>().loadNextPage();
    }
  }

  void _onSearchChanged(String query) {
    if (query.length >= 2 || query.isEmpty) {
      context.read<InvoicesCubit>().loadFirstPage(
        search: query.isEmpty ? null : query,
        status: _selectedStatus == 'all' ? null : _selectedStatus,
        paymentMethod: _selectedPaymentMethod == 'all'
            ? null
            : _selectedPaymentMethod,
        customerId: _selectedCustomer == 'all' ? null : _selectedCustomer,
      );
    }
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
    );
  }

  void _onRefresh() {
    context.read<InvoicesCubit>().loadFirstPage(
      refresh: true,
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: _selectedStatus == 'all' ? null : _selectedStatus,
      paymentMethod: _selectedPaymentMethod == 'all'
          ? null
          : _selectedPaymentMethod,
      customerId: _selectedCustomer == 'all' ? null : _selectedCustomer,
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

  void _onInvoiceView(InvoiceModel invoice) {
    _onInvoiceTap(invoice);
  }

  void _onInvoiceEdit(InvoiceModel invoice) {
    if (!_isNavigating && mounted) {
      setState(() {
        _isNavigating = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditInvoiceScreen(invoice: invoice),
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

  void _onInvoiceDelete(InvoiceModel invoice) {
    showDialog(
      context: context,
      builder: (context) => DeleteInvoiceDialog(
        invoice: invoice,
        onDelete: () {
          context.read<InvoicesCubit>().deleteInvoice(invoice.id ?? 0);
        },
      ),
    );
  }

  void _onAddInvoice() {
    if (!_isNavigating && mounted) {
      setState(() {
        _isNavigating = true;
      });
      Navigator.pushNamed(context, AppRoutes.invoiceCreationStepperRoute).then((
        _,
      ) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // Header with Search and Filters
            SliverToBoxAdapter(
              child: InvoicesHeaderWidget(
                searchController: _searchController,
                onSearchChanged: _onSearchChanged,
                selectedStatus: _selectedStatus,
                selectedPaymentMethod: _selectedPaymentMethod,
                selectedCustomer: _selectedCustomer,
                onStatusChanged: _onStatusChanged,
                onPaymentMethodChanged: _onPaymentMethodChanged,
                onCustomerChanged: _onCustomerChanged,
                onRefresh: _onRefresh,
              ),
            ),

            // Invoices List with State Management
            InvoicesStateBuilder(
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
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // زر الطباعة - يظهر فقط إذا كان لديه صلاحية
          PermissionWidget(
            permission: PermissionKeys.taxInvoicesPrint,
            child: FloatingActionButton(
              heroTag: "print_all",
              onPressed: _showPrintAllOptions,
              backgroundColor: AppColors.warning,
              child: const Icon(Icons.print, color: Colors.white),
            ),
          ),
          SizedBox(height: 8.h),
          // زر إضافة الفاتورة - يظهر فقط إذا كان لديه صلاحية
          PermissionWidget(
            permission: PermissionKeys.taxInvoicesCreate,
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
        ],
      ),
    );
  }

  void _showPrintAllOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'خيارات الطباعة',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: Icon(Icons.receipt, color: AppColors.primary),
              title: Text('طباعة جميع الفواتير حرارياً'),
              subtitle: Text('طباعة جميع الفواتير على الطابعة الحرارية'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement print all thermal
              },
            ),
            ListTile(
              leading: Icon(Icons.picture_as_pdf, color: AppColors.success),
              title: Text('إنشاء PDF لجميع الفواتير'),
              subtitle: Text('إنشاء ملف PDF يحتوي على جميع الفواتير'),
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement print all PDF
              },
            ),
          ],
        ),
      ),
    );
  }
}
