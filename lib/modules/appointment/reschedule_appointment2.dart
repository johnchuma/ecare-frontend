// ignore_for_file: import_of_legacy_library_into_null_safe, must_be_immutable, unused_import, sized_box_for_whitespace, unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_form.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/patients/pages/models/appointment.dart';
import 'package:doctor/modules/patients/widgets/doctor_time.dart';
import 'package:doctor/modules/patients/widgets/icon_background.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/custom_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RescheduleAppointment2 extends StatefulWidget {
  Appointment appointment;
  RescheduleAppointment2(this.appointment, {super.key});

  @override
  State<RescheduleAppointment2> createState() => _RescheduleAppointment2State();
}

class _RescheduleAppointment2State extends State<RescheduleAppointment2> {
  TextEditingController nameController = TextEditingController();
  DateFormat format = DateFormat.MMMMEEEEd();
  DateTime selectDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        leadingWidth: 40,
        title: customHeading("Reschedule appointment", 18),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 100,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      customHeading("Select date", 15),
                      const SizedBox(
                        height: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 250,
                          color: BrandColor.main_color.withOpacity(0.05),
                          child: CalendarDatePicker(
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 256)),
                              onDateChanged: ((value) {
                                setState(() {
                                  selectDate = value;
                                });
                              })),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      customHeading("Select time ", 15),
                      const SizedBox(
                        height: 10,
                      ),
                      widget.appointment.package.doctor.timetables.isNotEmpty
                          ? widget.appointment.package.doctor.timetables
                                  .where((item) =>
                                      item.weekday ==
                                      format
                                          .format(selectDate)
                                          .split(",")
                                          .first)
                                  .isNotEmpty
                              ? Wrap(
                                  spacing: 45,
                                  children: widget
                                      .appointment.package.doctor.timetables
                                      .where((item) =>
                                          item.weekday ==
                                          format
                                              .format(selectDate)
                                              .split(",")
                                              .first)
                                      .first
                                      .listOfDoctorAvailableTimes()
                                      .map((time) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              widget.appointment.startingTime =
                                                  DateTime(
                                                      selectDate.year,
                                                      selectDate.month,
                                                      selectDate.day,
                                                      time.hour,
                                                      time.minute);
                                            });
                                          },
                                          child: widget.appointment
                                                      .startingTime ==
                                                  null
                                              ? Container()
                                              : doctorTime(time,
                                                  active: "${widget.appointment.startingTime.hour.toString().padLeft(2, "0")}${widget.appointment.startingTime.minute.toString().padLeft(2, "0")}" ==
                                                      "${time.hour.toString().padLeft(2, "0")}${time.minute.toString().padLeft(2, "0")}")))
                                      .toList())
                              : Container()
                          : Container(),
                      const SizedBox(
                        height: 70,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    widget.appointment.rescheduleAppointment();
                  },
                  child: customButton("Reschedule", BrandColor.main_color,
                      BrandColor.in_background),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
