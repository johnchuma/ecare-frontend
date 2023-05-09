// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget document() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Row(
          children: [
            Icon(
              AntDesign.pdffile1,
              color: BrandColor.text_color,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customHeading("Title", 16),
                customHint("Here is the subtitle")
              ],
            ),
            const Spacer(),
            const Icon(Icons.download)
          ],
        ),
      ),
    ),
  );
}
