import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invotek/core/services/storage_service.dart';

class CurrencyState {
  final String currencyCode;

  const CurrencyState({required this.currencyCode});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CurrencyState && other.currencyCode == currencyCode;
  }

  @override
  int get hashCode => currencyCode.hashCode;

  CurrencyState copyWith({String? currencyCode}) {
    return CurrencyState(currencyCode: currencyCode ?? this.currencyCode);
  }
}

class CurrencyCubit extends Cubit<CurrencyState> {
  CurrencyCubit() : super(const CurrencyState(currencyCode: 'AED'));

  Future<void> initializeCurrency() async {
    await _loadSavedCurrency();
  }

  Future<void> _loadSavedCurrency() async {
    try {
      final savedCurrency = StorageService.getCurrency();
      
      // إذا لم تكن هناك عملة محفوظة، استخدام 'AED' كافتراضي
      if (savedCurrency == null || savedCurrency.isEmpty) {
        emit(const CurrencyState(currencyCode: 'AED'));
        return;
      }
      
      // التأكد من أن العملة المحفوظة صالحة، وإلا استخدام 'AED' كافتراضي
      final currencyCode = (savedCurrency == 'AED' || 
                           savedCurrency == 'EGP' || 
                           savedCurrency == 'SAR' || 
                           savedCurrency == 'USD')
          ? savedCurrency
          : 'AED';
      emit(CurrencyState(currencyCode: currencyCode));
    } catch (e) {
      // في حالة حدوث خطأ، استخدام 'AED' كافتراضي
      emit(const CurrencyState(currencyCode: 'AED'));
    }
  }

  Future<void> changeCurrency(String currencyCode) async {
    await StorageService.saveCurrency(currencyCode);
    emit(CurrencyState(currencyCode: currencyCode));
  }

  String getCurrentCurrency() {
    return state.currencyCode;
  }

  bool isAED() {
    return state.currencyCode == 'AED';
  }

  bool isEGP() {
    return state.currencyCode == 'EGP';
  }

  bool isSAR() {
    return state.currencyCode == 'SAR';
  }

  bool isUSD() {
    return state.currencyCode == 'USD';
  }
}

