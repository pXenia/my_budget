import '../../data/models/transaction_model.dart';
import '../repositories/transaction_repository.dart';

class GetTransactions {
  final TransactionRepository repository;

  GetTransactions(this.repository);

  List<TransactionModel> call() {
    return repository.getTransactions();
  }
}