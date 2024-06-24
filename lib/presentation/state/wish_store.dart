import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../data/models/wish_model.dart';
import '../../domain/usecases/add_wish.dart';
import '../../domain/usecases/delete_wish.dart';
import '../../domain/usecases/get_wishes.dart';

part 'wish_store.g.dart';

class WishStore = _WishStore with _$WishStore;

abstract class _WishStore with Store {
  final AddWish _addWish = GetIt.instance<AddWish>();
  final GetWishes _getWishes = GetIt.instance<GetWishes>();
  final DeleteWish _deleteWish = GetIt.instance<DeleteWish>();

  @observable
  ObservableList<WishModel> wishes = ObservableList<WishModel>();

  @computed
  int get nextId => wishes.length + 1;

  @action
  Future<void> loadWishes() async {
    final loadedWishes = _getWishes();
    wishes = ObservableList.of(loadedWishes);
  }

  @action
  Future<void> createWish(WishModel wish) async {
    await _addWish(wish);
    wishes.add(wish);
  }

  @action
  Future<void> deleteWish(String id) async {
    await _deleteWish(id);
    wishes.removeWhere((wish) => wish.id == id);
  }
}