// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..name = fields[0] as String
      ..image = fields[1] as String
      ..email = fields[2] as String
      ..phone = fields[3] as String
      ..password = fields[4] as String
      ..type = fields[5] as String
      ..tokens = fields[6] as String
      ..hospital = fields[7] as String
      ..profession = fields[8] as Profession
      ..licence = fields[9] as String
      ..age = fields[10] as int
      ..gender = fields[11] as String
      ..uuid = fields[12] as String
      ..timetables = (fields[13] as List).cast<Timetable>()
      ..packages = (fields[14] as List).cast<Package>()
      ..latitude = fields[15] as double?
      ..longitude = fields[16] as double?;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.tokens)
      ..writeByte(7)
      ..write(obj.hospital)
      ..writeByte(8)
      ..write(obj.profession)
      ..writeByte(9)
      ..write(obj.licence)
      ..writeByte(10)
      ..write(obj.age)
      ..writeByte(11)
      ..write(obj.gender)
      ..writeByte(12)
      ..write(obj.uuid)
      ..writeByte(13)
      ..write(obj.timetables)
      ..writeByte(14)
      ..write(obj.packages)
      ..writeByte(15)
      ..write(obj.latitude)
      ..writeByte(16)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
