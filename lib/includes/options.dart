// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/utils/brand_colors.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget option(String text, {Color? color}) {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 2),
    child: Column(
      children: [
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(100),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(
              MaterialCommunityIcons.medical_bag,
              color: color ?? BrandColor.main_color,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        customHint(text)
      ],
    ),
  );
}
