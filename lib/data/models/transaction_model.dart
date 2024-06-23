import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final bool type;

  @HiveField(4)
  final double cost;

  TransactionModel({
    required this.id,
    required this.name,
    required this.date,
    required this.type,
    required this.cost,
  });
}
