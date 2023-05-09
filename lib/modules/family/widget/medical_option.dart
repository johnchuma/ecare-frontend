// ignore_for_file: import_of_legacy_library_into_null_safe, unused_import

import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget medicalOption(
  bool active, {
  IconData? iconData,
  String? name,
  double? opacity,
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 5, left: 5, bottom: 6),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 150,
        color: active ? BrandColor.main_color : Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
              ),
              Icon(
                iconData ?? Octicons.broadcast,
                size: 16,
                color: active ? Colors.white : BrandColor.main_color,
              ),
              const SizedBox(
                width: 20,
              ),
              customText(
                  name ?? "Persicription", active ? Colors.white : null, 13)
            ],
          ),
        ),
      ),
    ),
  );
}
