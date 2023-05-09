import 'package:doctor/includes/custom_text.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Widget productCategory(String text, bool active) {
  return Padding(
    padding: const EdgeInsets.only(right: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: active ? BrandColor.main_color : Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          child: customText(text,
              active ? BrandColor.in_background : BrandColor.text_color, 12),
        ),
      ),
    ),
  );
}
