import 'package:hive/hive.dart';
part 'product_image.g.dart';

@HiveType(typeId: 17)
class ProductImage {
  @HiveField(0)
  late String image;
  @HiveField(1)
  late String uuid;
  ProductImage();
  ProductImage.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    uuid = json['uuid'];
  }
}
