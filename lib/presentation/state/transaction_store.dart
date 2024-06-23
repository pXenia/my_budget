import 'package:mobx/mobx.dart';
import '../../data/models/transaction_model.dart';
import '../../domain/usecases/add_transaction.dart';
import '../../domain/usecases/delete_transaction.dart';
import '../../domain/usecases/get_transactions.dart';


part 'transaction_store.g.dart';

class TransactionStore = _TransactionStore with _$TransactionStore;

abstract class _TransactionStore with Store {
  final GetTransactions getTransactions;
  final AddTransaction addTransaction;
  final DeleteTransaction deleteTransaction;

  _TransactionStore({
    required this.getTransactions,
    required this.addTransaction,
    required this.deleteTransaction,
  });

  @observable
  ObservableList<TransactionModel> transactions = ObservableList<TransactionModel>();

  @action
  Future<void> loadTransactions() async {
    final result = await getTransactions();
    transactions.clear();
    transactions.addAll(result);
  }

  @action
  Future<void> createTransaction(TransactionModel transaction) async {
    await addTransaction(transaction);
    transactions.add(transaction);
  }

  @action
  Future<void> removeTransaction(int id) async {
    await deleteTransaction(id);
    transactions.removeWhere((transaction) => transaction.id == id);
  }
  int get nextId => transactions.isEmpty ? 1 : transactions.map((t) => t.id).reduce((a, b) => a > b ? a : b) + 1;
}
