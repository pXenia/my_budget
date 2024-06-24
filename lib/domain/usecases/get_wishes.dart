import '../../data/models/wish_model.dart';
import '../repositories/wish_repository.dart';

class GetWishes {
  final WishRepository repository;

  GetWishes(this.repository);

  List<WishModel> call() {
    return repository.getWish();
  }
}