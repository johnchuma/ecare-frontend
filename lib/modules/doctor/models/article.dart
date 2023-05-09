import 'dart:io';

import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/doctor/controllers/article_controlller.dart';
import 'package:doctor/modules/doctor/models/article_category.dart';
import 'package:doctor/modules/doctor/models/post_comment.dart';
import 'package:doctor/modules/doctor/models/post_image.dart';
import 'package:doctor/modules/doctor/models/post_like.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/file_picker.dart';
import 'package:hive/hive.dart';

part 'article.g.dart';

@HiveType(typeId: 7)
class Article extends HiveObject {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late String title;
  @HiveField(2)
  late String description;
  @HiveField(3)
  late DateTime createdAt;
  @HiveField(4)
  late ArticleCategory category = ArticleCategory();
  @HiveField(5)
  late User creator;
  @HiveField(6)
  late List<PostImage> images = [];
  @HiveField(7)
  late List<PostLike> likes = [];
  @HiveField(8)
  late List<PostComment> comments = [];
  @HiveField(9)
  late bool isBookmarked = false;

  late List<File> imageFiles = [];
  late List<String> localImages = [];

  Article();
  void localizeInfo() {
    var box = Boxes.getArticles();
    box.add(this);
  }

  Future deleteArticle() async {
    await ArticleController().deleteArticle(this);
  }

  Future addArticle() async {
    await ArticleController().addArticle(this);
  }

  // Future addComment(String comment) async {
  //   await PostController().commentPost(this, comment);
  // }

  Future bookmarkArticle() async {
    await ArticleController().bookmarkArticle(this);
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

  Article.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    title = json['title'];
    description = json['description'];
    createdAt = DateTime.parse(json['createdAt']);
    category = ArticleCategory.fromJson(json['ArticleCategory']);
    creator = User.fromDocumentSnapshot(json['User']);
    isBookmarked = json['isBookmarked'] == 1 ? true : false;

    for (var image in json['ArticleImages']) {
      images.add(PostImage.fromJson(image));
    }
    for (var comment in json['ArticleComments']) {
      comments.add(PostComment.fromJson(comment));
    }
    for (var like in json['ArticleLikes']) {
      likes.add(PostLike.fromJson(like));
    }
  }
}
