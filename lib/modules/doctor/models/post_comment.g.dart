// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostCommentAdapter extends TypeAdapter<PostComment> {
  @override
  final int typeId = 5;

  @override
  PostComment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostComment()
      ..uuid = fields[0] as String
      ..comment = fields[1] as String
      ..user = fields[2] as User
      ..createdAt = fields[3] as DateTime;
  }

  @override
  void write(BinaryWriter writer, PostComment obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.comment)
      ..writeByte(2)
      ..write(obj.user)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostCommentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
