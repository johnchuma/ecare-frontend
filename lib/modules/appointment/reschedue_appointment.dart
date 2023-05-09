// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import, must_be_immutable, avoid_print

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/textarea.dart';
import 'package:doctor/modules/appointment/reschedule_appointment2.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/doctor/controllers/timetable_controller.dart';
import 'package:doctor/modules/patients/pages/models/appointment.dart';
import 'package:doctor/modules/patients/widgets/custom_radio.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/custom_dialogs.dart';
import 'package:doctor/utils/toasts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RescheduleAppontment extends StatefulWidget {
  Appointment appointment;
  RescheduleAppontment(this.appointment, {super.key});

  @override
  State<RescheduleAppontment> createState() => _RescheduleAppontmentState();
}

class _RescheduleAppontmentState extends State<RescheduleAppontment> {
  String selectedReason = "";
  TextEditingController reasonController = TextEditingController();
  void updateSchedule(String value) {
    setState(() {
      selectedReason = value;
      print(selectedReason);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: backArrow(),
        title: customHeading("Reschedule appointment", 18),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 80,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customHeading("Reason for schedule change", 17),
                      ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          "I am not available on schedule",
                          "I have an activity that can't be left behind",
                          "I don't want to tell",
                          "Others"
                        ]
                            .map((reason) => GestureDetector(
                                child: customRadio(
                                    reason, selectedReason, updateSchedule)))
                            .toList(),
                      ),
                      selectedReason == "Others"
                          ? textarea(
                              minlines: 3,
                              maxlines: 5,
                              hint: "Tell us other reason here",
                              textEditingController: reasonController)
                          : Container()
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      if (selectedReason.isNotEmpty) {
                        if (selectedReason == "Others") {
                          widget.appointment.rescheduleProblem =
                              reasonController.text;
                        } else {
                          widget.appointment.rescheduleProblem = selectedReason;
                        }
                      } else {
                        successToast("State your problem");
                      }

                      Get.to(() => RescheduleAppointment2(widget.appointment));
                    },
                    child: customButton("Next", BrandColor.main_color,
                        BrandColor.in_background),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
