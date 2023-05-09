// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget recentSearch(String name) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      customHeading(name, 16, null, null, FontWeight.w400),
      const Spacer(),
      const Icon(
        MaterialCommunityIcons.arrow_expand,
        color: Colors.black54,
        size: 20,
      )
    ],
  );
}
