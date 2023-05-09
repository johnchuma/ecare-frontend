// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import

import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/modules/doctor/widgets/pill_icons.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:doctor/utils/photos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget review(String profilePic, String description) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(
      children: [
        Row(
          children: [
            customAvatar(40, profilePic),
            const SizedBox(
              width: 5,
            ),
            customHeading("Charliote mandes", 16),
            const Spacer(),
            pillIcons("5", true, padding: 3, width: 50),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              AntDesign.message1,
              size: 20,
            )
          ],
        ),
        customText(description, null, 13),
        Row(
          children: [
            Icon(
              Icons.favorite,
              size: 20,
              color: BrandColor.main_color,
            ),
            const SizedBox(
              width: 5,
            ),
            customText("928", null, 13),
            const SizedBox(
              width: 20,
            ),
            customHint("4 days ago")
          ],
        ),
      ],
    ),
  );
}
