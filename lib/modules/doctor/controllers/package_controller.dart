import 'package:dio/dio.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/doctor/models/package.dart';
// ignore: unused_import
import 'package:doctor/modules/doctor/models/post_category.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/loader.dart';
import 'package:doctor/utils/toasts.dart';

import '../../../utils/endpoint.dart';

class PackageController {
  Future<void> addPackage(Package package) async {
    try {
      launchLoader();
      var response = await Dio().post('${production}package/',
          options: Options(
              headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
          data: {
            "name": package.name,
            "price": package.price,
            "duration": package.duration
          });

      // await getPost();
      if (response.data['status'] == true) {
        findDoctorPackages(getMyInfo());
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
      removeGetWidget();
      removeGetWidget();
    } on DioError catch (e) {
      removeGetWidget();
      // ignore: avoid_print
      print(e);
      // errorToast(e.response!.data['error']);
      // print(e.response);
    }
  }

  Future<void> findDoctorPackages(User user) async {
    try {
      var response = await Dio().get(
        '${production}package/doctor/${user.uuid}',
        options:
            Options(headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
      );
      if (response.data['status'] == true) {
        var results = response.data['body'];
        user.packages = [];
        for (var result in results) {
          Package package = Package.fromJson(result);
          user.packages.add(package);
        }
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
      user.save();
    } on DioError {
      // errorToast(e.response!.data['error']);
      // print(e.response);
    }
  }
}
