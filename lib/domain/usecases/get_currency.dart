import 'package:my_budget/domain/repositories/currency_repository.dart';

class GetCurrency {
  final CurrencyRepository repository;

  GetCurrency(this.repository);

  Future<Map<String, double>> call() {
    return repository.getCurrency();
  }
}