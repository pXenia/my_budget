// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wish_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishModelAdapter extends TypeAdapter<WishModel> {
  @override
  final int typeId = 1;

  @override
  WishModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WishModel(
      id: fields[0] as int,
      name: fields[1] as String,
      cost: fields[2] as double,
      isDone: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, WishModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.cost)
      ..writeByte(3)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
