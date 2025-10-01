part of 'invoices_cubit.dart';


@freezed
sealed class InvoicesState with _$InvoicesState {
  const factory InvoicesState.initial({
    @Default([]) List<InvoiceModel> invoices,
    InvoiceModel? selectedInvoice,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    String? error,
  }) = _Initial;

  const factory InvoicesState.loading({
    @Default([]) List<InvoiceModel> invoices,
    InvoiceModel? selectedInvoice,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    String? message,
  }) = _LoadingInvoices;

  const factory InvoicesState.loaded({
    required List<InvoiceModel> invoices,
    InvoiceModel? selectedInvoice,
    required int currentPage,
    required int totalPages,
  }) = _LoadedInvoices;

  const factory InvoicesState.createSuccess({
    required List<InvoiceModel> invoices,
    required InvoiceModel created,
    InvoiceModel? selectedInvoice,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _CreateSuccessInvoices;

  const factory InvoicesState.updateSuccess({
    required List<InvoiceModel> invoices,
    required InvoiceModel updated,
    InvoiceModel? selectedInvoice,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _UpdateSuccessInvoices;

  const factory InvoicesState.deleteSuccess({
    required List<InvoiceModel> invoices,
    required String deletedId,
    InvoiceModel? selectedInvoice,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _DeleteSuccessInvoices;

  const factory InvoicesState.failure({
    @Default([]) List<InvoiceModel> invoices,
    InvoiceModel? selectedInvoice,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    required String error,
  }) = _FailureInvoices;
}
