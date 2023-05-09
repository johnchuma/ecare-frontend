// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:doctor/modules/family/models/family.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/endpoint.dart';
import 'package:doctor/utils/loader.dart';
import 'package:doctor/utils/toasts.dart';

class FamilyController {
  Future<void> addFamily(Family family) async {
    try {
      launchLoader();
      print(family.name);
      FormData formData = FormData.fromMap({
        "name": family.name,
        "bloodGroup": family.bloodGroup,
        "age": family.age,
        "gender": family.gender,
        "length": family.length,
        "weight": family.weight,
        "relationship": family.relationship,
        'file': await MultipartFile.fromFile(family.imageFile.path,
            filename: family.image.split('/').last)
      });
      var response = await Dio().post('${production}family',
          options: Options(
              headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
          data: formData);

      if (response.data['status'] == true) {
        await getFamily();
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
      removeGetWidget();
      removeGetWidget();
    } on DioError catch (e) {
      removeGetWidget();
      print(e.response);
      // errorToast(e.response!.data['error']);
      // print(e.response);
    }
  }

  Future getFamily() async {
    try {
      var response = await Dio().get(
        '${production}family/',
        options:
            Options(headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
      );
      print(response);
      if (response.data['status'] == true) {
        var results = response.data['body'];
        var box = Boxes.getfamily();
        box.clear().then((value) {
          for (var result in results) {
            Family family = Family.fromJson(result);
            family.localizeInfo();
          }
        });
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
    } on DioError catch (e) {
      errorToast(e.response!.data['message']);
      print(e.response);
    }
  }
}
