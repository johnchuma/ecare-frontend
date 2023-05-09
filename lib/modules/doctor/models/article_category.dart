import 'package:doctor/utils/boxes.dart';
import 'package:hive/hive.dart';
part 'article_category.g.dart';

@HiveType(typeId: 6)
class ArticleCategory extends HiveObject {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late String name;
  ArticleCategory();
  void localizeInfo() {
    var box = Boxes.getArticleCategories();
    box.add(this);
  }

  ArticleCategory.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
  }
}
