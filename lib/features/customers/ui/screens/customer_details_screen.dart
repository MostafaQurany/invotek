import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/core/widgets/animated_entry_widget.dart';
import 'package:invotek/core/di/injection.dart';
import 'package:invotek/features/customers/domain/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/features/customers/domain/usecases/get_customer_invoices.dart';
import 'package:invotek/features/customers/ui/widgets/customer details widgets/widgets.dart';
import 'package:invotek/features/customers/ui/screens/customer_invoices_list_screen.dart';
import 'package:invotek/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:invotek/features/customers/constants/customers_permissions.dart';
import 'package:invotek/core/utils/permission_helper.dart';

class CustomerDetailsScreen extends StatefulWidget {
  final CustomerModel customer;

  const CustomerDetailsScreen({super.key, required this.customer});

  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  late CustomerInvoicesCubit _customerInvoicesCubit;

  @override
  void initState() {
    super.initState();
    _customerInvoicesCubit = CustomerInvoicesCubit(getIt<GetCustomerInvoices>())
      ..loadCustomerInvoices(widget.customer.id);
  }

  @override
  void dispose() {
    _customerInvoicesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customer = widget.customer;
    final colorScheme = Theme.of(context).colorScheme;
    final s = S.of(context);
    final hasViewPermission = PermissionChecker.hasPermission(
      context,
      CustomersPermissions.view,
    );

    if (!hasViewPermission) {
      return Scaffold(
        backgroundColor: colorScheme.surface,
        appBar: AppBar(
          title: Text(s.customerDetails),
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(32.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_outline,
                  size: 64.sp,
                  color: colorScheme.error,
                ),
                SizedBox(height: 24.h),
                Text(
                  s.customersNoPermissionToView,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
                Text(
                  s.customersNoPermissionToAct,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Modern Header with Animation
          SliverToBoxAdapter(
            child: CustomerDetailsHeader(
              customer: customer,
              onBackPressed: () => Navigator.pop(context),
              onHelpPressed: () => _showHelpDialog(),
            ),
          ),

          // Quick Actions with Animation
          SliverToBoxAdapter(
            child: CustomerQuickActions(
              onCall: () => _makeCall(),
              onEmail: () => _sendEmail(),
              onInvoices: () => _viewInvoices(),
              // onOrders: () => _viewOrders(),
            ),
          ),

          // Content Cards with Staggered Animation
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: StaggeredAnimatedList(
                staggerDelay: Duration(milliseconds: 150),
                children: [
                  CustomerContactInfoCard(
                    customer: customer,
                    onCopyEmail: () => _copyToClipboard(customer.email),
                    onCall: customer.phone != null ? () => _makeCall() : null,
                    onOpenMap: customer.address != null
                        ? () => _openMap()
                        : null,
                  ),
                  SizedBox(height: 16.h),
                  CustomerAccountStatusCard(
                    customer: customer,
                    formatDate: _formatDate,
                  ),
                  SizedBox(height: 16.h),
                  BlocProvider<CustomerInvoicesCubit>.value(
                    value: _customerInvoicesCubit,
                    child: CustomerAnalyticsCard(customer: customer),
                  ),
                  SizedBox(height: 100.h), // Space for bottom actions
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Actions with Animation
      bottomNavigationBar: CustomerBottomActions(
        customer: customer,
        onEdit: () => _editCustomer(),
        onDelete: () => _showDeleteConfirmation(),
        hasEditPermission: PermissionChecker.hasPermission(
          context,
          CustomersPermissions.edit,
        ),
        hasDeletePermission: PermissionChecker.hasPermission(
          context,
          CustomersPermissions.delete,
        ),
      ),
    );
  }

  // Helper Methods
  String _formatDate(DateTime? date) {
    if (date == null) return S.of(context).undefined;
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  void _makeCall() async {
    if (widget.customer.phone != null) {
      // طلب إذن الاتصال
      final permission = await Permission.phone.request();

      if (permission.isGranted) {
        final Uri phoneUri = Uri(scheme: 'tel', path: widget.customer.phone!);
        try {
          if (await canLaunchUrl(phoneUri)) {
            await launchUrl(phoneUri);
          } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).customersCannotMakeCall),
              backgroundColor: AppColors.error,
            ),
          );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                S.of(context).errorOccurredWithMessage(e.toString()),
              ),
              backgroundColor: AppColors.error,
            ),
          );
        }
      } else if (permission.isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).customersCallPermissionDenied),
            backgroundColor: AppColors.warning,
          ),
        );
      } else if (permission.isPermanentlyDenied) {
        // عرض dialog لتوجيه المستخدم لإعدادات التطبيق
        _showPermissionDialog(
          S.of(context).customersCallPermissionRequired,
          S.of(context).customersCallPermissionRequiredMessage,
        );
      }
    }
  }

  void _sendEmail() async {
    if (widget.customer.email.isNotEmpty) {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: widget.customer.email,
        query: 'subject=${Uri.encodeComponent(S.of(context).customersEmailSubject)}',
      );
      try {
        if (await canLaunchUrl(emailUri)) {
          await launchUrl(emailUri);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(S.of(context).customersCannotSendEmail),
              backgroundColor: AppColors.error,
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).errorOccurredWithMessage(e.toString())),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  void _viewInvoices() {
    // استخدام الـ Cubit المحلي الموجود في الشاشة
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider<CustomerInvoicesCubit>.value(
          value: _customerInvoicesCubit,
          child: CustomerInvoicesListScreen(customer: widget.customer),
        ),
      ),
    );
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).copiedToClipboard),
        backgroundColor: AppColors.success,
      ),
    );
  }

  void _openMap() async {
    if (widget.customer.address != null &&
        widget.customer.address!.isNotEmpty) {
      // طلب إذن الموقع
      final permission = await Permission.location.request();

      if (permission.isGranted) {
        final String encodedAddress = Uri.encodeComponent(
          widget.customer.address!,
        );
        final Uri mapUri = Uri.parse(
          'https://maps.google.com/maps?q=$encodedAddress',
        );
        try {
          if (await canLaunchUrl(mapUri)) {
            await launchUrl(mapUri, mode: LaunchMode.externalApplication);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(S.of(context).customersCannotOpenMap),
                backgroundColor: AppColors.error,
              ),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                S.of(context).errorOccurredWithMessage(e.toString()),
              ),
              backgroundColor: AppColors.error,
            ),
          );
        }
      } else if (permission.isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).customersLocationPermissionDenied),
            backgroundColor: AppColors.warning,
          ),
        );
      } else if (permission.isPermanentlyDenied) {
        // عرض dialog لتوجيه المستخدم لإعدادات التطبيق
        _showPermissionDialog(
          S.of(context).customersLocationPermissionRequired,
          S.of(context).customersLocationPermissionRequiredMessage,
        );
      }
    }
  }

  void _editCustomer() {
    Navigator.pushNamed(context, '/customers/edit', arguments: widget.customer);
  }

  void _showDeleteConfirmation() {
    final customersCubit = CustomersCubit.get(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          S.of(context).confirmDeleteCustomer,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        content: Text(
          S.of(context).confirmDeleteCustomerMessage(widget.customer.name),
          style: TextStyle(fontSize: 14.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              customersCubit.deleteCustomer(widget.customer.id);
              Navigator.pop(context, 'deleted'); // Go back to list with result
            },
            style: FilledButton.styleFrom(backgroundColor: AppColors.error),
            child: Text(S.of(context).delete),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Row(
          children: [
            Icon(Icons.help_outline, color: AppColors.primary),
            SizedBox(width: 8.w),
            Text(S.of(context).help),
          ],
        ),
        content: Text(S.of(context).customersCustomerFormHelpDescription),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).ok),
          ),
        ],
      ),
    );
  }

  void _showPermissionDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Row(
          children: [
            Icon(Icons.warning_outlined, color: AppColors.warning),
            SizedBox(width: 8.w),
            Text(title),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(S.of(context).cancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            style: FilledButton.styleFrom(backgroundColor: AppColors.primary),
            child: Text(S.of(context).customersAppSettings),
          ),
        ],
      ),
    );
  }
}
