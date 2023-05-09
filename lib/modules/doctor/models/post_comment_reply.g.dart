// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_reply.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostCommentReplyAdapter extends TypeAdapter<PostCommentReply> {
  @override
  final int typeId = 9;

  @override
  PostCommentReply read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostCommentReply()
      ..reply = fields[0] as String
      ..uuid = fields[1] as String
      ..user = fields[2] as User;
  }

  @override
  void write(BinaryWriter writer, PostCommentReply obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.reply)
      ..writeByte(1)
      ..write(obj.uuid)
      ..writeByte(2)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostCommentReplyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
