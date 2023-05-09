// ignore_for_file: avoid_print, duplicate_ignore

import 'package:dio/dio.dart';
import 'package:doctor/modules/authentication/models/user.dart';
// ignore: unused_import
import 'package:doctor/modules/doctor/models/post_category.dart';
import 'package:doctor/modules/doctor/models/timetable.dart';
import 'package:doctor/modules/patients/pages/models/appointment.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/loader.dart';
import 'package:doctor/utils/toasts.dart';

import '../../../utils/endpoint.dart';

class TimetableController {
  Future<void> addTimetable(Timetable timetable) async {
    try {
      launchLoader();
      var response = await Dio().post('${production}timetable/',
          options: Options(
              headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
          data: {
            "weekday": timetable.weekday,
            "startingTime": timetable.startingTime,
            "endingTime": timetable.endingTime,
          });
      // await getPost();
      if (response.data['status'] == true) {
        findDoctorTimetable(getMyInfo());
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

  Future<void> findDoctorTimetable(User doctor,
      {Appointment? appointment}) async {
    try {
      var response = await Dio().get(
        '${production}timetable/doctor/${doctor.uuid}',
        options:
            Options(headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
      );

      if (response.data['status'] == true) {
        var results = response.data['body'];
        doctor.timetables = [];
        for (var result in results) {
          Timetable timetable = Timetable.fromJson(result);
          doctor.timetables.add(timetable);
        }
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
      if (appointment != null) {
        appointment.package.doctor.timetables = doctor.timetables;
        appointment.save();
      } else {
        print(doctor.timetables);
        doctor.save();
      }
      print(appointment?.package.doctor.timetables);
    } on DioError {
      // errorToast(e.response!.data['error']);
      // print(e.response);
    }
  }
}
