import 'package:doctor/modules/authentication/models/user.dart';
import 'package:hive/hive.dart';

part 'post_comment.g.dart';

@HiveType(typeId: 5)
class PostComment {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late String comment;
  @HiveField(2)
  late User user;
  @HiveField(3)
  late DateTime createdAt;
  PostComment();
  PostComment.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    comment = json['comment'];
    createdAt = DateTime.parse(json['createdAt']);
    user = User.fromDocumentSnapshot(json['User']);
  }
}
