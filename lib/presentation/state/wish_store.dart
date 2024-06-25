import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:my_budget/domain/usecases/update_wish_isDone.dart';
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
  final UpdateWishIsDone _updateWishIsDone = GetIt.instance<UpdateWishIsDone>();

  @observable
  ObservableList<WishModel> wishes = ObservableList<WishModel>();

  @computed
  int get nextId => wishes.length + 1;

  @computed
  double get allWishesSum {
    double sumValue = 0.0;
    for (var element in wishes) {
      if (!element.isDone) {
        sumValue += element.cost;
      }
    }
    return sumValue;
  }

  @action
  Future<void> loadWishes() async {
    final loadedWishes = await _getWishes();
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

  @action
  Future<void> updateWishIsDone(WishModel wish) async {
    await _updateWishIsDone(wish);
    int index = wishes.indexWhere((w) => w.id == wish.id);
    if (index != -1) {
      wishes[index] = wish;
    }
  }
}