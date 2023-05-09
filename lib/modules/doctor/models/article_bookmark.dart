import 'package:doctor/modules/doctor/controllers/article_controlller.dart';
import 'package:doctor/modules/doctor/models/article.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:hive/hive.dart';

part 'article_bookmark.g.dart';

@HiveType(typeId: 8)
class ArticleBookmark {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late Article article;
  @HiveField(2)
  late DateTime createdAt;
  ArticleBookmark();

  Future removeBookmark() async {
    await ArticleController().removeBookmark(this);
  }

  void localizeInfo() {
    var box = Boxes.getArticleBookmarks();
    box.add(this);
  }

  ArticleBookmark.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    article = Article.fromJson(json['Article']);
    createdAt = DateTime.parse(json['createdAt']);
  }
}
