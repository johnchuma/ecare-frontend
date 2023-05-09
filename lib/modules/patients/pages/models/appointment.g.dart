// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentAdapter extends TypeAdapter<Appointment> {
  @override
  final int typeId = 14;

  @override
  Appointment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Appointment()
      ..uuid = fields[0] as String
      ..startingTime = fields[1] as DateTime
      ..duration = fields[2] as int
      ..problem = fields[3] as String
      ..member = fields[4] as Family
      ..status = fields[5] as String
      ..package = fields[6] as Package
      ..patient = fields[7] as User
      ..doctor = fields[8] as User
      ..createdAt = fields[9] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Appointment obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.startingTime)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.problem)
      ..writeByte(4)
      ..write(obj.member)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.package)
      ..writeByte(7)
      ..write(obj.patient)
      ..writeByte(8)
      ..write(obj.doctor)
      ..writeByte(9)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
