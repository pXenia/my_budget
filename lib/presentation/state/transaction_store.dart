import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../../data/models/transaction_model.dart';
import '../../domain/usecases/add_transaction.dart';
import '../../domain/usecases/delete_transaction.dart';
import '../../domain/usecases/get_transactions.dart';

part 'transaction_store.g.dart';

class TransactionStore = _TransactionStore with _$TransactionStore;

abstract class _TransactionStore with Store {
  final AddTransaction _addTransaction = GetIt.instance<AddTransaction>();
  final GetTransactions _getTransactions = GetIt.instance<GetTransactions>();
  final DeleteTransaction _deleteTransaction = GetIt.instance<DeleteTransaction>();

  @observable
  ObservableList<TransactionModel> transactions = ObservableList<TransactionModel>();

  @computed
  int get nextId => transactions.length + 1;

  @computed
  double get totalBalance{
    double sumValue = 0.0;
    for (var element in transactions) {
      if (element.isIncome) {
        sumValue+= element.cost;
      } else {
        sumValue -= element.cost;
      }}
    return sumValue;
  }

  @computed
  double get monthlyExpenses {
    final now = DateTime.now();
    double sumValue = 0.0;
    for (var element in transactions){
      if (!element.isIncome && element.date.month == now.month && element.date.year == now.year){
        sumValue += element.cost;
      }
    }
    return sumValue;
  }

  @computed
  double get monthlyIncome {
    final now = DateTime.now();
    double sumValue = 0.0;
    for (var element in transactions){
      if (element.isIncome && element.date.month == now.month && element.date.year == now.year){
        sumValue += element.cost;
      }
    }
    return sumValue;
  }

  @action
  Future<void> loadTransactions() async {
    final loadedTransactions = await _getTransactions();
    transactions = ObservableList.of(loadedTransactions);
  }

  @action
  Future<void> createTransaction(TransactionModel transaction) async {
    await _addTransaction(transaction);
    transactions.add(transaction);
  }

  @action
  Future<void> deleteTransaction(String id) async {
    await _deleteTransaction(id);
    transactions.removeWhere((transaction) => transaction.id == id);
  }
}