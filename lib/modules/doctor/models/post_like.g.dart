// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_like.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostLikeAdapter extends TypeAdapter<PostLike> {
  @override
  final int typeId = 4;

  @override
  PostLike read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostLike()
      ..uuid = fields[0] as String
      ..user = fields[1] as User;
  }

  @override
  void write(BinaryWriter writer, PostLike obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.uuid)
      ..writeByte(1)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostLikeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
