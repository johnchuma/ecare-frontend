// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/authentication/widgets/back_arrow.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../../includes/custom_heading.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColor.in_background,
        elevation: 0,
        // ignore: prefer_const_constructors
        leading: backArrow(),
        title: customHeading("My appointments", 20),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customHint("Appointment ID #"),
                customHeading("20583", 13, null, Colors.green)
              ],
            ),
            Row(
              children: [
                Container(
                  width: 7,
                  height: 7,
                  color: Colors.green.withOpacity(0.5),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 2,
                    color: Colors.green.withOpacity(0.5),
                  ),
                ),
                ClipOval(
                  child: Container(
                    height: 20,
                    width: 20,
                    color: Colors.green.withOpacity(0.5),
                    child: const Center(
                      child: Icon(
                        Icons.video_call,
                        color: Colors.white,
                        size: 10,
                      ),
                    ),
                  ),
                )
              ],
            ),
            customHeading(
              "Payment panding",
              19,
              null,
              Colors.green,
            ),
            customText(
                "Your appointment for patient John Chuma has been set. to confirm this appointment please pay",
                null,
                12,
                TextAlign.center),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText("Hit the ", null, 12, TextAlign.center),
                customHeading(
                    "confirm ", 14, TextAlign.center, BrandColor.main_color),
                customText("Button", null, 12, TextAlign.center),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.green.withOpacity(0.2),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 2),
                          child: Column(
                            children: [
                              customHeading("27", null, null, Colors.green),
                              customHint('Apr')
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customHint("Monday"),
                        customHeading("10:30pm", 16)
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          color: Colors.green.withOpacity(0.2),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            child: Icon(
                              MaterialCommunityIcons.tag,
                              color: Colors.green,
                            ),
                          )),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customHint("Fee"),
                        customHeading("\$200 ", 16)
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customHint("Patient"),
                    customHeading("Anisa ques", 16)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customHint("Female"),
                    customHeading("17 years", 16)
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              color: Colors.orange.withOpacity(0.1),
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customHeading("Additional details", 16),
                      customHint(
                          "I am having fever and cold enough for last 3 days")
                    ],
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                customAvatar(70, "https://picsum.photos/310"),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customHeading("Dr france", 16),
                      customHint("MBBS HT assistant"),
                      customHint("Proffesor of malawi college")
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: customButton("Confirm", BrandColor.main_color,
                      BrandColor.in_background, 40, 13),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: customButton("Reschudule", BrandColor.main_color,
                      BrandColor.in_background, 40, 13),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: customButton("Decline", BrandColor.main_color,
                      BrandColor.in_background, 40, 13),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
