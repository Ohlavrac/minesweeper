// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryEntityAdapter extends TypeAdapter<HistoryEntity> {
  @override
  final int typeId = 1;

  @override
  HistoryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryEntity(
      points: fields[0] as int?,
      gamemode: fields[1] as String?,
      createdAt: fields[2] as DateTime?,
      win: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.points)
      ..writeByte(1)
      ..write(obj.gamemode)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.win);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
