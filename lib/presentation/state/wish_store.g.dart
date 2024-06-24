// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WishStore on _WishStore, Store {
  Computed<int>? _$nextIdComputed;

  @override
  int get nextId => (_$nextIdComputed ??=
          Computed<int>(() => super.nextId, name: '_WishStore.nextId'))
      .value;

  late final _$wishesAtom = Atom(name: '_WishStore.wishes', context: context);

  @override
  ObservableList<WishModel> get wishes {
    _$wishesAtom.reportRead();
    return super.wishes;
  }

  @override
  set wishes(ObservableList<WishModel> value) {
    _$wishesAtom.reportWrite(value, super.wishes, () {
      super.wishes = value;
    });
  }

  late final _$loadWishesAsyncAction =
      AsyncAction('_WishStore.loadWishes', context: context);

  @override
  Future<void> loadWishes() {
    return _$loadWishesAsyncAction.run(() => super.loadWishes());
  }

  late final _$createWishAsyncAction =
      AsyncAction('_WishStore.createWish', context: context);

  @override
  Future<void> createWish(WishModel wish) {
    return _$createWishAsyncAction.run(() => super.createWish(wish));
  }

  late final _$deleteWishAsyncAction =
      AsyncAction('_WishStore.deleteWish', context: context);

  @override
  Future<void> deleteWish(String id) {
    return _$deleteWishAsyncAction.run(() => super.deleteWish(id));
  }

  @override
  String toString() {
    return '''
wishes: ${wishes},
nextId: ${nextId}
    ''';
  }
}
