import '../../data/models/wish_model.dart';
import '../repositories/wish_repository.dart';

class UpdateWishIsDone {
  final WishRepository repository;

  UpdateWishIsDone(this.repository);

  Future<void> call(WishModel wish) async {
    await repository.updateWish(wish);
  }
}