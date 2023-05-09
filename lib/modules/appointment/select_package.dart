// ignore_for_file: import_of_legacy_library_into_null_safe, must_be_immutable, unused_import, sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_form.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_select.dart';
import 'package:doctor/modules/authentication/models/user.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/modules/doctor/models/package.dart';
import 'package:doctor/modules/patients/pages/models/appointment.dart';
import 'package:doctor/modules/patients/pages/patient_details.dart';
import 'package:doctor/modules/patients/widgets/packages.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class SelectPackage extends StatefulWidget {
  Appointment appointment;
  SelectPackage(this.appointment, {super.key});

  @override
  State<SelectPackage> createState() => _SelectPackageState();
}

class _SelectPackageState extends State<SelectPackage> {
  TextEditingController nameController = TextEditingController();

  String selectedPackage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.in_background,
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: backArrow(),
        title: customHeading("Select package", 18),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 90,
                child: ListView(
                  children: widget.appointment.doctor.packages
                      .map((item) => Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedPackage = item.name;
                                    widget.appointment.package = item;
                                  });
                                },
                                child: packageWidget(item,
                                    selectedValue: selectedPackage)),
                          ))
                      .toList(),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => PatientDetails(widget.appointment));
                  },
                  child: customButton(
                      "Next", BrandColor.main_color, BrandColor.in_background),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
