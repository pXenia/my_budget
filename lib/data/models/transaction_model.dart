import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  bool type;

  @HiveField(4)
  double cost;

  TransactionModel({required this.id, required this.name, required this.date, required this.type, required this.cost});
}
