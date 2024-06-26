import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:my_budget/domain/usecases/get_currency.dart';

part 'currency_store.g.dart';

class CurrencyStore = _CurrencyStore with _$CurrencyStore;

abstract class _CurrencyStore with Store {
  final GetCurrency _getCurrency = GetIt.instance<GetCurrency>();

  final List<String> country = ['USD', 'EUR', 'JPY', 'CNY', 'TRY', 'GBP'];

  @observable
  ObservableMap<String, double> currency = ObservableMap<String, double>();

  @action
  Future<void> fetchCurrency() async {
    final rates = await _getCurrency();
    final filteredRates = rates.entries
        .where((entry) => country.contains(entry.key))
        .map((entry) => MapEntry(entry.key, entry.value.toDouble()));
    currency = ObservableMap<String, double>.of(Map.fromEntries(filteredRates));
  }
}