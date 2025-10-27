import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/di/init_dependencies_map.dart';
import 'package:invotek/core/theme/app_colors.dart';
import 'package:invotek/features/customers/domain/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/widgets/forms/forms.dart';
import 'package:invotek/generated/l10n.dart';

class EditCustomerScreen extends StatefulWidget {
  final CustomerModel customer;
  final CustomersCubit? cubit;

  const EditCustomerScreen({super.key, required this.customer, this.cubit});

  @override
  State<EditCustomerScreen> createState() => _EditCustomerScreenState();
}

class _EditCustomerScreenState extends State<EditCustomerScreen> {
  final GlobalKey<CustomerFormState> _formKey = GlobalKey<CustomerFormState>();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Scaffold(
      backgroundColor: AppColors.whiteGray,
      appBar: AppBar(
        title: Text(s.editCustomer),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: AppColors.textPrimary),
            onPressed: () => _showHelpDialog(context),
          ),
          SizedBox(width: 8.w),
        ],
      ),
      body: BlocListener<CustomersCubit, CustomersState>(
        listener: (context, state) {
          state.whenOrNull(
            updateSuccess:
                (
                  customers,
                  updated,
                  selectedCustomer,
                  currentPage,
                  totalPages,
                ) async {
                  final messenger = ScaffoldMessenger.of(context);
                  messenger.hideCurrentSnackBar();
                  await messenger
                      .showSnackBar(
                        SnackBar(
                          content: Text(
                            s.customerUpdatedSuccessfully(updated.name),
                          ),
                          backgroundColor: AppColors.primary,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                      )
                      .closed;
                  Navigator.pop(context);
                },
            failure:
                (customers, selectedCustomer, currentPage, totalPages, error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(S.current.errorOccurred(error)),
                      backgroundColor: AppColors.error,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  );
                },
          );
        },
        child: Column(
          children: [
            // Form Content
            Expanded(
              child: CustomerForm(
                key: _formKey,
                initialName: widget.customer.name,
                initialEmail: widget.customer.email,
                initialPhone: widget.customer.phone,
                initialAddress: widget.customer.address,
                initialTaxNumber: widget.customer.taxNumber,
                initialNotes: widget.customer.notes,
                initialStatus: widget.customer.status,
                onSubmit: _handleSubmit,
                isLoading: false, // Will be updated based on state
              ),
            ),

            // Bottom Action Buttons
            CustomerFormBottomButtons(
              onCancel: () => Navigator.pop(context),
              onSave: _handleSubmitButton,
              cancelText: s.cancel,
              saveText: s.editCustomer,
              isSaveEnabled: true,
              isLoading: false, // Will be updated based on state
            ),
          ],
        ),
      ),
    );
  }

  void _handleSubmit(CustomerFormData formData) {
    print('🔄 Update button pressed');
    print('📝 Name: ${formData.name}');
    print('📧 Email: ${formData.email}');
    print('📱 Phone: ${formData.phone}');
    print('🏢 Status: ${formData.status}');

    final cubit = widget.cubit ?? CustomersCubit.get(context);
    cubit.updateCustomer(
      id: widget.customer.id,
      name: formData.name,
      email: formData.email,
      phone: formData.phone,
      address: formData.address,
      taxNumber: formData.taxNumber,
      notes: formData.notes,
      status: formData.status,
    );
  }

  void _handleSubmitButton() {
    _formKey.currentState?.submitForm();
  }

  void _showHelpDialog(BuildContext context) {
    final s = S.of(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(s.formHelpTitle),
        content: Text(s.formHelpDescription),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(s.cancel),
          ),
        ],
      ),
    );
  }
}

class EditCustomerScreenWithProvider extends StatelessWidget {
  final CustomerModel customer;
  final CustomersCubit? cubit;

  const EditCustomerScreenWithProvider({
    super.key,
    required this.customer,
    this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    if (cubit != null) {
      return BlocProvider.value(
        value: cubit!,
        child: EditCustomerScreen(customer: customer),
      );
    }
    return BlocProvider(
      create: (context) => getIt<CustomersCubit>(),
      child: EditCustomerScreen(customer: customer),
    );
  }
}
