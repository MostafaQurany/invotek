
import 'package:invotek/features/invoices/data/models/invoice_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_invoices_response.g.dart';

@JsonSerializable()
class GetAllInvoicesResponse {
  final bool success;
  final GetAllInvoicesBody data;
  GetAllInvoicesResponse({required this.data, required this.success});

  factory GetAllInvoicesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAllInvoicesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllInvoicesResponseToJson(this);
}

@JsonSerializable()
class GetAllInvoicesBody {
  final num? total;
  // @JsonKey(
  //   name: 'next_page_url',
  //   toJson: _nextPageUrlToJson,
  //   fromJson: _nextPageUrlFromJson,
  //   defaultValue: false,
  // )
  // final bool? hasNextPage;
  @JsonKey(name: 'last_page')
  final num? lastPage;
  @JsonKey(name: "current_page")
  final num? currentPage;
  final List<InvoiceModel>? data;

  GetAllInvoicesBody({
    //this.hasNextPage,
    this.lastPage,
    this.total,
    this.data,
    this.currentPage,
  });

  factory GetAllInvoicesBody.fromJson(Map<String, dynamic> json) =>
      _$GetAllInvoicesBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllInvoicesBodyToJson(this);
}

// -------------- helper methods ----------------------
_nextPageUrlToJson(bool value) => value.toString();
_nextPageUrlFromJson(String? value) => value == null ? false : true;
