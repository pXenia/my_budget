import '../../data/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<void> addTransaction(TransactionModel transaction);
  Future<List<TransactionModel>> getTransactions();
  Future<void> deleteTransaction(String id);
}