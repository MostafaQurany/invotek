import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/features/invoices/demo/cubit/invoices_cubit.dart';
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:invotek/features/invoices/ui/widgets/states/invoices_empty_state.dart';
import 'package:invotek/features/invoices/ui/widgets/states/invoices_error_state.dart';
import 'package:invotek/features/invoices/ui/widgets/states/invoices_loading_state.dart';
import 'package:invotek/features/invoices/ui/widgets/lists/invoices_list.dart';

class InvoicesStateBuilder extends StatelessWidget {
  final Function(InvoiceModel) onInvoiceTap;
  final Function(InvoiceModel) onInvoiceView;
  final Function(InvoiceModel) onInvoiceEdit;
  final Function(InvoiceModel) onInvoiceDelete;
  final VoidCallback onAddInvoice;
  final VoidCallback onRetry;
  final String selectedStatus;
  final String selectedPaymentMethod;
  final String selectedCustomer;
  final Function(String?) onStatusChanged;
  final Function(String?) onPaymentMethodChanged;
  final Function(String?) onCustomerChanged;

  const InvoicesStateBuilder({
    super.key,
    required this.onInvoiceTap,
    required this.onInvoiceView,
    required this.onInvoiceEdit,
    required this.onInvoiceDelete,
    required this.onAddInvoice,
    required this.onRetry,
    required this.selectedStatus,
    required this.selectedPaymentMethod,
    required this.selectedCustomer,
    required this.onStatusChanged,
    required this.onPaymentMethodChanged,
    required this.onCustomerChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoicesCubit, InvoicesState>(
      builder: (context, state) {
        print(
          '🏗️ InvoicesStateBuilder building with state: ${state.runtimeType}',
        );

        return state.when(
          initial: (invoices, selectedInvoice, currentPage, totalPages, error) {
            if (invoices.isEmpty) {
              return InvoicesEmptyState(
                onAddInvoice: onAddInvoice,
                onRetry: onRetry,
              );
            }
            return InvoicesList(
              invoices: invoices,
              onInvoiceTap: onInvoiceTap,
              onInvoiceView: onInvoiceView,
              onInvoiceEdit: onInvoiceEdit,
              onInvoiceDelete: onInvoiceDelete,
            );
          },
          loading:
              (invoices, selectedInvoice, currentPage, totalPages, message) {
                if (invoices.isEmpty) {
                  return InvoicesLoadingState();
                }
                return Column(
                  children: [
                    Expanded(
                      child: InvoicesList(
                        invoices: invoices,
                        onInvoiceTap: onInvoiceTap,
                        onInvoiceView: onInvoiceView,
                        onInvoiceEdit: onInvoiceEdit,
                        onInvoiceDelete: onInvoiceDelete,
                      ),
                    ),
                    InvoicesLoadingState(),
                  ],
                );
              },
          loaded: (invoices, selectedInvoice, currentPage, totalPages) {
            if (invoices.isEmpty) {
              return InvoicesEmptyState(
                onAddInvoice: onAddInvoice,
                onRetry: onRetry,
              );
            }
            return InvoicesList(
              invoices: invoices,
              onInvoiceTap: onInvoiceTap,
              onInvoiceView: onInvoiceView,
              onInvoiceEdit: onInvoiceEdit,
              onInvoiceDelete: onInvoiceDelete,
            );
          },
          createSuccess:
              (invoices, created, selectedInvoice, currentPage, totalPages) {
                if (invoices.isEmpty) {
                  return InvoicesEmptyState(
                    onAddInvoice: onAddInvoice,
                    onRetry: onRetry,
                  );
                }
                return InvoicesList(
                  invoices: invoices,
                  onInvoiceTap: onInvoiceTap,
                  onInvoiceView: onInvoiceView,
                  onInvoiceEdit: onInvoiceEdit,
                  onInvoiceDelete: onInvoiceDelete,
                );
              },
          updateSuccess:
              (invoices, updated, selectedInvoice, currentPage, totalPages) {
                if (invoices.isEmpty) {
                  return InvoicesEmptyState(
                    onAddInvoice: onAddInvoice,
                    onRetry: onRetry,
                  );
                }
                return InvoicesList(
                  invoices: invoices,
                  onInvoiceTap: onInvoiceTap,
                  onInvoiceView: onInvoiceView,
                  onInvoiceEdit: onInvoiceEdit,
                  onInvoiceDelete: onInvoiceDelete,
                );
              },
          deleteSuccess:
              (invoices, deletedId, selectedInvoice, currentPage, totalPages) {
                if (invoices.isEmpty) {
                  return InvoicesEmptyState(
                    onAddInvoice: onAddInvoice,
                    onRetry: onRetry,
                  );
                }
                return InvoicesList(
                  invoices: invoices,
                  onInvoiceTap: onInvoiceTap,
                  onInvoiceView: onInvoiceView,
                  onInvoiceEdit: onInvoiceEdit,
                  onInvoiceDelete: onInvoiceDelete,
                );
              },
          failure: (invoices, selectedInvoice, currentPage, totalPages, error) {
            if (invoices.isEmpty) {
              return InvoicesErrorState(error: error, onRetry: onRetry);
            }
            return Column(
              children: [
                Expanded(
                  child: InvoicesList(
                    invoices: invoices,
                    onInvoiceTap: onInvoiceTap,
                    onInvoiceView: onInvoiceView,
                    onInvoiceEdit: onInvoiceEdit,
                    onInvoiceDelete: onInvoiceDelete,
                  ),
                ),
                InvoicesErrorState(error: error, onRetry: onRetry),
              ],
            );
          },
        );
      },
    );
  }
}
