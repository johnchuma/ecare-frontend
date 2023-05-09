import 'dart:io';

import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/doctor/controllers/post_controller.dart';
import 'package:doctor/modules/doctor/models/post_category.dart';
import 'package:doctor/modules/doctor/models/post_comment.dart';
import 'package:doctor/modules/doctor/models/post_image.dart';
import 'package:doctor/modules/doctor/models/post_like.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/file_picker.dart';
import 'package:hive/hive.dart';

part 'post.g.dart';

@HiveType(typeId: 2)
class Post extends HiveObject {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late String caption;
  @HiveField(2)
  late DateTime createdAt;
  @HiveField(3)
  late PostCategory category = PostCategory();
  @HiveField(4)
  late User creator;
  @HiveField(5)
  late List<PostImage> images = [];
  @HiveField(6)
  late List<PostLike> likes = [];
  @HiveField(7)
  late List<PostComment> comments = [];

  late List<File> imageFiles = [];
  late List<String> localImages = [];

  Post();
  void localizeInfo() {
    var box = Boxes.getPosts();
    box.add(this);
  }

  Future addPost() async {
    await PostController().addPost(this);
  }

  Future addComment(String comment) async {
    await PostController().commentPost(this, comment);
  }

  Future likePost() async {
    await PostController().likePost(this);
  }

  Future deletePost() async {
    await PostController().deletePost(this);
  }

  PostLike findMyLike() {
    return likes.where((like) => like.user.email == getMyInfo().email).first;
  }

  bool isLiked() {
    return likes
        .where((like) => like.user.email == getMyInfo().email)
        .isNotEmpty;
  }

  Future<List<File?>> pickPostImages() async {
    await pickImages().then((value) {
      imageFiles = [];
      for (var item in value) {
        localImages.add(item.path);
        imageFiles.add(item);
      }
    });

    return imageFiles;
  }

  Post.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    caption = json['caption'];
    createdAt = DateTime.parse(json['createdAt']);
    category = PostCategory.fromJson(json['PostCategory']);
    creator = User.fromDocumentSnapshot(json['User']);

    for (var image in json['PostImages']) {
      images.add(PostImage.fromJson(image));
    }
    for (var comment in json['PostComments']) {
      comments.add(PostComment.fromJson(comment));
    }
    for (var like in json['PostLikes']) {
      likes.add(PostLike.fromJson(like));
    }
  }
}
