import '../../data/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<void> addTransaction(TransactionModel transaction);
  List<TransactionModel> getTransactions();
  Future<void> deleteTransaction(String id);
}