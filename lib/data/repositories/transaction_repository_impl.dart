import '../../domain/repositories/transaction_repository.dart';
import '../data_sources/local/database.dart';
import '../models/transaction_model.dart';

class TransactionRepository {
  final Database hiveDatabase;

  TransactionRepository(this.hiveDatabase);

  Future<void> createTransaction(TransactionModel transaction) async {
    final box = hiveDatabase.transactionBox;
    await box.put(transaction.id, transaction);
  }

  List<TransactionModel> getTransactions() {
    final box = hiveDatabase.transactionBox;
    return box.values.toList();
  }

  Future<void> deleteTransaction(String id) async {
    final box = hiveDatabase.transactionBox;
    await box.delete(id);
  }
}