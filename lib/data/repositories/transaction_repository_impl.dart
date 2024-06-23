import '../../domain/repositories/transaction_repository.dart';
import '../data_sources/local/database.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final Database hiveDatabase;

  TransactionRepositoryImpl(this.hiveDatabase);

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    final box = hiveDatabase.transactionBox;
    await box.put(transaction.id, transaction);
  }

  @override
  List<TransactionModel> getTransactions() {
    final box = hiveDatabase.transactionBox;
    return box.values.toList();
  }

  @override
  Future<void> deleteTransaction(String id) async {
    final box = hiveDatabase.transactionBox;
    await box.delete(id);
  }

}