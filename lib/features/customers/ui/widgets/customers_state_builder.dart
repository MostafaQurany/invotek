import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/customers/demo/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/demo/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/widgets/customers_empty_state.dart';
import 'package:invotek/features/customers/ui/widgets/customers_error_state.dart';
import 'package:invotek/features/customers/ui/widgets/customers_list.dart';

class CustomersStateBuilder extends StatelessWidget {
  final Function(CustomerModel) onCustomerTap;
  final Function(CustomerModel) onCustomerView;
  final Function(CustomerModel) onCustomerEdit;
  final Function(CustomerModel) onCustomerDelete;
  final VoidCallback onAddCustomer;
  final VoidCallback onRetry;

  const CustomersStateBuilder({
    super.key,
    required this.onCustomerTap,
    required this.onCustomerView,
    required this.onCustomerEdit,
    required this.onCustomerDelete,
    required this.onAddCustomer,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomersCubit, CustomersState>(
      builder: (context, state) {
        return state.when(
          initial:
              (customers, selectedCustomer, currentPage, totalPages, error) {
                if (customers.isEmpty) {
                  return SliverFillRemaining(
                    child: CustomersEmptyState(onAddCustomer: onAddCustomer),
                  );
                }
                return CustomersList(
                  customers: customers,
                  onCustomerTap: onCustomerTap,
                  onCustomerView: onCustomerView,
                  onCustomerEdit: onCustomerEdit,
                  onCustomerDelete: onCustomerDelete,
                );
              },
          loading:
              (customers, selectedCustomer, currentPage, totalPages, message) {
                if (customers.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return CustomersList(
                  customers: customers,
                  onCustomerTap: onCustomerTap,
                  onCustomerView: onCustomerView,
                  onCustomerEdit: onCustomerEdit,
                  onCustomerDelete: onCustomerDelete,
                );
              },
          loaded: (customers, selectedCustomer, currentPage, totalPages) {
            if (customers.isEmpty) {
              return SliverFillRemaining(
                child: CustomersEmptyState(onAddCustomer: onAddCustomer),
              );
            }
            return CustomersList(
              customers: customers,
              onCustomerTap: onCustomerTap,
              onCustomerView: onCustomerView,
              onCustomerEdit: onCustomerEdit,
              onCustomerDelete: onCustomerDelete,
            );
          },
          createSuccess:
              (customers, created, selectedCustomer, currentPage, totalPages) {
                if (customers.isEmpty) {
                  return SliverFillRemaining(
                    child: CustomersEmptyState(onAddCustomer: onAddCustomer),
                  );
                }
                return CustomersList(
                  customers: customers,
                  onCustomerTap: onCustomerTap,
                  onCustomerView: onCustomerView,
                  onCustomerEdit: onCustomerEdit,
                  onCustomerDelete: onCustomerDelete,
                );
              },
          updateSuccess:
              (customers, updated, selectedCustomer, currentPage, totalPages) {
                if (customers.isEmpty) {
                  return SliverFillRemaining(
                    child: CustomersEmptyState(onAddCustomer: onAddCustomer),
                  );
                }
                return CustomersList(
                  customers: customers,
                  onCustomerTap: onCustomerTap,
                  onCustomerView: onCustomerView,
                  onCustomerEdit: onCustomerEdit,
                  onCustomerDelete: onCustomerDelete,
                );
              },
          deleteSuccess:
              (
                customers,
                deletedId,
                selectedCustomer,
                currentPage,
                totalPages,
              ) {
                if (customers.isEmpty) {
                  return SliverFillRemaining(
                    child: CustomersEmptyState(onAddCustomer: onAddCustomer),
                  );
                }
                return CustomersList(
                  customers: customers,
                  onCustomerTap: onCustomerTap,
                  onCustomerView: onCustomerView,
                  onCustomerEdit: onCustomerEdit,
                  onCustomerDelete: onCustomerDelete,
                );
              },
          failure:
              (customers, selectedCustomer, currentPage, totalPages, error) {
                if (customers.isEmpty) {
                  return SliverFillRemaining(
                    child: CustomersErrorState(error: error, onRetry: onRetry),
                  );
                }
                return CustomersList(
                  customers: customers,
                  onCustomerTap: onCustomerTap,
                  onCustomerView: onCustomerView,
                  onCustomerEdit: onCustomerEdit,
                  onCustomerDelete: onCustomerDelete,
                );
              },
        );
      },
    );
  }
}
