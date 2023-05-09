import 'package:doctor/utils/boxes.dart';
import 'package:hive/hive.dart';

part 'post_category.g.dart';

@HiveType(typeId: 1)
class PostCategory extends HiveObject {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late String name;
  PostCategory();
  void localizeInfo() {
    var box = Boxes.getPostCategories();
    box.add(this);
  }

  PostCategory.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
  }
}
