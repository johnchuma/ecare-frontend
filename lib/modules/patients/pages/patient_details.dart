// ignore_for_file: import_of_legacy_library_into_null_safe, must_be_immutable, unused_import, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_form.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_select.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/appointment/select_payment.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/family/widget/appointment.dart';
import 'package:doctor/modules/family/widget/family_form.dart';
import 'package:doctor/modules/patients/pages/models/appointment.dart';
import 'package:doctor/modules/patients/widgets/packages.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class PatientDetails extends StatefulWidget {
  Appointment appointment;
  PatientDetails(this.appointment, {super.key});

  @override
  State<PatientDetails> createState() => _PatientDetailsState();
}

class _PatientDetailsState extends State<PatientDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController problemController = TextEditingController();
  int newDuration = 0;
  @override
  void initState() {
    newDuration = widget.appointment.package.duration;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: backArrow(),
        title: customHeading("Patient details", 18),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        customText("Session price for"),
                        const Spacer(),
                        ClipOval(
                          child: Container(
                            color: Colors.grey[0],
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (newDuration >
                                        widget.appointment.package.duration) {
                                      newDuration = newDuration - 5;
                                      widget.appointment.duration = newDuration;
                                    }
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: BrandColor.main_color,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        customHeading("$newDuration Mins", 15),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipOval(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                newDuration = newDuration + 5;
                              });
                            },
                            child: Container(
                              color: Colors.grey[0],
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(
                                  Icons.add,
                                  color: BrandColor.main_color,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    customHeading(
                        "${(widget.appointment.package.price * newDuration / widget.appointment.package.duration).ceil()} dollars"),
                    const SizedBox(
                      height: 20,
                    ),
                    familyForm("Problem", "Type your problem here",
                        textEditingController: problemController, maxLines: 10),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    widget.appointment.problem = problemController.text;
                    widget.appointment.addAppointment();
                    // Get.to(() => SelectPayment());
                  },
                  child: customButton("Submit", BrandColor.main_color,
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
