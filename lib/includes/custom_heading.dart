import 'package:flutter/material.dart';

Widget customHeading(String text,
    [double? size,
    TextAlign? textAlign,
    Color? textColor,
    FontWeight? fontWeight,
    TextDecoration? textDecoration]) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w600,
        decoration: textDecoration ?? TextDecoration.none,
        color: textColor ?? Colors.black,
        fontSize: size ?? 20),
  );
}
