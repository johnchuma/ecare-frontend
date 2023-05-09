// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_button.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/emergency/widgets/rating_widget.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget emergencyWidget(String title, String service, String image) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Column(
      children: [
        Row(
          children: [
            customAvatar(50, image),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customHeading(title, 16),
                  customText(service, null, 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ratingWIdget("Rating", "4.8 out of 5"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            MaterialCommunityIcons.map_marker,
                            size: 18,
                            color: BrandColor.main_color,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          customHeading("5 Km", 13)
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            Expanded(child: customButton("Call", null, null, 35)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: customButton(
                    "SMS",
                    BrandColor.main_color.withOpacity(0.2),
                    BrandColor.main_color,
                    35))
          ],
        )
      ],
    ),
  );
}
