import 'package:flutter/material.dart';

Widget customText(String text,
    [Color? color, double? size, TextAlign? textAlign]) {
  return Text(
    text,
    textAlign: textAlign ?? TextAlign.start,
    style: TextStyle(
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        fontSize: size ?? 14),
  );
}
