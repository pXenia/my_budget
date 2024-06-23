import 'package:hive/hive.dart';
import '../../models/transaction_model.dart';
import '../../models/wish_model.dart';



abstract class Database {
  Future<void> addTransaction(TransactionModel transaction);
  Future<List<TransactionModel>> getTransactions();
  Future<void> deleteTransaction(int id);

  Future<void> addWish(WishModel wish);
  Future<List<WishModel>> getWishes();
  Future<void> deleteWish(String id);
}

class DatabaseImpl implements Database {
  final Box<TransactionModel> transactionBox;
  final Box<WishModel> wishBox;

  DatabaseImpl()
      : transactionBox = Hive.box<TransactionModel>('transactions'),
        wishBox = Hive.box<WishModel>('wishes');

  @override
  Future<void> addTransaction(TransactionModel transaction) async {
    await transactionBox.put(transaction.id, transaction);
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    return transactionBox.values.toList();
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await transactionBox.delete(id);
  }

  @override
  Future<void> addWish(WishModel wish) async {
    await wishBox.put(wish.id, wish);
  }

  @override
  Future<List<WishModel>> getWishes() async {
    return wishBox.values.toList();
  }

  @override
  Future<void> deleteWish(String id) async {
    await wishBox.delete(id);
  }
}
