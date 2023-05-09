import 'dart:io';

import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/pharmacy/controllers/product_controller.dart';
import 'package:doctor/modules/pharmacy/model/product_category.dart';
import 'package:doctor/modules/pharmacy/model/product_image.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/file_picker.dart';
import 'package:hive/hive.dart';
part 'product.g.dart';

@HiveType(typeId: 16)
class Product {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late double price;
  @HiveField(2)
  late double discount;
  @HiveField(3)
  late String description;
  @HiveField(4)
  late User user;
  @HiveField(5)
  late List<ProductImage> productImages = [];
  @HiveField(6)
  late ProductCategory productCategory;
  @HiveField(7)
  late double amount;
  @HiveField(8)
  late bool visibility = false;
  @HiveField(9)
  late String uuid;
  late List<File> imageFiles = [];
  late List<String> localImages = [];
  Product();
  void localizeInfo() {
    var box = Boxes.getProducts();
    box.add(this);
  }

  void addProduct() {
    ProductController().addProduct(this);
  }

  void addToCart() {
    ProductController().addToCart(this);
  }

  int discountPercent() {
    int percent;
    percent = (discount * 100 / price).round();
    return percent;
  }

  double afterDiscount() {
    return price - discount;
  }

  int total = 1;

  double cartPrice() {
    return afterDiscount() * total;
  }

  double cartDiscount() {
    return discount * total;
  }

  Future<List<File?>> pickProductImages() async {
    await pickImages().then((value) {
      imageFiles = [];
      for (var item in value) {
        localImages.add(item.path);
        imageFiles.add(item);
      }
    });

    return imageFiles;
  }

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = double.parse(json['price'].toString());
    discount = double.parse(json['discount'].toString());
    description = json['description'];
    amount = double.parse(json['amount'].toString());
    visibility = json['visibility'];
    uuid = json['uuid'];
    user = User.fromDocumentSnapshot(json['User']);
    productCategory = ProductCategory.fromJson(json['ProductCategory']);
    for (var productImage in json['ProductImages']) {
      productImages.add(ProductImage.fromJson(productImage));
    }
  }
}
