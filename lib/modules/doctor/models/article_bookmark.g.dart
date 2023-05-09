// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_bookmark.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleBookmarkAdapter extends TypeAdapter<ArticleBookmark> {
  @override
  final int typeId = 8;

  @override
  ArticleBookmark read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleBookmark()
      ..uuid = fields[0] as String
      ..article = fields[1] as Article
      ..createdAt = fields[2] as DateTime;
  }

  @override
  void write(BinaryWriter writer, ArticleBookmark obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.article)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleBookmarkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
