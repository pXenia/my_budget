import '../../domain/repositories/transaction_repository.dart';
import '../data_sources/local/database.dart';
import '../models/transaction_model.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final Database hiveDatabase;

  TransactionRepositoryImpl({required this.hiveDatabase});

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    await hiveDatabase.addTransaction(transaction);
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    return await hiveDatabase.getTransactions();
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await hiveDatabase.deleteTransaction(id);
  }
}