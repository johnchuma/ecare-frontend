import 'package:doctor/utils/boxes.dart';
import 'package:hive/hive.dart';

part 'profession.g.dart';

@HiveType(typeId: 12)
class Profession {
  @HiveField(0)
  late String title = "";
  @HiveField(1)
  late String uuid = "";
  Profession();
  void localizeInfo() {
    var box = Boxes.getProfessions();
    box.add(this);
  }

  Profession.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    title = json['title'];
  }
}
