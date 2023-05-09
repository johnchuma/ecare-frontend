// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FamilyAdapter extends TypeAdapter<Family> {
  @override
  final int typeId = 13;

  @override
  Family read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Family()
      ..name = fields[0] as String
      ..age = fields[1] as int
      ..length = fields[2] as double
      ..gender = fields[3] as String
      ..relationship = fields[4] as String
      ..image = fields[5] as String
      ..bloodGroup = fields[6] as String
      ..uuid = fields[7] as String
      ..weight = fields[8] as double;
  }

  @override
  void write(BinaryWriter writer, Family obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.length)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.relationship)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.bloodGroup)
      ..writeByte(7)
      ..write(obj.uuid)
      ..writeByte(8)
      ..write(obj.weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FamilyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
