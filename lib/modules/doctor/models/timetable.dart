// ignore_for_file: avoid_print

import 'package:doctor/modules/doctor/controllers/timetable_controller.dart';
import 'package:doctor/modules/doctor/models/time.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'timetable.g.dart';

@HiveType(typeId: 10)
class Timetable {
  @HiveField(0)
  late String weekday;
  @HiveField(1)
  late String startingTime;
  @HiveField(2)
  late String endingTime;
  @HiveField(3)
  late String uuid;

  Future sendTimetable() async {
    await TimetableController().addTimetable(this);
  }

  List<Time> listOfDoctorAvailableTimes() {
    List<Time> times = [];
    TimeOfDay start = TimeOfDay(
        hour: int.parse(startingTime.split(":")[0]),
        minute: int.parse(startingTime.split(":")[1]));
    TimeOfDay end = TimeOfDay(
        hour: int.parse(endingTime.split(":")[0]),
        minute: int.parse(endingTime.split(":")[1]));
    DateTime startDate = DateTime(2023, 1, 1, start.hour, start.minute);
    DateTime endDate = DateTime(2023, 1, 1, end.hour, end.minute);
    int differenceInMinutes = endDate.difference(startDate).inMinutes;
    print(differenceInMinutes);
    for (var i = 0; i < differenceInMinutes; i = i + 30) {
      var newDate = startDate.add(Duration(minutes: i));
      print(newDate);
      times.add(Time(newDate.hour, newDate.minute));
    }
    times.add(Time(end.hour, end.minute));

    return times;
  }

  Timetable();
  Timetable.fromJson(Map<String, dynamic> json) {
    weekday = json['weekday'];
    startingTime = json['startingTime'];
    endingTime = json['endingTime'];
    uuid = json['uuid'];
  }
}
