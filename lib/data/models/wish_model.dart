import 'package:hive/hive.dart';

part 'wish_model.g.dart';

@HiveType(typeId: 1)
class WishModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  double cost;

  @HiveField(3)
  bool type;

  WishModel({
    required this.id,
    required this.name,
    required this.cost,
    required this.type,
  });
}
