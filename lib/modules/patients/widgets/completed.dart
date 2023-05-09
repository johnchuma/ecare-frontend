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

Widget completed(String image, String? typeName, IconData? icon) {
  return GestureDetector(
    onTap: () {
      // Get.to(() =>  ChatPage());
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
                Row(
                  children: [
                    customText(typeName!, null, 12),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.green)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: customText("Completed", Colors.green, 12),
                      ),
                    ),
                  ],
                ),
                customHint("Today  |  16:50PM", null, null, 12),
              ],
            ),
            const Spacer(),
            ClipOval(
              child: Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Icon(
                    icon,
                    color: BrandColor.text_color,
                    size: 18,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        // Row(
        //   children: [
        //     Expanded(
        //       child: GestureDetector(
        //         onTap: () {
        //           Get.bottomSheet(
        //               backgroundColor: Colors.transparent,
        //               ClipRRect(
        //                 borderRadius: const BorderRadius.only(
        //                     topLeft: Radius.circular(30),
        //                     topRight: Radius.circular(30)),
        //                 child: Container(
        //                   color: Colors.white,
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(20),
        //                     child: SingleChildScrollView(
        //                       child: Column(
        //                         children: [
        //                           customHeading(
        //                               "Cancel appointment", 18, null, Colors.red),
        //                           const SizedBox(
        //                             height: 20,
        //                           ),
        //                           customText(
        //                               "Esse quis cupidatat non tempor duis. Ex anim non quis excepteur aute. ",
        //                               null,
        //                               13,
        //                               TextAlign.center),
        //                           const SizedBox(
        //                             height: 20,
        //                           ),
        //                           customText(
        //                               "Esse quis cupidatat non tempor duis. Ex anim non quis excepteur aute. ",
        //                               null,
        //                               13,
        //                               TextAlign.center),
        //                           const SizedBox(
        //                             height: 20,
        //                           ),
        //                           Row(
        //                             children: [
        //                               Expanded(
        //                                 child: customButton(
        //                                     "Back",
        //                                     BrandColor.main_color
        //                                         .withOpacity(0.1),
        //                                     BrandColor.main_color,
        //                                     null,
        //                                     null,
        //                                     BrandColor.in_background),
        //                               ),
        //                               const SizedBox(
        //                                 width: 20,
        //                               ),
        //                               Expanded(
        //                                 child: customButton(
        //                                     "Yes cancel",
        //                                     BrandColor.main_color,
        //                                     BrandColor.in_background),
        //                               ),
        //                             ],
        //                           )
        //                         ],
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ));
        //         },
        //         child: customButton(
        //             "Cancel appointment",
        //             BrandColor.in_background,
        //             BrandColor.main_color,
        //             35,
        //             12,
        //             BrandColor.main_color),
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 25,
        //     ),
        //     Expanded(
        //       child: GestureDetector(
        //         onTap: () {
        //           Get.to(() => const RescheduleAppontment());
        //         },
        //         child: customButton("Reschedule", BrandColor.main_color,
        //             BrandColor.in_background, 35, 12, BrandColor.main_color),
        //       ),
        //     ),
        //   ],
        // ),
        const SizedBox(
          height: 20,
        )
      ],
    ),
  );
}
