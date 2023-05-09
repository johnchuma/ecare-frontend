import 'package:flutter/material.dart';

Widget customText2(String text, [FontWeight? weight, Color? color]) {
  return Text(
    text,
    style: TextStyle(
        fontWeight: weight ?? FontWeight.w400,
        color: color ?? Colors.black,
        fontSize: 13),
  );
}
