import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:hive/hive.dart';

Box box = Boxes.getUsers();
User getMyInfo() {
  User me = box.get("me");
  return me;
}
