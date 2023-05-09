// ignore_for_file: unused_catch_clause, empty_catches, avoid_print

import 'package:dio/dio.dart';
import 'package:doctor/modules/patients/pages/models/appointment.dart';
import 'package:doctor/utils/authentication.dart';
import 'package:doctor/utils/boxes.dart';
import 'package:doctor/utils/endpoint.dart';
import 'package:doctor/utils/loader.dart';
import 'package:doctor/utils/toasts.dart';

class AppointmentController {
  Future addAppointment(Appointment appointment) async {
    try {
      launchLoader();
      String startingTime =
          "${appointment.startingTime.year}-${appointment.startingTime.month.toString().padLeft(2, "0")}-${appointment.startingTime.day.toString().padLeft(2, "0")} ${appointment.startingTime.hour.toString().padLeft(2, "0")}:${appointment.startingTime.minute.toString().padLeft(2, "0")}:00";
      print(startingTime);
      var response = await Dio().post('${production}appointment/',
          options: Options(
              headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
          data: {
            "duration": appointment.duration,
            "problem": appointment.problem,
            "startingTime": startingTime,
            "package_uuid": appointment.package.uuid,
            "family_uuid": appointment.member.uuid
          });
      print(response);
      if (response.data['status'] == true) {
        await getAppointments();
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
      removeGetWidget();
    } on DioError catch (e) {
      removeGetWidget();
      // errorToast(e.response!.data['error']);
    }
  }

  Future rescheduleAppointment(Appointment appointment) async {
    try {
      launchLoader();
      String startingTime =
          "${appointment.startingTime.day}-${appointment.startingTime.month}-${appointment.startingTime.year} ${appointment.startingTime.hour.toString().padLeft(2, "0")}:${appointment.startingTime.minute.toString().padLeft(2, "0")}:00";

      print(startingTime);
      var response = await Dio().patch(
          '${production}appointment/reschedule/${appointment.uuid}',
          options: Options(
              headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
          data: {
            "problem": appointment.rescheduleProblem,
            "startingTime": startingTime,
          });

      if (response.data['status'] == true) {
        await getAppointments();
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
      removeGetWidget();
    } on DioError catch (e) {
      removeGetWidget();
      // errorToast(e.response!.data['error']);
    }
  }

  Future cancelAppointment(Appointment appointment) async {
    try {
      launchLoader();
      var response = await Dio().patch(
        '${production}appointment/cancel/${appointment.uuid}',
        options:
            Options(headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
      );

      if (response.data['status'] == true) {
        await getAppointments();
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
      removeGetWidget();
    } on DioError catch (e) {
      removeGetWidget();
      // errorToast(e.response!.data['error']);
    }
  }

  Future getAppointments() async {
    try {
      var response = await Dio().get(
        '${production}appointment/',
        options:
            Options(headers: {'Authorization': 'bearer ${getMyInfo().tokens}'}),
      );
      print(response);
      if (response.data['status'] == true) {
        var results = response.data['body'];
        var box = Boxes.getAppointments();
        box.clear().then((value) {
          for (var result in results) {
            Appointment appointment = Appointment.fromJson(result);
            appointment.localizeInfo();
          }
        });
      }
      if (response.data['status'] == false) {
        errorToast(response.data);
      }
    } on DioError catch (e) {
      errorToast(e.response!.data['message']);
    }
  }
}
