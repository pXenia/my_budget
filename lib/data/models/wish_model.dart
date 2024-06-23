import 'package:hive/hive.dart';

part 'wish_model.g.dart';

@HiveType(typeId: 1)
class WishModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double cost;

  @HiveField(3)
  final bool type;

  WishModel({
    required this.id,
    required this.name,
    required this.cost,
    required this.type,
  });
}
