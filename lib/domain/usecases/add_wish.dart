import '../../data/models/wish_model.dart';
import '../repositories/wish_repository.dart';

class AddWish {
  final WishRepository repository;

  AddWish(this.repository);

  Future<void> call(WishModel wish) {
    return repository.addWish(wish);
  }
}