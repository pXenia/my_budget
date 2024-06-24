import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:my_budget/domain/usecases/get_currency.dart';

part 'currency_store.g.dart';

class ExchangeRateStore = _ExchangeRateStore with _$ExchangeRateStore;

abstract class _ExchangeRateStore with Store {
  final GetCurrency _getExchangeRates = GetIt.instance<GetCurrency>();

  final List<String> country = ['USD', 'EUR', 'JPY', 'CNY', 'TRY', 'GBP'];

  @observable
  ObservableMap<String, double> exchangeRates = ObservableMap<String, double>();

  @action
  Future<void> fetchExchangeRates() async {
    final rates = await _getExchangeRates();
    final filteredRates = rates.entries
        .where((entry) => country.contains(entry.key))
        .map((entry) => MapEntry(entry.key, entry.value.toDouble()));
    exchangeRates = ObservableMap<String, double>.of(Map.fromEntries(filteredRates));
  }
}