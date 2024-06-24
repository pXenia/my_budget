import '../../domain/repositories/transaction_repository.dart';
import '../data_sources/local/database.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final Database database;

  TransactionRepositoryImpl(this.database);

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    final box = database.transactionBox;
    await box.put(transaction.id, transaction);
  }

  @override
  List<TransactionModel> getTransactions() {
    final box = database.transactionBox;
    return box.values.toList();
  }

  @override
  Future<void> deleteTransaction(String id) async {
    final box = database.transactionBox;
    await box.delete(id);
  }

}