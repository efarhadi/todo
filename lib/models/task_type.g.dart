// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TasktyleAdapter extends TypeAdapter<Tasktyle> {
  @override
  final int typeId = 6;

  @override
  Tasktyle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tasktyle(
      images: fields[0] as String,
      title: fields[1] as String,
      TasltypeEnum: fields[2] as TaskTypeEnum,
    );
  }

  @override
  void write(BinaryWriter writer, Tasktyle obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.images)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.TasltypeEnum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TasktyleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
