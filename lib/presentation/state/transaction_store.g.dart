// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionStore on _TransactionStore, Store {
  Computed<int>? _$nextIdComputed;

  @override
  int get nextId => (_$nextIdComputed ??=
          Computed<int>(() => super.nextId, name: '_TransactionStore.nextId'))
      .value;

  late final _$transactionsAtom =
      Atom(name: '_TransactionStore.transactions', context: context);

  @override
  ObservableList<TransactionModel> get transactions {
    _$transactionsAtom.reportRead();
    return super.transactions;
  }

  @override
  set transactions(ObservableList<TransactionModel> value) {
    _$transactionsAtom.reportWrite(value, super.transactions, () {
      super.transactions = value;
    });
  }

  late final _$loadTransactionsAsyncAction =
      AsyncAction('_TransactionStore.loadTransactions', context: context);

  @override
  Future<void> loadTransactions() {
    return _$loadTransactionsAsyncAction.run(() => super.loadTransactions());
  }

  late final _$createTransactionAsyncAction =
      AsyncAction('_TransactionStore.createTransaction', context: context);

  @override
  Future<void> createTransaction(TransactionModel transaction) {
    return _$createTransactionAsyncAction
        .run(() => super.createTransaction(transaction));
  }

  late final _$deleteTransactionAsyncAction =
      AsyncAction('_TransactionStore.deleteTransaction', context: context);

  @override
  Future<void> deleteTransaction(String id) {
    return _$deleteTransactionAsyncAction
        .run(() => super.deleteTransaction(id));
  }

  @override
  String toString() {
    return '''
transactions: ${transactions},
nextId: ${nextId}
    ''';
  }
}
