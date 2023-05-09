import 'package:doctor/includes/custom_heading.dart';
import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Widget pillIcons(String text, bool outlined, {double? padding, double? width}) {
  Color contentColor =
      outlined ? BrandColor.main_color : BrandColor.in_background;

  return Padding(
    padding: const EdgeInsets.only(right: 5),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: outlined ? BrandColor.in_background : BrandColor.main_color,
          border: Border.all(color: BrandColor.main_color)),
      width: width ?? 65,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: padding ?? 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: contentColor,
              size: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            customHeading(text, 13, null, contentColor)
          ],
        ),
      ),
    ),
  );
}
