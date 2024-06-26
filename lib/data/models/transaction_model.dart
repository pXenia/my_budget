import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  DateTime date;

  @HiveField(3)
  bool isIncome;

  @HiveField(4)
  double cost;

  TransactionModel(
      {required this.id,
      required this.name,
      required this.date,
      required this.isIncome,
      required this.cost});
}
