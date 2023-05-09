// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 2;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post()
      ..uuid = fields[0] as String
      ..caption = fields[1] as String
      ..createdAt = fields[2] as DateTime
      ..category = fields[3] as PostCategory
      ..creator = fields[4] as User
      ..images = (fields[5] as List).cast<PostImage>()
      ..likes = (fields[6] as List).cast<PostLike>()
      ..comments = (fields[7] as List).cast<PostComment>();
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.caption)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.creator)
      ..writeByte(5)
      ..write(obj.images)
      ..writeByte(6)
      ..write(obj.likes)
      ..writeByte(7)
      ..write(obj.comments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
