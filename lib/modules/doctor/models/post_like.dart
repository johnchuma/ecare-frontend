import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/doctor/controllers/post_controller.dart';
import 'package:hive/hive.dart';

part 'post_like.g.dart';

@HiveType(typeId: 4)
class PostLike {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late User user;
  PostLike();

  Future removeLike() async {
    await PostController().removeLike(this);
  }

  PostLike.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    user = User.fromDocumentSnapshot(json['User']);
  }
}
