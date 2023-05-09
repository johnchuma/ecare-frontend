import 'package:flutter/material.dart';

Widget customHint(String text,
    [TextAlign? alignment, Color? color, double? size]) {
  return Text(text,
      textAlign: alignment ?? TextAlign.start,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          color: color ?? Colors.black54,
          fontSize: size ?? 12));
}
