import 'package:hive/hive.dart';

part 'post_image.g.dart';

@HiveType(typeId: 3)
class PostImage {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late String picture;
  PostImage();
  PostImage.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    picture = json['picture'];
  }
}
