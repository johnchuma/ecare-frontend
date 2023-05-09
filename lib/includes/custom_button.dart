import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Widget customButton(String text,
    [Color? color,
    Color? textColor,
    double? height,
    double? textSize,
    Color? borderColor]) {
  return Container(
      decoration: BoxDecoration(
          color: color ?? BrandColor.main_color,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: borderColor ?? BrandColor.in_background)),
      height: height ?? 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: textColor ?? BrandColor.in_background,
                fontSize: textSize ?? 13,
                fontWeight: FontWeight.w900),
          ),
        ),
      ));
}
