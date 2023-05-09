// ignore_for_file: import_of_legacy_library_into_null_safe, camel_case_types

import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/patients/pages/patient_index.dart';
import 'package:doctor/modules/patients/widgets/icon_background.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

class customDialog {
  static appointmentSuccess() {
    Get.defaultDialog(
        title: "",
        titlePadding: const EdgeInsets.all(0),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ClipOval(
                child: Container(
                  color: BrandColor.main_color,
                  child: const Padding(
                    padding: EdgeInsets.all(25),
                    child: Icon(
                      MaterialCommunityIcons.calendar,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              customHeading("Congratulations", 20, TextAlign.center,
                  BrandColor.text_color),
              const SizedBox(
                height: 10,
              ),
              customText(
                  "Appointment is successfully booked, you will recieve and the doctor you selected will contact you",
                  null,
                  12,
                  TextAlign.center),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const PatientIndex());
                },
                child: customButton("view appointment", BrandColor.main_color,
                    BrandColor.in_background, null, 13),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: customButton(
                    "Cancel", Colors.grey[200], BrandColor.main_color),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }

  static appointmentFailed() {
    Get.defaultDialog(
        title: "",
        titlePadding: const EdgeInsets.all(0),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ClipOval(
                child: Container(
                  color: Colors.red,
                  child: const Padding(
                    padding: EdgeInsets.all(25),
                    child: Icon(
                      MaterialCommunityIcons.close,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              customHeading("Oops! failed", 20, TextAlign.center, Colors.red),
              const SizedBox(
                height: 10,
              ),
              customText(
                  "Appointment failed, please check your internet connection then try again",
                  null,
                  12,
                  TextAlign.center),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: customButton("Try again", BrandColor.main_color,
                    BrandColor.in_background),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: customButton(
                    "Cancel", Colors.grey[200], BrandColor.main_color),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }

  static cancelAppointment() {
    Get.defaultDialog(
        title: "",
        titlePadding: const EdgeInsets.all(0),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ClipOval(
                child: Container(
                  color: BrandColor.main_color,
                  child: const Padding(
                    padding: EdgeInsets.all(25),
                    child: Icon(
                      AntDesign.checksquare,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              customHeading("Cancel appointment success", 20, TextAlign.center,
                  BrandColor.main_color),
              const SizedBox(
                height: 10,
              ),
              customText(
                  "We are very sad that you have to cancel your appointment. We will always improve our services to improve our services to satisify you in the next appointment",
                  null,
                  12,
                  TextAlign.center),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: customButton(
                    "Ok", BrandColor.main_color, BrandColor.in_background),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }

  static writeReview() {
    Get.defaultDialog(
        title: "",
        titlePadding: const EdgeInsets.all(0),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              iconBackground(MaterialCommunityIcons.star),
              const SizedBox(
                height: 20,
              ),
              customHeading("Review successfully", 20, TextAlign.center,
                  BrandColor.main_color),
              const SizedBox(
                height: 10,
              ),
              customText(
                  "Your review has been successfully submitted. thank you very much",
                  null,
                  12,
                  TextAlign.center),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: customButton(
                    "Ok", BrandColor.main_color, BrandColor.in_background),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }

  static reschuduleAppointmet() {
    Get.defaultDialog(
        title: "",
        titlePadding: const EdgeInsets.all(0),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              ClipOval(
                child: Container(
                  color: BrandColor.main_color,
                  child: const Padding(
                    padding: EdgeInsets.all(25),
                    child: Icon(
                      AntDesign.checksquare,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              customHeading("Cancel appointment success", 20, TextAlign.center,
                  BrandColor.main_color),
              const SizedBox(
                height: 10,
              ),
              customText(
                  "We are very sad that you have to cancel your appointment. We will always improve our services to improve our services to satisify you in the next appointment",
                  null,
                  12,
                  TextAlign.center),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: customButton(
                    "Ok", BrandColor.main_color, BrandColor.in_background),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
