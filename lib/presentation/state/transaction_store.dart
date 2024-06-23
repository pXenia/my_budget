import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../../data/models/transaction_model.dart';
import '../../data/repositories/transaction_repository_impl.dart';

part 'transaction_store.g.dart';

class TransactionStore = _TransactionStore with _$TransactionStore;

abstract class _TransactionStore with Store {
  final TransactionRepository _transactionRepository = GetIt.instance<TransactionRepository>();

  @observable
  ObservableList<TransactionModel> transactions = ObservableList<TransactionModel>();

  @computed
  int get nextId => transactions.length + 1;

  @action
  Future<void> loadTransactions() async {
    final loadedTransactions = _transactionRepository.getTransactions();
    transactions = ObservableList.of(loadedTransactions);
  }

  @action
  Future<void> createTransaction(TransactionModel transaction) async {
    await _transactionRepository.createTransaction(transaction);
    transactions.add(transaction);
  }

  @action
  Future<void> deleteTransaction(String id) async {
    await _transactionRepository.deleteTransaction(id);
    transactions.removeWhere((transaction) => transaction.id == id);
  }
}