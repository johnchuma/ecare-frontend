// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/pharmacy/model/product.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:random_color/random_color.dart';
part 'order.g.dart';

@HiveType(typeId: 19)
class Order {
  @HiveField(0)
  late String uuid;
  @HiveField(1)
  late DateTime confirmedAt = DateTime(2000, 1, 1, 1, 1, 1, 1, 1);
  @HiveField(2)
  late DateTime onDeliveryAt = DateTime(2000, 1, 1, 1, 1, 1, 1, 1);
  @HiveField(3)
  late DateTime createdAt;
  @HiveField(4)
  late DateTime deliveredAt = DateTime(2000, 1, 1, 1, 1, 1, 1, 1);
  @HiveField(5)
  late List<Product> products = [];
  @HiveField(6)
  late User user;

  RandomColor generate = RandomColor();

  Color getColor() {
    return generate.randomColor();
  }

  Order();
  void localizeInfo() {
    var box = Boxes.getOrders();
    box.add(this);
  }

  Order.findJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    if (json['confirmedAt'] != null) {
      confirmedAt = DateTime.parse(json['confirmedAt']);
    }
    if (json['onDeliveryAt'] != null) {
      onDeliveryAt = DateTime.parse(json['onDeliveryAt']);
    }
    if (json['deliveredAt'] != null) {
      deliveredAt = DateTime.parse(json['deliveredAt']);
    }
    createdAt = DateTime.parse(json['createdAt']);
    user = User.fromDocumentSnapshot(json['User']);
    for (var product in json['ProductOrders']) {
      products.add(Product.fromJson(product['Product']));
    }
  }
}
