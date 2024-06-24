import '../../domain/repositories/currency_repository.dart';
import '../data_sources/remote/data_currency.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyDataSource currencyData;

  CurrencyRepositoryImpl(this.currencyData);

  @override
  Future<Map<String, double>> getCurrency() async {
    final data = await currencyData.getCurrency();
    return data.map((key, value) => MapEntry(key, value.toDouble()));
  }
}