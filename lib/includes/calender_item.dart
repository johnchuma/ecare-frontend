import 'package:doctor/includes/custom_hint.dart';
import 'package:doctor/includes/cutome_text2.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Widget calenderItem(String date, String name, bool active) {
  return Padding(
    padding: const EdgeInsets.only(right: 2),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: active ? BrandColor.main_color : Colors.grey.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
          child: Column(
            children: [
              customText2(date, FontWeight.w800, active ? Colors.white : null),
              active ? customText2(name, null, Colors.white) : customHint(name)
            ],
          ),
        ),
      ),
    ),
  );
}
