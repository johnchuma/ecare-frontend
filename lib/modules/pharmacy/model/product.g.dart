// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 16;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product()
      ..name = fields[0] as String
      ..price = fields[1] as double
      ..discount = fields[2] as double
      ..description = fields[3] as String
      ..user = fields[4] as User
      ..productImages = (fields[5] as List).cast<ProductImage>()
      ..productCategory = fields[6] as ProductCategory
      ..amount = fields[7] as double
      ..visibility = fields[8] as bool
      ..uuid = fields[9] as String;
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.discount)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.user)
      ..writeByte(5)
      ..write(obj.productImages)
      ..writeByte(6)
      ..write(obj.productCategory)
      ..writeByte(7)
      ..write(obj.amount)
      ..writeByte(8)
      ..write(obj.visibility)
      ..writeByte(9)
      ..write(obj.uuid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
