// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleCategoryAdapter extends TypeAdapter<ArticleCategory> {
  @override
  final int typeId = 6;

  @override
  ArticleCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleCategory()
      ..uuid = fields[0] as String
      ..name = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, ArticleCategory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
