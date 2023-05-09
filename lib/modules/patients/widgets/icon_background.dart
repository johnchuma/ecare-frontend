import 'package:doctor/utils/brand_colors.dart';
import 'package:flutter/material.dart';

Widget iconBackground(IconData? iconData,
    {Color? iconColor, Color? background, double? padding, double? iconSize}) {
  return ClipOval(
    child: Container(
      color: background ?? BrandColor.main_color,
      child: Padding(
        padding: EdgeInsets.all(padding ?? 25),
        child: Icon(
          iconData,
          color: iconColor ?? Colors.white,
          size: iconSize ?? 30,
        ),
      ),
    ),
  );
}
