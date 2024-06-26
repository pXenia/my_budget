import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import '../../models/transaction_model.dart';
import '../../models/wish_model.dart';

class Database {
  static const String transactionBoxName = 'transactions';
  static const String wishBoxName = 'wishes';

  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);

    Hive.registerAdapter(TransactionModelAdapter());
    Hive.registerAdapter(WishModelAdapter());

    await Hive.openBox<TransactionModel>(transactionBoxName);
    await Hive.openBox<WishModel>(wishBoxName);
  }

  Box<TransactionModel> get transactionBox => Hive.box<TransactionModel>(transactionBoxName);
  Box<WishModel> get wishBox => Hive.box<WishModel>(wishBoxName);
}