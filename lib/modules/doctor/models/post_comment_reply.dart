import 'package:doctor/modules/authentication/models/user.dart';
import 'package:hive/hive.dart';
part 'post_comment_reply.g.dart';

@HiveType(typeId: 9)
class PostCommentReply {
  @HiveField(0)
  late String reply;
  @HiveField(1)
  late String uuid;
  @HiveField(2)
  late User user;
  PostCommentReply();
  PostCommentReply.fromJson(Map<String, dynamic> json) {
    reply = json['reply'];
    uuid = json['uuid'];
    user = User.fromDocumentSnapshot(json['user']);
  }
}
