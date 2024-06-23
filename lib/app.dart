import 'package:get_it/get_it.dart';
import 'package:my_budget/presentation/state/transaction_store.dart';

import 'data/data_sources/local/database.dart';
import 'data/repositories/transaction_repository_impl.dart';
import 'domain/repositories/transaction_repository.dart';
import 'domain/usecases/add_transaction.dart';
import 'domain/usecases/delete_transaction.dart';
import 'domain/usecases/get_transactions.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton<Database>(() => DatabaseImpl());

  // Repositories
  getIt.registerLazySingleton<TransactionRepository>(() => TransactionRepositoryImpl(hiveDatabase: getIt()));

  // Usecases
  getIt.registerLazySingleton(() => GetTransactions(getIt()));
  getIt.registerLazySingleton(() => DeleteTransaction(getIt()));
  getIt.registerLazySingleton(() => AddTransaction(getIt()));


  // Stores
  getIt.registerFactory(() => TransactionStore(
    getTransactions: getIt(),
    addTransaction: getIt(),
    deleteTransaction: getIt(),
  ));

}