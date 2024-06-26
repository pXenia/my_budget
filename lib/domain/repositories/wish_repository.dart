import '../../data/models/wish_model.dart';

abstract class WishRepository {
  Future<void> addWish(WishModel wish);
  List<WishModel> getWish();
  Future<void> deleteWish(int id);
  Future<void> updateWish(WishModel wish);
}