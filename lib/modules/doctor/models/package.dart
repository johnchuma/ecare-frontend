// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/doctor/controllers/package_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:hive/hive.dart';

part 'package.g.dart';

@HiveType(typeId: 11)
class Package {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int price;
  @HiveField(2)
  late int duration;
  @HiveField(3)
  late String uuid;
  @HiveField(4)
  late User doctor = User();
  void addPackage() {
    PackageController().addPackage(this);
  }

  IconData packageIcon() {
    IconData iconData = Icons.abc;
    switch (name) {
      case "Messaging":
        iconData = AntDesign.message1;
        break;
      case "Video call":
        iconData = AntDesign.videocamera;
        break;
      case "Voice call":
        iconData = Icons.call;
        break;
      default:
    }
    return iconData;
  }

  String packageDescription() {
    String description = "";
    switch (name) {
      case "Messaging":
        description = "Chat messages with doctor";
        break;
      case "Video call":
        description = "Video call with doctor";
        break;
      case "Voice call":
        description = "Voice call with doctor";
        break;
      default:
    }
    return description;
  }

  Package();
  Package.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    duration = json['duration'];
    uuid = json['uuid'];
    if (json["User"] != null) {
      doctor = User.fromDocumentSnapshot(json['User']);
    }
  }
}
