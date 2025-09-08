import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/di/init_dependencies_map.dart';
import 'package:invotek/features/customers/demo/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/ui/widgets/customer_form.dart';
import 'package:invotek/generated/l10n.dart';

class AddCustomerScreen extends StatelessWidget {
  const AddCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final s = S.of(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(s.addCustomer),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 1,
      ),
      body: BlocListener<CustomersCubit, CustomersState>(
        listener: (context, state) {
          state.whenOrNull(
            createSuccess:
                (
                  customers,
                  created,
                  selectedCustomer,
                  currentPage,
                  totalPages,
                ) {
                  final s = S.of(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        s.customerCreatedSuccessfully(created.name),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  Navigator.pop(context);
                },
            failure:
                (customers, selectedCustomer, currentPage, totalPages, error) {
                  final s = S.of(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(s.errorOccurred(error)),
                      backgroundColor: Theme.of(context).colorScheme.error,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
          );
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: CustomerForm(
            onSubmit:
                (
                  name,
                  email,
                  phone,
                  address,
                  taxNumber,
                  notes,
                  status,
                  companyName,
                  commercialRegister,
                  city,
                  region,
                  postalCode,
                  detailedAddress,
                  responsiblePerson,
                ) {
                  _handleSubmit(
                    context,
                    name,
                    email,
                    phone,
                    address,
                    taxNumber,
                    notes,
                    status,
                    companyName,
                    commercialRegister,
                    city,
                    region,
                    postalCode,
                    detailedAddress,
                    responsiblePerson,
                  );
                },
            onCancel: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }

  void _handleSubmit(
    BuildContext context,
    String name,
    String email,
    String? phone,
    String? address,
    String? taxNumber,
    String? notes,
    String status,
    String? companyName,
    String? commercialRegister,
    String? city,
    String? region,
    String? postalCode,
    String? detailedAddress,
    String? responsiblePerson,
  ) {
    final cubit = CustomersCubit.get(context);
    cubit.createCustomer(
      name: name,
      email: email,
      phone: phone,
      address: address,
      taxNumber: taxNumber,
      notes: notes,
      status: status,
      companyName: companyName,
      commercialRegister: commercialRegister,
      city: city,
      region: region,
      postalCode: postalCode,
      detailedAddress: detailedAddress,
      responsiblePerson: responsiblePerson,
    );
  }
}

class AddCustomerScreenWithProvider extends StatelessWidget {
  const AddCustomerScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddCustomerScreen();
  }
}
