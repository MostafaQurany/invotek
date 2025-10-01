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
import 'package:invotek/features/invoices/ui/screens/add_invoice_screen.dart';
import 'package:invotek/features/invoices/ui/screens/invoice_details_screen.dart';

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
        paymentMethod: _selectedPaymentMethod == 'all' ? null : _selectedPaymentMethod,
        customerId: _selectedCustomer == 'all' ? null : _selectedCustomer,
      );
    }
  }

  void _onStatusChanged(String? status) {
    setState(() {
      _selectedStatus = status;
    });
    context.read<InvoicesCubit>().loadFirstPage(
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: status == 'all' ? null : status,
      paymentMethod: _selectedPaymentMethod == 'all' ? null : _selectedPaymentMethod,
      customerId: _selectedCustomer == 'all' ? null : _selectedCustomer,
    );
  }

  void _onPaymentMethodChanged(String? paymentMethod) {
    setState(() {
      _selectedPaymentMethod = paymentMethod;
    });
    context.read<InvoicesCubit>().loadFirstPage(
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: _selectedStatus == 'all' ? null : _selectedStatus,
      paymentMethod: paymentMethod == 'all' ? null : paymentMethod,
      customerId: _selectedCustomer == 'all' ? null : _selectedCustomer,
    );
  }

  void _onCustomerChanged(String? customer) {
    setState(() {
      _selectedCustomer = customer;
    });
    context.read<InvoicesCubit>().loadFirstPage(
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: _selectedStatus == 'all' ? null : _selectedStatus,
      paymentMethod: _selectedPaymentMethod == 'all' ? null : _selectedPaymentMethod,
      customerId: customer == 'all' ? null : customer,
    );
  }

  void _onRefresh() {
    context.read<InvoicesCubit>().loadFirstPage(
      refresh: true,
      search: _searchController.text.isEmpty ? null : _searchController.text,
      status: _selectedStatus == 'all' ? null : _selectedStatus,
      paymentMethod: _selectedPaymentMethod == 'all' ? null : _selectedPaymentMethod,
      customerId: _selectedCustomer == 'all' ? null : _selectedCustomer,
    );
  }

  void _onInvoiceTap(InvoiceModel invoice) {
    if (!_isNavigating) {
      setState(() {
        _isNavigating = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InvoiceDetailsScreen(invoice: invoice),
        ),
      ).then((_) {
        setState(() {
          _isNavigating = false;
        });
      });
    }
  }

  void _onInvoiceView(InvoiceModel invoice) {
    _onInvoiceTap(invoice);
  }

  void _onInvoiceEdit(InvoiceModel invoice) {
    if (!_isNavigating) {
      setState(() {
        _isNavigating = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditInvoiceScreen(invoice: invoice),
        ),
      ).then((_) {
        setState(() {
          _isNavigating = false;
        });
      });
    }
  }

  void _onInvoiceDelete(InvoiceModel invoice) {
    showDialog(
      context: context,
      builder: (context) => DeleteInvoiceDialog(
        invoice: invoice,
        onDelete: () {
          context.read<InvoicesCubit>().deleteInvoice(invoice.id);
        },
      ),
    );
  }

  void _onAddInvoice() {
    if (!_isNavigating) {
      setState(() {
        _isNavigating = true;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddInvoiceScreen(),
        ),
      ).then((_) {
        setState(() {
          _isNavigating = false;
        });
      });
    }
  }

  void _onRetry() {
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _onAddInvoice,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: Text(
          'إضافة فاتورة',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
