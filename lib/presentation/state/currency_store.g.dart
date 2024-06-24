// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExchangeRateStore on _ExchangeRateStore, Store {
  late final _$exchangeRatesAtom =
      Atom(name: '_ExchangeRateStore.exchangeRates', context: context);

  @override
  ObservableMap<String, double> get exchangeRates {
    _$exchangeRatesAtom.reportRead();
    return super.exchangeRates;
  }

  @override
  set exchangeRates(ObservableMap<String, double> value) {
    _$exchangeRatesAtom.reportWrite(value, super.exchangeRates, () {
      super.exchangeRates = value;
    });
  }

  late final _$fetchExchangeRatesAsyncAction =
      AsyncAction('_ExchangeRateStore.fetchExchangeRates', context: context);

  @override
  Future<void> fetchExchangeRates() {
    return _$fetchExchangeRatesAsyncAction
        .run(() => super.fetchExchangeRates());
  }

  @override
  String toString() {
    return '''
exchangeRates: ${exchangeRates}
    ''';
  }
}
