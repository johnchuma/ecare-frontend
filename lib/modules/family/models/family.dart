import 'dart:io';

import 'package:doctor/modules/family/controller/family_controller.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/file_picker.dart';
import 'package:hive/hive.dart';
part 'family.g.dart';

@HiveType(typeId: 13)
class Family {
  @HiveField(0)
  late String name = "";
  @HiveField(1)
  late int age;
  @HiveField(2)
  late double length;
  @HiveField(3)
  late String gender;
  @HiveField(4)
  late String relationship;
  @HiveField(5)
  late String image;
  @HiveField(6)
  late String bloodGroup;
  @HiveField(7)
  late String uuid = "";
  @HiveField(8)
  late double weight;
  void localizeInfo() {
    var box = Boxes.getfamily();
    box.add(this);
  }

  void addFamilyMember() {
    FamilyController().addFamily(this);
  }

  late File imageFile;

  Future<File?> pickProfileImage() async {
    File? file;
    await pickImages().then((value) {
      image = value.first.path;

      file = value.first;
    });
    imageFile = file!;
    return file;
  }

  Family();
  Family.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uuid = json['uuid'];
    age = json['age'];
    length = double.parse(json['length'].toString());
    weight = double.parse(json['weight'].toString());
    gender = json['gender'];
    relationship = json['relationship'];
    image = json['image'];
    bloodGroup = json['bloodGroup'];
  }
}
