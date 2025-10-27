import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/customers/domain/cubit/customers_cubit.dart';
import 'package:invotek/features/customers/domain/entit/customer_model.dart';
import 'package:invotek/features/customers/ui/widgets/states/customers_empty_state.dart';
import 'package:invotek/features/customers/ui/widgets/states/customers_error_state.dart';
import 'package:invotek/features/customers/ui/widgets/lists/customers_list.dart';

class CustomersStateBuilder extends StatelessWidget {
  final Function(CustomerModel) onCustomerTap;
  final Function(CustomerModel) onCustomerView;
  final Function(CustomerModel) onCustomerEdit;
  final Function(CustomerModel) onCustomerDelete;
  final VoidCallback onAddCustomer;
  final VoidCallback onRetry;
  final String selectedStatus;
  final String selectedCompany;
  final Function(String) onStatusChanged;
  final Function(String) onCompanyChanged;
  final ScrollController? scrollController;

  const CustomersStateBuilder({
    super.key,
    required this.onCustomerTap,
    required this.onCustomerView,
    required this.onCustomerEdit,
    required this.onCustomerDelete,
    required this.onAddCustomer,
    required this.onRetry,
    required this.selectedStatus,
    required this.selectedCompany,
    required this.onStatusChanged,
    required this.onCompanyChanged,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomersCubit, CustomersState>(
      builder: (context, state) {
        print(
          '🏗️ CustomersStateBuilder building with state: ${state.runtimeType}',
        );

        return state.when(
          initial:
              (customers, selectedCustomer, currentPage, totalPages, error) {
                if (customers.isEmpty) {
                  return CustomersEmptyState(onAddCustomer: onAddCustomer);
                }
                return CustomersList(
                  customers: customers,
                  onCustomerTap: onCustomerTap,
                  onCustomerView: onCustomerView,
                  onCustomerEdit: onCustomerEdit,
                  onCustomerDelete: onCustomerDelete,
                  isLoadingMore: false,
                  scrollController: scrollController,
                );
              },
          loading:
              (customers, selectedCustomer, currentPage, totalPages, message) {
                if (customers.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                return CustomersList(
                  customers: customers,
                  onCustomerTap: onCustomerTap,
                  onCustomerView: onCustomerView,
                  onCustomerEdit: onCustomerEdit,
                  onCustomerDelete: onCustomerDelete,
                  isLoadingMore: message == 'loading_more',
                  scrollController: scrollController,
                );
              },
          loaded: (customers, selectedCustomer, currentPage, totalPages) {
            if (customers.isEmpty) {
              return CustomersEmptyState(onAddCustomer: onAddCustomer);
            }
            return CustomersList(
              customers: customers,
              onCustomerTap: onCustomerTap,
              onCustomerView: onCustomerView,
              onCustomerEdit: onCustomerEdit,
              onCustomerDelete: onCustomerDelete,
              isLoadingMore: false,
              scrollController: scrollController,
            );
          },
          createSuccess:
              (customers, created, selectedCustomer, currentPage, totalPages) {
                if (customers.isEmpty) {
                  return CustomersEmptyState(onAddCustomer: onAddCustomer);
                }
                return CustomersList(
                  customers: customers,
                  onCustomerTap: onCustomerTap,
                  onCustomerView: onCustomerView,
                  onCustomerEdit: onCustomerEdit,
                  onCustomerDelete: onCustomerDelete,
                  isLoadingMore: false,
                  scrollController: scrollController,
                );
              },
          updateSuccess:
              (customers, updated, selectedCustomer, currentPage, totalPages) {
                if (customers.isEmpty) {
                  return CustomersEmptyState(onAddCustomer: onAddCustomer);
                }
                return CustomersList(
                  customers: customers,
                  onCustomerTap: onCustomerTap,
                  onCustomerView: onCustomerView,
                  onCustomerEdit: onCustomerEdit,
                  onCustomerDelete: onCustomerDelete,
                  isLoadingMore: false,
                  scrollController: scrollController,
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
                  return CustomersEmptyState(onAddCustomer: onAddCustomer);
                }
                return CustomersList(
                  customers: customers,
                  onCustomerTap: onCustomerTap,
                  onCustomerView: onCustomerView,
                  onCustomerEdit: onCustomerEdit,
                  onCustomerDelete: onCustomerDelete,
                  isLoadingMore: false,
                  scrollController: scrollController,
                );
              },
          failure:
              (customers, selectedCustomer, currentPage, totalPages, error) {
                if (customers.isEmpty) {
                  return CustomersErrorState(
                    error: error.message,
                    onRetry: onRetry,
                  );
                }
                return CustomersList(
                  customers: customers,
                  onCustomerTap: onCustomerTap,
                  onCustomerView: onCustomerView,
                  onCustomerEdit: onCustomerEdit,
                  onCustomerDelete: onCustomerDelete,
                  isLoadingMore: false,
                  scrollController: scrollController,
                );
              },
        );
      },
    );
  }
}
