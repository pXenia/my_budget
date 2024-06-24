import 'package:get_it/get_it.dart';
import 'package:my_budget/domain/repositories/transaction_repository.dart';
import 'package:my_budget/presentation/state/transaction_store.dart';
import 'package:my_budget/presentation/state/wish_store.dart';
import 'data/data_sources/local/database.dart';
import 'data/repositories/transaction_repository_impl.dart';
import 'data/repositories/wish_repository_impl.dart';
import 'domain/repositories/wish_repository.dart';
import 'domain/usecases/add_transaction.dart';
import 'domain/usecases/add_wish.dart';
import 'domain/usecases/delete_transaction.dart';
import 'domain/usecases/delete_wish.dart';
import 'domain/usecases/get_transactions.dart';
import 'domain/usecases/get_wishes.dart';

final getIt = GetIt.instance;

Future<void> init() async {

  final database = Database();
  await database.init();
  getIt.registerSingleton<Database>(database);

  getIt.registerLazySingleton<TransactionRepository>(() => TransactionRepositoryImpl(getIt()));
  getIt.registerLazySingleton<WishRepository>(() => WishRepositoryImpl(getIt()));

  getIt.registerLazySingleton(() => AddTransaction(getIt()));
  getIt.registerLazySingleton(() => GetTransactions(getIt()));
  getIt.registerLazySingleton(() => DeleteTransaction(getIt()));

  getIt.registerLazySingleton(() => AddWish(getIt()));
  getIt.registerLazySingleton(() => GetWishes(getIt()));
  getIt.registerLazySingleton(() => DeleteWish(getIt()));

  getIt.registerLazySingleton(() => TransactionStore());
  getIt.registerLazySingleton(() => WishStore());
}