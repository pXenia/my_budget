// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrencyStore on _CurrencyStore, Store {
  late final _$currencyAtom =
      Atom(name: '_CurrencyStore.currency', context: context);

  @override
  ObservableMap<String, double> get currency {
    _$currencyAtom.reportRead();
    return super.currency;
  }

  @override
  set currency(ObservableMap<String, double> value) {
    _$currencyAtom.reportWrite(value, super.currency, () {
      super.currency = value;
    });
  }

  late final _$fetchCurrencyAsyncAction =
      AsyncAction('_CurrencyStore.fetchCurrency', context: context);

  @override
  Future<void> fetchCurrency() {
    return _$fetchCurrencyAsyncAction.run(() => super.fetchCurrency());
  }

  @override
  String toString() {
    return '''
currency: ${currency}
    ''';
  }
}
