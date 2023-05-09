// ignore_for_file: unnecessary_import, import_of_legacy_library_into_null_safe, unused_import

import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/family/widget/medical_option.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget appointment() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customHeading("Dr. Charollate backer", 16),
                customHint("Peditrician"),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Octicons.star,
                          color: Colors.orange,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customHint("Rating"),
                            customHeading("4.58 out of 5", 16)
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          customAvatar(100, Photos.pic1, radius: 20)
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Center(
              child: Row(
                children: [
                  medicalOption(false,
                      iconData: Octicons.calendar,
                      name: "Monday, Dec 23",
                      opacity: 0),
                  medicalOption(false,
                      iconData: Octicons.clock, name: "12:00-13:00", opacity: 0)
                ],
              ),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child:
                  customButton("Reschedule", BrandColor.main_color, null, 40)),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: customButton("Cancel", BrandColor.in_background,
                BrandColor.main_color, 40, null, BrandColor.main_color),
          )
        ],
      )
    ],
  );
}
