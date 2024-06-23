import 'package:get_it/get_it.dart';
import 'package:my_budget/domain/repositories/transaction_repository.dart';
import 'package:my_budget/presentation/state/transaction_store.dart';
import 'data/data_sources/local/database.dart';
import 'data/repositories/transaction_repository_impl.dart';
import 'domain/usecases/add_transaction.dart';
import 'domain/usecases/delete_transaction.dart';
import 'domain/usecases/get_transactions.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // External
  final hiveDatabase = Database();
  await hiveDatabase.init();
  getIt.registerSingleton<Database>(hiveDatabase);

  // Repositories
  getIt.registerLazySingleton<TransactionRepository>(() => TransactionRepositoryImpl(getIt()));

  // Usecases
  getIt.registerLazySingleton(() => AddTransaction(getIt()));
  getIt.registerLazySingleton(() => GetTransactions(getIt()));
  getIt.registerLazySingleton(() => DeleteTransaction(getIt()));

  // Stores
  getIt.registerLazySingleton(() => TransactionStore());
}