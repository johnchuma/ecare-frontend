import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/pharmacy/model/product.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'cart.g.dart';

@HiveType(typeId: 18)
class Cart {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late DateTime createdAt;
  @HiveField(2)
  late Product product;
  @HiveField(3)
  late User user;
  bool showDetails = false;
  void localizeInfo() {
    var box = Boxes.getCartProducts();
    box.add(this);
  }

  Cart();
  Cart.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    createdAt = DateTime.parse(json['createdAt']);
    user = User.fromDocumentSnapshot(json['User']);
    product = Product.fromJson(json['Product']);
  }
}
