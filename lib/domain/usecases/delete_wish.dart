import '../repositories/wish_repository.dart';

class DeleteWish {
  final WishRepository repository;

  DeleteWish(this.repository);

  Future<void> call(String id) async {
    await repository.deleteWish(id);
  }
}