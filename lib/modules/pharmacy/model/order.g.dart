// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderAdapter extends TypeAdapter<Order> {
  @override
  final int typeId = 19;

  @override
  Order read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Order()
      ..uuid = fields[0] as String
      ..confirmedAt = fields[1] as DateTime
      ..onDeliveryAt = fields[2] as DateTime
      ..createdAt = fields[3] as DateTime
      ..deliveredAt = fields[4] as DateTime
      ..products = (fields[5] as List).cast<Product>()
      ..user = fields[6] as User;
  }

  @override
  void write(BinaryWriter writer, Order obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.confirmedAt)
      ..writeByte(2)
      ..write(obj.onDeliveryAt)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.deliveredAt)
      ..writeByte(5)
      ..write(obj.products)
      ..writeByte(6)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
