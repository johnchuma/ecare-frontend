// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleAdapter extends TypeAdapter<Article> {
  @override
  final int typeId = 7;

  @override
  Article read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Article()
      ..uuid = fields[0] as String
      ..title = fields[1] as String
      ..description = fields[2] as String
      ..createdAt = fields[3] as DateTime
      ..category = fields[4] as ArticleCategory
      ..creator = fields[5] as User
      ..images = (fields[6] as List).cast<PostImage>()
      ..likes = (fields[7] as List).cast<PostLike>()
      ..comments = (fields[8] as List).cast<PostComment>()
      ..isBookmarked = fields[9] as bool;
  }

  @override
  void write(BinaryWriter writer, Article obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.creator)
      ..writeByte(6)
      ..write(obj.images)
      ..writeByte(7)
      ..write(obj.likes)
      ..writeByte(8)
      ..write(obj.comments)
      ..writeByte(9)
      ..write(obj.isBookmarked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
