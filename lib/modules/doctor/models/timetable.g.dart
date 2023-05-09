// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimetableAdapter extends TypeAdapter<Timetable> {
  @override
  final int typeId = 10;

  @override
  Timetable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Timetable()
      ..weekday = fields[0] as String
      ..startingTime = fields[1] as String
      ..endingTime = fields[2] as String
      ..uuid = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, Timetable obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.weekday)
      ..writeByte(1)
      ..write(obj.startingTime)
      ..writeByte(2)
      ..write(obj.endingTime)
      ..writeByte(3)
      ..write(obj.uuid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimetableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
