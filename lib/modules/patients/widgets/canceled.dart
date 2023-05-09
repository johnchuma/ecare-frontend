// ignore_for_file: unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/appointment/reschedue_appointment.dart';
import 'package:doctor/modules/doctor/pages/appointment_page.dart';
import 'package:doctor/modules/patients/pages/models/appointment.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget canceled(Appointment appointment) {
  return GestureDetector(
    onTap: () {
      // Get.to(() => const AppointmentPage());
    },
    child: Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CachedNetworkImage(
                    imageUrl: appointment.package.doctor.image,
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customHeading(appointment.package.doctor.name, 16),
                Row(
                  children: [
                    customText(appointment.package.name, null, 12),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: customText("Canceled", Colors.red, 12),
                      ),
                    ),
                  ],
                ),
                customHint("Today  |  16:50PM", null, null, 12),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                ClipOval(
                  child: Container(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Icon(
                        appointment.package.packageIcon(),
                        color: BrandColor.text_color,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: customButton("Canceled", BrandColor.in_background,
                  BrandColor.main_color, 35, 12, BrandColor.main_color),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    ),
  );
}
