import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Widget productCategoryPill(String text, bool active) {
  return Padding(
    padding: const EdgeInsets.only(right: 3, bottom: 3),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          color: active ? BrandColor.main_color : Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: Text(
              text,
              style: TextStyle(
                  color: active
                      ? BrandColor.in_background
                      : BrandColor.text_color),
            ),
          )),
    ),
  );
}
