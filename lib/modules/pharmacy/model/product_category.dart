import 'dart:io';
import 'package:doctor/modules/pharmacy/controllers/product_category_controller.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/file_picker.dart';
import 'package:hive/hive.dart';
part 'product_category.g.dart';

@HiveType(typeId: 15)
class ProductCategory {
  @HiveField(0)
  late String name = "";
  @HiveField(1)
  late String image;
  @HiveField(2)
  late String uuid;

  late File imageFile = File("");
  ProductCategory();

  Future<File?> pickImage() async {
    File? file;
    await pickImages().then((value) {
      image = value.first.path;
      file = value.first;
    });
    imageFile = file!;
    return file;
  }

  void localizeInfo() {
    var box = Boxes.getProductCategories();
    box.add(this);
  }

  void addCategory() {
    ProductCategoryController().addProductCategory(this);
  }

  ProductCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    uuid = json['uuid'];
  }
}
