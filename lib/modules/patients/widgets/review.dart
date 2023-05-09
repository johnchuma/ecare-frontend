// ignore_for_file: unnecessary_import, import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_avatar.dart';
import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget review() {
  return Column(
    children: [
      Row(
        children: [
          customAvatar(30, "https://picsum.photos/300"),
          const SizedBox(
            width: 5,
          ),
          customHeading("Cherlses maria", 16),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: BrandColor.main_color)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 15,
                    color: BrandColor.main_color,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  customText("2", BrandColor.main_color, 11)
                ],
              ),
            ),
          ),
          const Icon(MaterialCommunityIcons.dots_horizontal)
        ],
      ),
      customHint(
          "Reprehenderit quis elit laborum excepteur nulla. Deserunt anim nisi proident Lorem magna "),
    ],
  );
}
