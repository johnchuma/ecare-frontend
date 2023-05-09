import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Widget pill(String text,
    {bool? active, Color? bg, Color? txt, double? verticalPadding}) {
  return Padding(
    padding: const EdgeInsets.only(right: 5, bottom: 5),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        color: active == true ? BrandColor.main_color : bg ?? Colors.grey[200],
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 15, vertical: verticalPadding ?? 7),
            child: Text(
              text,
              style: TextStyle(
                  color: active == true ? Colors.white : txt ?? Colors.black,
                  fontSize: 12),
            )),
      ),
    ),
  );
}
