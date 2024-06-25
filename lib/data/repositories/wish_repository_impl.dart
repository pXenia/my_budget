import '../../domain/repositories/wish_repository.dart';
import '../data_sources/local/database.dart';
import '../models/wish_model.dart';

class WishRepositoryImpl implements WishRepository {
  final Database database;

  WishRepositoryImpl(this.database);

  @override
  Future<void> addWish(WishModel wish) async {
    final box = database.wishBox;
    await box.put(wish.id, wish);
  }

  @override
  List<WishModel> getWish() {
    final box = database.wishBox;
    return box.values.toList();
  }

  @override
  Future<void> deleteWish(String id) async {
    final box = database.wishBox;
    await box.delete(id);
  }

  @override
  Future<void> updateWish(WishModel wish) async {
    final box = database.wishBox;
    await box.put(wish.id, wish);
  }
}