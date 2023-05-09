// ignore_for_file: unused_import

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/appointment/reschedue_appointment.dart';
import 'package:doctor/modules/chat/pages/chat_page.dart';
import 'package:doctor/modules/doctor/pages/appointment_page.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget historyDoctorProfile(String image, String? typeName, IconData? icon) {
  return GestureDetector(
    onTap: () {
      // Get.to(() => const ChatPage());
    },
    child: Column(
      children: [
        Row(
          children: [
            ClipOval(
              child: SizedBox(
                  height: 70,
                  width: 70,
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customHeading("Br Drake Boston", 16),
                customHint("My pleasure all the best for...", null, null, 12),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [customText("Today"), customHint("12:30AM")],
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    ),
  );
}
