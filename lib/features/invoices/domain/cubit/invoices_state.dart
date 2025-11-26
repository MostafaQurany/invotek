part of 'invoices_cubit.dart';

@freezed
sealed class InvoicesState with _$InvoicesState {
  const factory InvoicesState.initial({
    @Default([]) List<InvoiceEntity> invoices,
    InvoiceEntity? selectedInvoice,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    Failure? error,
  }) = _Initial;

  const factory InvoicesState.loading({
    @Default([]) List<InvoiceEntity> invoices,
    InvoiceEntity? selectedInvoice,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    String? message,
  }) = _LoadingInvoices;

  const factory InvoicesState.loaded({
    required List<InvoiceEntity> invoices,
    InvoiceEntity? selectedInvoice,
    required int currentPage,
    required int totalPages,
  }) = _LoadedInvoices;

  const factory InvoicesState.createSuccess({
    required List<InvoiceEntity> invoices,
    required InvoiceEntity created,
    InvoiceEntity? selectedInvoice,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _CreateSuccessInvoices;

  const factory InvoicesState.updateSuccess({
    required List<InvoiceEntity> invoices,
    required InvoiceEntity updated,
    InvoiceEntity? selectedInvoice,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _UpdateSuccessInvoices;

  const factory InvoicesState.deleteSuccess({
    required List<InvoiceEntity> invoices,
    required int deletedId,
    InvoiceEntity? selectedInvoice,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
  }) = _DeleteSuccessInvoices;

  const factory InvoicesState.failure({
    @Default([]) List<InvoiceEntity> invoices,
    InvoiceEntity? selectedInvoice,
    @Default(1) int currentPage,
    @Default(1) int totalPages,
    required Failure failure,
  }) = _FailureInvoices;
}

