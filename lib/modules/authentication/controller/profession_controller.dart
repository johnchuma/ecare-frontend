// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:doctor/modules/authentication/models/profession.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/toasts.dart';

import '../../../utils/endpoint.dart';

class ProfessionController {
  Future getProfessions() async {
    try {
      var response = await Dio().get(
        '${production}profession/',
      );
      print(response);
      if (response.data['status'] == true) {
        var results = response.data['body'];
        var box = Boxes.getProfessions();
        box.clear().then((value) {
          for (var result in results) {
            var profession = Profession.fromJson(result);
            profession.localizeInfo();
          }
        });
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
    } on DioError catch (e) {
      print(e);
      // errorToast(e.response!.data['message']);
      // print(e.response);
    }
  }
}
