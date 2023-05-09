// ignore_for_file: non_constant_identifier_names

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/includes/pill.dart';
import 'package:doctor/modules/doctor/models/timetable.dart';
import 'package:doctor/utils/toasts.dart';
import 'package:flutter/material.dart';

class AddWeekdaySchedule extends StatefulWidget {
  const AddWeekdaySchedule({super.key});

  @override
  State<AddWeekdaySchedule> createState() => _AddWeekdayScheduleState();
}

class _AddWeekdayScheduleState extends State<AddWeekdaySchedule> {
  String selectedDay = "";
  TimeOfDay? starting_time;
  TimeOfDay? ending_time;
  List days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Suturday",
    "Sunday"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customHeading("Add timetable", 16),
                  GestureDetector(
                    onTap: () {
                      if (starting_time != null &&
                          ending_time != null &&
                          selectedDay != "") {
                        Timetable timetable = Timetable();
                        timetable.endingTime =
                            "${ending_time?.hour.toString().padLeft(2, '0')}:${ending_time?.minute.toString().padLeft(2, '0')}";
                        timetable.startingTime =
                            "${starting_time?.hour.toString().padLeft(2, '0')}:${starting_time?.minute.toString().padLeft(2, '0')}";
                        timetable.weekday = selectedDay;
                        timetable.sendTimetable();
                      } else {
                        errorToast("Please select all asked informations");
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: pill('Save', active: true),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              customText("Choose day", null, 12),
              const SizedBox(
                height: 5,
              ),
              Wrap(
                children: days
                    .map((day) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDay = day;
                          });
                        },
                        child: pill(day, active: day == selectedDay)))
                    .toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      customText("Available from", null, 12),
                      customHeading(
                        starting_time == null
                            ? "Not set"
                            : "${starting_time?.hour}:${starting_time?.minute}",
                        null,
                        null,
                      )
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        Future<TimeOfDay?> time = showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        time.then((value) => {
                              setState(() {
                                starting_time = value;
                              })
                            });
                      },
                      child: customHeading("Set time", 14))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      customText("Availbility end", null, 12),
                      customHeading(
                        ending_time == null
                            ? "Not set"
                            : "${ending_time?.hour}:${ending_time?.minute}",
                        null,
                        null,
                      )
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        Future<TimeOfDay?> time = showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        time.then((value) => {
                              setState(() {
                                ending_time = value;
                              })
                            });
                      },
                      child: customHeading("Set time", 14))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
