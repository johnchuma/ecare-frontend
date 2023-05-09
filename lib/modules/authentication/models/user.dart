// ignore_for_file: avoid_print

import 'dart:io';

import 'package:doctor/modules/authentication/controller/auth_controller.dart';
import 'package:doctor/modules/authentication/models/profession.dart';
import 'package:doctor/modules/doctor/controllers/timetable_controller.dart';
import 'package:doctor/modules/doctor/models/package.dart';
import 'package:doctor/modules/doctor/models/timetable.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/file_picker.dart';
import 'package:hive/hive.dart';

import '../../../utils/map_functions.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  late String name = "";
  @HiveField(1)
  late String image = "";
  @HiveField(2)
  late String email = "";
  @HiveField(3)
  late String phone = "";
  @HiveField(4)
  late String password = "";
  @HiveField(5)
  late String type = "";
  @HiveField(6)
  late String tokens = "";
  @HiveField(7)
  late String hospital = "";
  @HiveField(8)
  late Profession profession = Profession();
  @HiveField(9)
  late String licence = "";
  @HiveField(10)
  late int age = 0;
  @HiveField(11)
  late String gender = "";
  @HiveField(12)
  late String uuid = "";
  @HiveField(13)
  late List<Timetable> timetables = [];
  @HiveField(14)
  late List<Package> packages = [];
  @HiveField(15)
  late double? latitude = 0;
  @HiveField(16)
  late double? longitude = 0;
  late File imageFile;
  late String code;

  void signin() {
    print(email);
    AuthController.signIn(this);
  }

  User();
  String getDistanceFromService() {
    print(latitude);
    print(longitude);

    print(getMyInfo().latitude);
    print(getMyInfo().longitude);

    var meters = getDistanceBetween(
        latitude!, longitude!, getMyInfo().latitude!, getMyInfo().longitude!);
    var value = "";
    if (meters < 100) {
      value = "$meters Meters";
    } else {
      value = "${(meters / 1000).round()}Km";
    }
    return value;
  }

  Future<File?> pickProfileImage() async {
    File? file;
    await pickImages().then((value) {
      image = value.first.path;
      file = value.first;
    });
    imageFile = file!;
    return file;
  }

  void registerUser() {
    AuthController.registerUser(this);
  }

  void forgotPassword() {
    AuthController.forgotPassword(this);
  }

  void updatePassword() {
    AuthController.updatePassword(this);
  }

  void findMyTimetable() {
    TimetableController().findDoctorTimetable(this);
  }

  void localizeMyInfo(User user) {
    var box = Boxes.getUsers();
    box.put('me', user);
  }

  void localizeDoctor() {
    var box = Boxes.getDoctors();
    box.add(this);
  }

  User.fromDocumentSnapshot(Map<String, dynamic> json) {
    name = json['name'];
    uuid = json['uuid'];
    email = json['email'];
    phone = json['phone'];
    type = json['type'];
    image = json['image'];
    password = json['password'];
    hospital = json['hospital'];
    latitude = double.parse(json['latitude'].toString());
    longitude = double.parse(json['longitude'].toString());

    age = json['age'];
    gender = json['gender'];
    licence = json['licence'].toString();
    if (json['Profession'] != null) {
      profession = Profession.fromJson(json['Profession']);
    }
    if (json['Timetables'] != null) {
      for (var timetable in json['Timetables']) {
        timetables.add(Timetable.fromJson(timetable));
      }
    }
  }
}
